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

import th.co.keihin.service.DepartmentService;
import th.co.keihin.model.DepartmentBean;


@RestController
public class DepartmentCtrl {
	@Autowired
	private DepartmentService departmentService;

	@RequestMapping("/department/department_list.htm")
	public ModelAndView department_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("department_list");
		return mav;
	}
	
	@RequestMapping("/department/department_view.htm")
	public ModelAndView department_view(HttpServletRequest httpRequest, DepartmentBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("departmentBean",departmentService.getDeptBeanByID(bean.getDept_ID()));
		
		mav.setViewName("department_view");
		return mav;
	}
	 
	@RequestMapping("/department/department_create.htm")
	public ModelAndView department_create(HttpServletRequest httpRequest, DepartmentBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("departmentBean",departmentService.getDeptBeanByID(bean.getDept_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("department_create");
		return mav;
	}
	
	@RequestMapping("/department/department_edit.htm")
	public ModelAndView department_edit(HttpServletRequest httpRequest, DepartmentBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("departmentBean",departmentService.getDeptBeanByID(bean.getDept_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("department_edit");
		return mav;
	}
	
	@RequestMapping("/department/department_save.htm")
	public ModelAndView department_save(HttpServletRequest httpRequest, DepartmentBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			departmentService.edit(bean);
		}else if ("Create".equals(rAction)) {
			departmentService.save(bean);
		}else if ("Delete".equals(rAction)) {
			departmentService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../department/department_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/department/search.json")
	public DataTableAjax<DepartmentBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<DepartmentBean> dataTableAjax = departmentService.getAll();
		return dataTableAjax;
	}
}
