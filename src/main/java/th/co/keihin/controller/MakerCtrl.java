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

import th.co.keihin.service.MakerService;
import th.co.keihin.model.MakerBean;


@RestController
public class MakerCtrl {
	@Autowired
	private MakerService makerService;

	@RequestMapping("/maker/maker_list.htm")
	public ModelAndView maker_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("maker_list");
		return mav;
	}
	
	@RequestMapping("/maker/maker_view.htm")
	public ModelAndView maker_view(HttpServletRequest httpRequest, MakerBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("makerBean",makerService.getMakerBeanByID(bean.getMaker_ID()));
		
		mav.setViewName("maker_view");
		return mav;
	}
	 
	@RequestMapping("/maker/maker_create.htm")
	public ModelAndView maker_create(HttpServletRequest httpRequest, MakerBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("makerBean",makerService.getMakerBeanByID(bean.getMaker_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.addObject("LOV_PROVINCE",ApplicationCache.getLovProvince());

		mav.setViewName("maker_create");
		return mav;
	}
	
	@RequestMapping("/maker/maker_edit.htm")
	public ModelAndView maker_edit(HttpServletRequest httpRequest, MakerBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("makerBean",makerService.getMakerBeanByID(bean.getMaker_ID()));
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.addObject("LOV_PROVINCE",ApplicationCache.getLovProvince());
		
		mav.setViewName("maker_edit");
		return mav;
	}
	
	@RequestMapping("/maker/maker_save.htm")
	public ModelAndView maker_save(HttpServletRequest httpRequest, MakerBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			makerService.edit(bean);
		}else if ("Create".equals(rAction)) {
			makerService.save(bean);
		}else if ("Delete".equals(rAction)) {
			makerService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../maker/maker_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/maker/search.json")
	public DataTableAjax<MakerBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<MakerBean> dataTableAjax = makerService.getAll();
		return dataTableAjax;
	}
}
