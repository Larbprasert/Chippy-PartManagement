package th.co.portal.controller.envi;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.EmissionStackResult;
import th.co.portal.service.envi.EmissionStackResultService;

@RestController
@RequestMapping("/stackResult/")
public class EmissionStackResultCtrl {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmissionStackResultService service;

	
	@RequestMapping(value = "getDataTable")
	public DataTableAjax<EmissionStackResult> getDataTable(@ModelAttribute("ambientAir") EmissionStackResult ambientAir)
			throws ParseException {
		//logger.info("ambient air param search" + ambientAir.getPeriodFrom() + "-" + ambientAir.getPeriodTo()
		//		+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(ambientAir);
		return dataTableAjax;
	}
	@RequestMapping("doSave")
	public ModelAndView saveOrUpdate(@ModelAttribute("util") EmissionStackResult emission ,RedirectAttributes redir) {

		
		logger.info("ambient air param insert id :" +emission.getId()+" year:"+ emission.getYear() + " : parameter is" + emission.getParameter_code() 
		+ " \n company :" + emission.getCompanyName()+" Stack_no"+emission.getStackNo()
		+" value "+emission.getO2_1st()+" ,"+ emission.getO2_2nd()+","+emission.getEmission_1st()+","+emission.getEmission_2nd()) ;
		ModelAndView mav = new ModelAndView();
		
		try {
			service.saveOrUpdate(emission);
			
			mav.setViewName("redirect:../envi/emission_stack_search.htm");
			mav.addObject("status","S");
			mav.addObject("companyCode", emission.getCompanyCode());
			
			redir.addFlashAttribute("status","S");
			redir.addFlashAttribute("companyCode", emission.getCompanyCode());
			return mav;
			 
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("status","F");
			return mav;
		}
	}
	
	@RequestMapping(value = "getDataChart")
	public List<ChartResponse<EmissionStackResult>> getDataChart(@ModelAttribute("ambientAir") EmissionStackResult param)
			throws ParseException {
		logger.info("ambient stack chart param is year:"+ param.getYearFrom()+" to "+param.getYearTo() + " : parameter is" + param.getParameter_code() 
		+ " \n company :" + param.getCompanyName()+" Stack_no"+param.getStackNo());

		List list = new ArrayList<>();
		String[] stack = param.getStackNo().split(",");
		ChartResponse<EmissionStackResult> data = new ChartResponse<>();
		
		for (int i = 0; i < stack.length; i++) {
			param.setStackNo(stack[i]);
			data = service.getDataChart(param);
			list.add(data);
		}
		
		return list;
	}
	

}
