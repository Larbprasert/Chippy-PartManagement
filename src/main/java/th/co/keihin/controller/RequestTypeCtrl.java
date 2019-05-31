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

import th.co.keihin.service.RequestTypeService;
import th.co.keihin.model.RequestTypeBean;


@RestController
public class RequestTypeCtrl {
	
	@Autowired
	private RequestTypeService requestTypeService;

	@RequestMapping("/requestType/requestType_list.htm")
	public ModelAndView requestType_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("requestType_list");
		return mav;
	}
	
	@RequestMapping("/requestType/requestType_view.htm")
	public ModelAndView requestType_view(HttpServletRequest httpRequest, RequestTypeBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("requestTypeBean",requestTypeService.getRequestTypeBeanByID(bean.getRequestType_ID()));
		
		mav.setViewName("requestType_view");
		return mav;
	}
	 
	@RequestMapping("/requestType/requestType_create.htm")
	public ModelAndView requestType_create(HttpServletRequest httpRequest, RequestTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("requestTypeBean",requestTypeService.getRequestTypeBeanByID(bean.getRequestType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("requestType_create");
		return mav;
	}
	
	@RequestMapping("/requestType/requestType_edit.htm")
	public ModelAndView requestType_edit(HttpServletRequest httpRequest, RequestTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("requestTypeBean",requestTypeService.getRequestTypeBeanByID(bean.getRequestType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("requestType_edit");
		return mav;
	}
	
	@RequestMapping("/requestType/requestType_save.htm")
	public ModelAndView requestType_save(HttpServletRequest httpRequest, RequestTypeBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			requestTypeService.edit(bean);
		}else if ("Create".equals(rAction)) {
			requestTypeService.save(bean);
		}else if ("Delete".equals(rAction)) {
			requestTypeService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../requestType/requestType_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/requestType/search.json")
	public DataTableAjax<RequestTypeBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<RequestTypeBean> dataTableAjax = requestTypeService.getAll();
		return dataTableAjax;
	}
}
