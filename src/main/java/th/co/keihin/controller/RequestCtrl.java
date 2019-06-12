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

import th.co.keihin.model.PartMasterBean;
import th.co.keihin.service.CheckToolService;
import th.co.keihin.service.LocationService;
import th.co.keihin.service.MakerService;
import th.co.keihin.service.MoldTypeService;
import th.co.keihin.service.PartMasterService;
import th.co.keihin.service.RequestTypeService;
import th.co.keihin.service.UnitTypeService;


@RestController
public class RequestCtrl {
	
	@Autowired
	private RequestTypeService requestTypeService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private CheckToolService checkToolService;
	
		
//	
	@RequestMapping("/request/requested_list.htm")
	public ModelAndView partMaster_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("partMaster_list");
		return mav;
	}
	
	@RequestMapping("/request/requested_view.htm")
	public ModelAndView partMaster_view(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();

//		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));

		mav.setViewName("partMaster_view");
		return mav;
	}
	 
	@RequestMapping("/request/requested_new.htm")
	public ModelAndView partMaster_create(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));
//		
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
//		
//		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("requested_new");
		return mav;
	}
	
	@RequestMapping("/request/requested_edit.htm")
	public ModelAndView partMaster_edit(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
		
//		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
				
		mav.setViewName("partMaster_edit");
		return mav;
	}
	
	@RequestMapping("/request/requested_save.htm")
	public ModelAndView partMaster_save(HttpServletRequest httpRequest, PartMasterBean bean, String rAction) {
		
//		if ("Edit".equals(rAction)) {
//			partMasterService.edit(bean);
//		}else if ("Create".equals(rAction)) {
//			partMasterService.save(bean);
//		}else if ("Delete".equals(rAction)) {
//			partMasterService.delete(bean);		
//		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../request/requested_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
//	@RequestMapping("/partMaster/search.json")
//	public DataTableAjax<PartMasterBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		DataTableAjax<PartMasterBean> dataTableAjax = partMasterService.getAll();
//		return dataTableAjax;
//	}
}
