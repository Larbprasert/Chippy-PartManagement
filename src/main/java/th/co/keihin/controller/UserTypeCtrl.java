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
import th.co.keihin.model.CheckToolBean;
import th.co.keihin.model.UserTypeBean;
import th.co.keihin.service.UserTypeService;

@RestController
public class UserTypeCtrl {
	@Autowired
	private UserTypeService usertypeService;

	@RequestMapping("/userType/userType_list.htm")
	public ModelAndView userType_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("userType_list");
		return mav;
	}
	
	@RequestMapping("/userType/userType_view.htm")
	public ModelAndView userType_view(HttpServletRequest httpRequest, UserTypeBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("userTypeBean",usertypeService.getUserTypeBeanByID(bean.getUserType_ID()));
		
		mav.setViewName("userType_view");
		return mav;
	}
	 
	@RequestMapping("/userType/userType_create.htm")
	public ModelAndView userType_create(HttpServletRequest httpRequest, UserTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userTypeBean",usertypeService.getUserTypeBeanByID(bean.getUserType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("userType_create");
		return mav;
	}
	
	@RequestMapping("/userType/userType_edit.htm")
	public ModelAndView userType_edit(HttpServletRequest httpRequest, UserTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userTypeBean",usertypeService.getUserTypeBeanByID(bean.getUserType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("userType_edit");
		return mav;
	}
	
	@RequestMapping("/userType/userType_save.htm")
	public ModelAndView userType_save(HttpServletRequest httpRequest, UserTypeBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			usertypeService.edit(bean);
		}else if ("Create".equals(rAction)) {
			usertypeService.save(bean);
		}else if ("Delete".equals(rAction)) {
			usertypeService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../userType/userType_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/userType/search.json")
	public DataTableAjax<UserTypeBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<UserTypeBean> dataTableAjax = usertypeService.getAll();
		return dataTableAjax;
	}
}
