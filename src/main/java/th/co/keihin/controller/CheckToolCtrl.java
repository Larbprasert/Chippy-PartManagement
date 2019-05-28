package th.co.keihin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.CheckToolBean;
import th.co.keihin.service.CheckToolService;

@Controller
public class CheckToolCtrl {
	
	@Autowired
	private CheckToolService checktoolService;

	@RequestMapping("/checkTool/list.htm")
	public ModelAndView checkTool_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("checkTool_list");
		return mav;
	}
	 
	@RequestMapping("/checkTool/search")
	public DataTableAjax<CheckToolBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<CheckToolBean> dataTableAjax = checktoolService.getAll();
		return dataTableAjax;
	}
	
}
