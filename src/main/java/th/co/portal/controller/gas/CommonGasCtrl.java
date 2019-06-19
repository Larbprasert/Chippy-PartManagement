package th.co.portal.controller.gas;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.portal.service.gas.GasRegisteredService;
import th.co.portal.service.gas.GasRequestService;

@RestController
@RequestMapping("/gas/")
public class CommonGasCtrl {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//	private Gson gson = new Gson();
	
	@Autowired
	private GasRegisteredService service ;
	
	@Autowired
	private GasRequestService serviceReq ;
	
	@RequestMapping("gas_registered_list.htm")
	public ModelAndView gas_registered_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_registered_list");
		
//		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
//		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
//		mav.addObject("LOV_EQUIPMENT_TYPE",ApplicationCache.getLovByType("EQUIPMENT_TYPE"));
//		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		
		String roleSup = "ROLE_GAS_SUP";
		String roleSec = "ROLE_GAS_SEC_MNG";
		String roleRep = "ROLE_GAS_USER";
		
		
		List<UserProfile> supList = service.queryUserByRole(roleSup);
		List<UserProfile> secList = service.queryUserByRole(roleSec);
		List<UserProfile> repList = service.queryUserByRole(roleRep);
		List<UserProfile> allList = service.queryUserByRole(null);
		
		 mav.addObject("LOV_SUP_LIST",  supList);
		 mav.addObject("LOV_SEC_LIST",  secList);
		 mav.addObject("LOV_REP_LIST",  repList);
		 mav.addObject("LOV_USR_ALL_LIST",  allList);
		 
		 
		return mav; 
	}
	
	@RequestMapping("gas_history_list.htm")
	public ModelAndView gas_history_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_history_list");
		
//		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
//		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
//		mav.addObject("LOV_EQUIPMENT_TYPE",ApplicationCache.getLovByType("EQUIPMENT_TYPE"));
//		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
//		
		return mav;
	}
	
	@RequestMapping("gas_history_detail.htm")
	public ModelAndView gas_history_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_history_detail");
		return mav;
	}
	
	@RequestMapping("gas_certificate_list.htm")
	public ModelAndView gas_certificate_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_certificate_list");
		
//		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
//		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
//		mav.addObject("LOV_EQUIPMENT_TYPE",ApplicationCache.getLovByType("EQUIPMENT_TYPE"));
//		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		
		return mav;
	}
	
	@RequestMapping("gas_requested_new.htm")
	public ModelAndView gas_requested_new(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_requested_new");
		
		UserProfile profile= UserLoginUtils.getCurrentUser().getUserProfile().getProfile();
		
//		mav.addObject("USER_PROFILE", profile);
		Gson gson = new Gson();

		
		mav.addObject("USER_EQUIPMENT_REQ", serviceReq.getUserEquipmentCreate(profile.getUserId()));
		mav.addObject("USER_EQUIPMENT_JSON", gson.toJson(serviceReq.getUserEquipmentCreate(profile.getUserId())));
		
		List<UserProfile> allList = service.queryUserByRole(null);
		
		 mav.addObject("LOV_USR_ALL_LIST",  allList);
		 
		
		return mav;
	}
	
	@RequestMapping("gas_requested_list.htm")
	public ModelAndView gas_requested_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_requested_list");
		
//		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
//		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
//		mav.addObject("LOV_EQUIPMENT_TYPE",ApplicationCache.getLovByType("EQUIPMENT_TYPE"));
//		mav.addObject("LOV_REQUEST_STATUS",ApplicationCache.getLovByType("REQUEST_STATUS"));
//		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		
		return mav;
	}
	
//	@RequestMapping(value ="gas_requested_detail.htm", method = RequestMethod.GET)
//	public ModelAndView gas_request_detail(HttpServletRequest httpRequest,@RequestParam("id") String id) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("requestedId", id);
//		
//		mav.setViewName("gas_requested_detail");
//		return mav;
//	}
	
	@RequestMapping("gas_requested_list_adm.htm")
	public ModelAndView gas_requested_list_adm(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_requested_list_adm");
		return mav;
	}
	
	@RequestMapping("gas_approve_list.htm")
	public ModelAndView gas_approve_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_approve_list");
		return mav;
	}
	
	@RequestMapping("gas_approve_detail.htm")
	public ModelAndView gas_approve_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_approve_detail");
		return mav;
	}
	@RequestMapping("gas_received_list.htm")
	public ModelAndView gas_received_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_received_list");
		return mav;
	}
	
	@RequestMapping("gas_received_detail.htm")
	public ModelAndView gas_received_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_received_detail");
		return mav;
	}

}
