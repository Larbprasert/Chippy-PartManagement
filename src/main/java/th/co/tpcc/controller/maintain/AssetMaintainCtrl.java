package th.co.tpcc.controller.maintain;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.InvAsset;
import th.co.tpcc.model.SysParam;
import th.co.tpcc.service.AssetService;

@RestController
@RequestMapping("/asset")
public class AssetMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AssetService assetService ;
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<InvAsset> getDataTable(@ModelAttribute("invAsset") InvAsset invAsset) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<InvAsset> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = assetService.getDataTable(invAsset);
		return dataTableAjax;
	}
	
	@RequestMapping("/assetEdit.htm")
	public ModelAndView assetEdit(String assetId) {
		logger.info(" assetEdit : "+assetId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_edit");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		mav.addObject("LOV_WARRANTY_TYPE",ApplicationCache.getLovByType("WARRANTY_TYPE"));
		mav.addObject("LOV_BRAND",ApplicationCache.getLovByType("BRAND"));
		mav.addObject("LOV_MODEL",ApplicationCache.getLovByType("MODEL"));
		mav.addObject("LOV_HDD",ApplicationCache.getLovByType("HDD"));
		mav.addObject("LOV_RAM",ApplicationCache.getLovByType("RAM"));
		mav.addObject("LOV_CPU",ApplicationCache.getLovByType("CPU"));
		mav.addObject("LOV_OS",ApplicationCache.getLovByType("OPERATION_SYSTEM"));
		
		
		InvAsset invAsset =  new InvAsset();
		if(StringUtils.isNotEmpty(assetId)){
			invAsset =  assetService.getById(assetId);
		}
		
		mav.addObject("invAsset", invAsset);
		
		return mav;
	}
	
	@RequestMapping("/assetPopup.htm")
	public ModelAndView assetPopup(String assetId) {
		ModelAndView mav = assetEdit(assetId);
		mav.setViewName("asset_popup");
		return mav;
	}
	
	@RequestMapping(value = "/checkHostId")
	public ResponseEntity<?> checkHostId(@RequestParam String hostId) {
		try {
			logger.info(" hostId : "+hostId);
			if(!assetService.existHostId(hostId)){
				return new ResponseEntity<>("0", HttpStatus.OK);
			}else{
				return new ResponseEntity<>("99", HttpStatus.BAD_REQUEST);
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = e + " <== error";
	        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping("/assetSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("invAsset") InvAsset invAsset) {
		assetService.saveOrUpdate(invAsset);
		RedirectView rv = new RedirectView();
	    rv.setUrl("assetEdit.htm?edit=Y&status=S&assetId="+invAsset.getAssetId());
	    return rv;
	}
	
}
