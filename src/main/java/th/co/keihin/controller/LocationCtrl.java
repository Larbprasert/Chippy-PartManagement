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

import th.co.keihin.service.LocationService;
import th.co.keihin.model.LocationBean;

import th.co.keihin.service.FactoryService;
import th.co.keihin.model.FactoryBean;


@RestController
public class LocationCtrl {
	
	@Autowired
	private LocationService locationService;

	@Autowired
	private FactoryService factoryService;
//	
	@RequestMapping("/location/location_list.htm")
	public ModelAndView location_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("location_list");
		return mav;
	}
	
	@RequestMapping("/location/location_view.htm")
	public ModelAndView location_view(HttpServletRequest httpRequest, LocationBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("locationBean",locationService.getLocationBeanByID(bean.getLocation_ID()));
		
//		mav.addObject("locationBean",factoryService.getFactoryBeanByID(bean.getFactory_ID()));
		
		mav.setViewName("location_view");
		return mav;
	}
	 
	@RequestMapping("/location/location_create.htm")
	public ModelAndView location_create(HttpServletRequest httpRequest, LocationBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("locationBean",locationService.getLocationBeanByID(bean.getLocation_ID()));
		
		mav.addObject("LOV_FACTORY",factoryService.loadActiveFactory());

		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("location_create");
		return mav;
	}
	
	@RequestMapping("/location/location_edit.htm")
	public ModelAndView location_edit(HttpServletRequest httpRequest, LocationBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("locationBean",locationService.getLocationBeanByID(bean.getLocation_ID()));
		
		mav.addObject("LOV_FACTORY",factoryService.loadActiveFactory());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
				
		mav.setViewName("location_edit");
		return mav;
	}
	
	@RequestMapping("/location/location_save.htm")
	public ModelAndView location_save(HttpServletRequest httpRequest, LocationBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			locationService.edit(bean);
		}else if ("Create".equals(rAction)) {
			locationService.save(bean);
		}else if ("Delete".equals(rAction)) {
			locationService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../location/location_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/location/search.json")
	public DataTableAjax<LocationBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<LocationBean> dataTableAjax = locationService.getAll();
		return dataTableAjax;
	}
}
