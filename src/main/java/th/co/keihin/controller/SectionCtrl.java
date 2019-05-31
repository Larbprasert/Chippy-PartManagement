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

import th.co.keihin.service.SectionService;
import th.co.keihin.model.SectionBean;

import th.co.keihin.service.DepartmentService;
import th.co.keihin.model.DepartmentBean;


@RestController
public class SectionCtrl {
	
	@Autowired
	private SectionService sectionService;

	@Autowired
	private DepartmentService departmentService;
//	
	@RequestMapping("/section/section_list.htm")
	public ModelAndView section_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("section_list");
		return mav;
	}
	
	@RequestMapping("/section/section_view.htm")
	public ModelAndView section_view(HttpServletRequest httpRequest, SectionBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("sectionBean",sectionService.getSectionBeanByID(bean.getSection_ID()));
		
		mav.setViewName("section_view");
		return mav;
	}
	 
	@RequestMapping("/section/section_create.htm")
	public ModelAndView section_create(HttpServletRequest httpRequest, SectionBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("sectionBean",sectionService.getSectionBeanByID(bean.getSection_ID()));
		
		mav.addObject("LOV_DEPARTMENT",departmentService.loadActiveDepartment());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("section_create");
		return mav;
	}
	
	@RequestMapping("/section/section_edit.htm")
	public ModelAndView section_edit(HttpServletRequest httpRequest, SectionBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("sectionBean",sectionService.getSectionBeanByID(bean.getSection_ID()));
		
		mav.addObject("LOV_DEPARTMENT",departmentService.loadActiveDepartment());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
				
		mav.setViewName("section_edit");
		return mav;
	}
	
	@RequestMapping("/section/section_save.htm")
	public ModelAndView section_save(HttpServletRequest httpRequest, SectionBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			sectionService.edit(bean);
		}else if ("Create".equals(rAction)) {
			sectionService.save(bean);
		}else if ("Delete".equals(rAction)) {
			sectionService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../section/section_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/section/search.json")
	public DataTableAjax<SectionBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<SectionBean> dataTableAjax = sectionService.getAll();
		return dataTableAjax;
	}
}
