package th.co.keihin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;

import th.co.keihin.model.RequestBean;
import th.co.keihin.service.CheckToolService;
import th.co.keihin.service.LocationService;
import th.co.keihin.service.MakerService;
import th.co.keihin.service.MoldTypeService;
import th.co.keihin.service.PartMasterService;
import th.co.keihin.service.RequestService;
import th.co.keihin.service.RequestTypeService;
import th.co.keihin.service.SectionService;
import th.co.keihin.service.UnitTypeService;


@RestController
public class RequestCtrl {
	
	@Autowired
	private RequestTypeService requestTypeService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private CheckToolService checkToolService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private RequestService requestService;
	
		
//	
	@RequestMapping("/request/requested_list.htm")
	public ModelAndView request_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("request_list");
		return mav;
	}
	
	@RequestMapping("/request/requested_view.htm")
	public ModelAndView request_view(HttpServletRequest httpRequest, RequestBean bean) {
		ModelAndView mav = new ModelAndView();

//		mav.addObject("requestBean",requestService.getRequestBeanByID(bean.getPart_ID()));

		mav.setViewName("request_view");
		return mav;
	}
	 
	@RequestMapping("/request/requested_new.htm")
	public ModelAndView request_create(HttpServletRequest httpRequest, RequestBean bean) {
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("requestBean",requestService.getRequestBeanByID(bean.getPart_ID()));
		
//		mav.addObject("LOV_SECTION",sectionService.loadActiveSection());
		
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
//		
//		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("requested_new");
		return mav;
	}
	
	@RequestMapping("/request/requested_edit.htm")
	public ModelAndView request_edit(HttpServletRequest httpRequest, RequestBean bean) {
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("requestBean",requestService.getRequestBeanByID(bean.getPart_ID()));
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
		
//		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
				
		mav.setViewName("request_edit");
		return mav;
	}
	
	@RequestMapping("/request/requested_save.htm")
	public ModelAndView request_save(HttpServletRequest httpRequest, RequestBean bean, String rAction) {
		
//		if ("Edit".equals(rAction)) {
//			requestService.edit(bean);
//		}else if ("Create".equals(rAction)) {
//			requestService.save(bean);
//		}else if ("Delete".equals(rAction)) {
//			requestService.delete(bean);		
//		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../request/requested_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/request/search.json")
	public DataTableAjax<RequestBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<RequestBean> dataTableAjax = requestService.getAll();
		return dataTableAjax;
	}
}
