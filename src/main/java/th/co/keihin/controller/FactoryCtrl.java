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

import th.co.keihin.service.FactoryService;
import th.co.keihin.model.FactoryBean;


@RestController
public class FactoryCtrl {
	@Autowired
	private FactoryService factoryService;

	@RequestMapping("/factory/factory_list.htm")
	public ModelAndView factory_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("factory_list");
		return mav;
	}
	
	@RequestMapping("/factory/factory_view.htm")
	public ModelAndView factory_view(HttpServletRequest httpRequest, FactoryBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("factoryBean",factoryService.getFactoryBeanByID(bean.getFactory_ID()));
		
		mav.setViewName("factory_view");
		return mav;
	}
	 
	@RequestMapping("/factory/factory_create.htm")
	public ModelAndView factory_create(HttpServletRequest httpRequest, FactoryBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("factoryBean",factoryService.getFactoryBeanByID(bean.getFactory_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("factory_create");
		return mav;
	}
	
	@RequestMapping("/factory/factory_edit.htm")
	public ModelAndView factory_edit(HttpServletRequest httpRequest, FactoryBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("factoryBean",factoryService.getFactoryBeanByID(bean.getFactory_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("factory_edit");
		return mav;
	}
	
	@RequestMapping("/factory/factory_save.htm")
	public ModelAndView factory_save(HttpServletRequest httpRequest, FactoryBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			factoryService.edit(bean);
		}else if ("Create".equals(rAction)) {
			factoryService.save(bean);
		}else if ("Delete".equals(rAction)) {
			factoryService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../factory/factory_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/factory/search.json")
	public DataTableAjax<FactoryBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<FactoryBean> dataTableAjax = factoryService.getAll();
		return dataTableAjax;
	}
}
