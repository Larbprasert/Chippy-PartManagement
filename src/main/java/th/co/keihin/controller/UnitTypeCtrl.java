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

import th.co.keihin.service.UnitTypeService;
import th.co.keihin.model.UnitTypeBean;


@RestController
public class UnitTypeCtrl {
	
	@Autowired
	private UnitTypeService unitTypeService;

	@RequestMapping("/unitType/unitType_list.htm")
	public ModelAndView unitType_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("unitType_list");
		return mav;
	}
	
	@RequestMapping("/unitType/unitType_view.htm")
	public ModelAndView unitType_view(HttpServletRequest httpRequest, UnitTypeBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("unitTypeBean",unitTypeService.getUnitTypeBeanByID(bean.getUnitType_ID()));
		
		mav.setViewName("unitType_view");
		return mav;
	}
	 
	@RequestMapping("/unitType/unitType_create.htm")
	public ModelAndView unitType_create(HttpServletRequest httpRequest, UnitTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("unitTypeBean",unitTypeService.getUnitTypeBeanByID(bean.getUnitType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
	
		mav.setViewName("unitType_create");
		return mav;
	}
	
	@RequestMapping("/unitType/unitType_edit.htm")
	public ModelAndView unitType_edit(HttpServletRequest httpRequest, UnitTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("unitTypeBean",unitTypeService.getUnitTypeBeanByID(bean.getUnitType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("unitType_edit");
		return mav;
	}
	
	@RequestMapping("/unitType/unitType_save.htm")
	public ModelAndView unitType_save(HttpServletRequest httpRequest, UnitTypeBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			unitTypeService.edit(bean);
		}else if ("Create".equals(rAction)) {
			unitTypeService.save(bean);
		}else if ("Delete".equals(rAction)) {
			unitTypeService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../unitType/unitType_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/unitType/search.json")
	public DataTableAjax<UnitTypeBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<UnitTypeBean> dataTableAjax = unitTypeService.getAll();
		return dataTableAjax;
	}
}
