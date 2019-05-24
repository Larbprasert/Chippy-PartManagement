package th.co.tpcc.controller.manage;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.InvAsset;
import th.co.tpcc.model.InvAssetHistory;
import th.co.tpcc.model.SheDept;
import th.co.tpcc.model.SysParam;
import th.co.tpcc.service.AssetService;
import th.co.tpcc.service.AssetmanageService;
import th.co.tpcc.service.SysParamService;

@RestController
@RequestMapping("/assetmanage")
public class AssetManageCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AssetmanageService assetmanageService ;
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<InvAssetHistory> getDataTable(@ModelAttribute("invAssetHistory") InvAssetHistory invAssetHistory) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<InvAssetHistory> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = assetmanageService.getDataTable(invAssetHistory);
		return dataTableAjax;
	}
	
	@RequestMapping("/assetEdit.htm")
	public ModelAndView assetEdit(String assetOwnerId) {
		logger.info(" assetEdit : "+assetOwnerId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_manage_edit");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		mav.addObject("LOV_ASSET",ApplicationCache.getLovAsset());
		mav.addObject("LOV_OWNER",ApplicationCache.getLovOwner());

		
		InvAssetHistory invAssetHistory =  new InvAssetHistory();
		if(StringUtils.isNotEmpty(assetOwnerId)){
			invAssetHistory =  assetmanageService.getById(assetOwnerId);
		}
		
		mav.addObject("invAssetHistory", invAssetHistory);
		
		return mav;
	}
	
	@RequestMapping("/assetPopup.htm")
	public ModelAndView assetPopup(String assetOwnerId) {
		ModelAndView mav = assetEdit(assetOwnerId);
		mav.setViewName("asset_manage_popup");
		return mav;
	}
	
	@RequestMapping("/assetSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("invAssetHistory") InvAssetHistory invAssetHistory) {
		
		assetmanageService.saveOrUpdate(invAssetHistory);
		RedirectView rv = new RedirectView();
	    rv.setUrl("assetEdit.htm?status=S&edit=Y&assetOwnerId="+invAssetHistory.getAssetOwnerId());
	    return rv;
	}
	
}
