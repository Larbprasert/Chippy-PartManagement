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
import th.co.tpcc.model.InvClaimHistory;
import th.co.tpcc.service.ClaimService;

@RestController
@RequestMapping("/claim")
public class ClaimManageCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ClaimService claimService;
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<InvClaimHistory> getDataTable(@ModelAttribute("invClaimHistory") InvClaimHistory invClaimHistory) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<InvClaimHistory> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = claimService.getDataTable(invClaimHistory);
		return dataTableAjax;
	}
	
	@RequestMapping("/claimEdit.htm")
	public ModelAndView claimEdit(String claimId) {
		logger.info(" claimEdit : "+claimId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("claim_manage_edit");
		
		mav.addObject("LOV_CLAIM_STATUS",ApplicationCache.getLovByType("CLAIM_TYPE"));
		mav.addObject("LOV_ASSET",ApplicationCache.getLovAsset());
		mav.addObject("LOV_OWNER",ApplicationCache.getLovOwner());
		mav.addObject("LOV_SYS_USERS",ApplicationCache.getLovUsers());

		
		InvClaimHistory invClaimHistory =  new InvClaimHistory();
		if(StringUtils.isNotEmpty(claimId)){
			invClaimHistory =  claimService.getById(claimId);
		}
		
		mav.addObject("invClaimHistory", invClaimHistory);
		
		return mav;
	}
	
	@RequestMapping("/claimPopup.htm")
	public ModelAndView claimPopup(String claimId) {
		ModelAndView mav = claimEdit(claimId);
		mav.setViewName("claim_popup");
		return mav;
	}
	
	@RequestMapping("/claimSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("invClaimHistory") InvClaimHistory invClaimHistory) {
		claimService.saveOrUpdate(invClaimHistory);
		RedirectView rv = new RedirectView();
	    rv.setUrl("claimEdit.htm?status=S&edit=Y&claimId="+invClaimHistory.getClaimId());
	    return rv;
	}
}
