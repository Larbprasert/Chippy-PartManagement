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

import th.co.keihin.service.MoldTypeService;
import th.co.keihin.model.MoldTypeBean;


@RestController
public class MoldTypeCtrl {
	
	@Autowired
	private MoldTypeService moldTypeService;

	@RequestMapping("/moldType/moldType_list.htm")
	public ModelAndView moldType_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("moldType_list");
		return mav;
	}
	
	@RequestMapping("/moldType/moldType_view.htm")
	public ModelAndView moldType_view(HttpServletRequest httpRequest, MoldTypeBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("moldTypeBean",moldTypeService.getMoldTypeBeanByID(bean.getMoldType_ID()));
		
		mav.setViewName("moldType_view");
		return mav;
	}
	 
	@RequestMapping("/moldType/moldType_create.htm")
	public ModelAndView moldType_create(HttpServletRequest httpRequest, MoldTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("moldTypeBean",moldTypeService.getMoldTypeBeanByID(bean.getMoldType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("moldType_create");
		return mav;
	}
	
	@RequestMapping("/moldType/moldType_edit.htm")
	public ModelAndView moldType_edit(HttpServletRequest httpRequest, MoldTypeBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("moldTypeBean",moldTypeService.getMoldTypeBeanByID(bean.getMoldType_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("moldType_edit");
		return mav;
	}
	
	@RequestMapping("/moldType/moldType_save.htm")
	public ModelAndView moldType_save(HttpServletRequest httpRequest, MoldTypeBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			moldTypeService.edit(bean);
		}else if ("Create".equals(rAction)) {
			moldTypeService.save(bean);
		}else if ("Delete".equals(rAction)) {
			moldTypeService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../moldType/moldType_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/moldType/search.json")
	public DataTableAjax<MoldTypeBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<MoldTypeBean> dataTableAjax = moldTypeService.getAll();
		return dataTableAjax;
	}
}
