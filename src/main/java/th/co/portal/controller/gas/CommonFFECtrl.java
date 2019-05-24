package th.co.portal.controller.gas;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;

@RestController
@RequestMapping("/ffe/")
public class CommonFFECtrl {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//	private Gson gson = new Gson();
	
	@RequestMapping("ffe_registered_list.htm")
	public ModelAndView ffe_registered_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gas_registered_list");
		
		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_EQUIPMENT_TYPE",ApplicationCache.getLovByType("EQUIPMENT_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.setViewName("ffe_registered_list");
		
		return mav; 
	}
	@RequestMapping("ffe_requested_detail.htm")
	public ModelAndView ffe_requested_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_requested_detail");
		
		return mav; 
	}

	@RequestMapping("ffe_history_list.htm")
	public ModelAndView ffe_history_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_history_list");
		return mav;
	}
	
	@RequestMapping("ffe_history_detail.htm")
	public ModelAndView ffe_history_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_history_detail");
		return mav;
	}
	
	@RequestMapping("ffe_certificate_list.htm")
	public ModelAndView ffe_certificate_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_certificate_list");
		return mav;
	}
	
	@RequestMapping("ffe_requested_new.htm")
	public ModelAndView ffe_requested_new(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_requested_new");
		return mav;
	}
	
	@RequestMapping("ffe_requested_list.htm")
	public ModelAndView ffe_requested_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_requested_list");
		return mav;
	}
	
	@RequestMapping("ffe_requested_list_adm.htm")
	public ModelAndView ffe_requested_list_adm(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_requested_list_adm");
		return mav;
	}
	
	@RequestMapping("ffe_approve_list.htm")
	public ModelAndView ffe_approve_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_approve_list");
		return mav;
	}
	
	@RequestMapping("ffe_approve_detail.htm")
	public ModelAndView ffe_approve_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_approve_detail");
		return mav;
	}
	@RequestMapping("ffe_received_list.htm")
	public ModelAndView ffe_received_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_received_list");
		return mav;
	}
	
	@RequestMapping("ffe_received_detail.htm")
	public ModelAndView ffe_received_detail(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ffe_received_detail");
		return mav;
	}
	
}
