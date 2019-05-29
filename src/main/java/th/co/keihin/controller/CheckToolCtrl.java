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
import th.co.keihin.service.CheckToolService;

@RestController
public class CheckToolCtrl {
	
	@Autowired
	private CheckToolService checktoolService;

	@RequestMapping("/checkTool/checkTool_list.htm")
	public ModelAndView checkTool_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("checkTool_list");
		return mav;
	}
	
	@RequestMapping("/checkTool/checkTool_view.htm")
	public ModelAndView checkTool_view(HttpServletRequest httpRequest, CheckToolBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("checkToolBean",checktoolService.getCheckToolBeanByID(bean.getCheckTool_ID()));
		
		mav.setViewName("checkTool_view");
		return mav;
	}
	 
	@RequestMapping("/checkTool/checkTool_create.htm")
	public ModelAndView checkTool_create(HttpServletRequest httpRequest, CheckToolBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("checkToolBean",checktoolService.getCheckToolBeanByID(bean.getCheckTool_ID()));
		
		mav.addObject("LOV_TIMING",ApplicationCache.getLovTiming());
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("checkTool_create");
		return mav;
	}
	
	@RequestMapping("/checkTool/checkTool_edit.htm")
	public ModelAndView checkTool_edit(HttpServletRequest httpRequest, CheckToolBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("checkToolBean",checktoolService.getCheckToolBeanByID(bean.getCheckTool_ID()));
		
		mav.addObject("LOV_TIMING",ApplicationCache.getLovTiming());
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("checkTool_edit");
		return mav;
	}
	
	@RequestMapping("/checkTool/checkTool_save.htm")
	public ModelAndView checkTool_save(HttpServletRequest httpRequest, CheckToolBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			checktoolService.edit(bean);
		}else if ("Create".equals(rAction)) {
			checktoolService.save(bean);
		}else if ("Delete".equals(rAction)) {
			checktoolService.delete(bean);
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../checkTool/checkTool_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	@RequestMapping("/checkTool/search.json")
	public DataTableAjax<CheckToolBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<CheckToolBean> dataTableAjax = checktoolService.getAll();
		return dataTableAjax;
	}
	
}
