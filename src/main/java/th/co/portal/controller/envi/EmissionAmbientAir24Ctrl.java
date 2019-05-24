package th.co.portal.controller.envi;

import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.EmissionAmbientAir24;
import th.co.portal.service.envi.EmissionAmbientAir24Service;

@RestController
@RequestMapping("/ambientAir24/")
public class EmissionAmbientAir24Ctrl {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmissionAmbientAir24Service service;
	
	@RequestMapping(value = "getDataTable")
	public DataTableAjax<EmissionAmbientAir24> getDataTable(@ModelAttribute("ambientAir") EmissionAmbientAir24 ambientAir)
			throws ParseException {
		logger.info("ambient 24 => param search" + ambientAir.getPeriodFrom() + "-" + ambientAir.getPeriodTo()
				+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(ambientAir);
		return dataTableAjax;
	}
	@RequestMapping("doSave.htm")
	public ModelAndView saveOrUpdate(@ModelAttribute("util") EmissionAmbientAir24 emission ,RedirectAttributes redir) {

		
		logger.info("ambient 24 => param insert id :" +emission.getId()+" period:"+ emission.getPeriod() + " : parameter is" + emission.getParameter_code() 
		+ " \n company :" + emission.getCompanyName() +" plant value:"+emission.getPlant_val()
		+ "nongfab value"+ emission.getNongfab_val()
		+ "chlk value "+ emission.getChkl_val());
		ModelAndView mav = new ModelAndView();
		
		try {
			service.saveOrUpdate(emission);
			
			mav.setViewName("redirect:../envi/emission_ambient_air24_search.htm");
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
	
	@RequestMapping(value = "verify")
	public ResponseEntity<?>  verifyData(@ModelAttribute("ambientAir") EmissionAmbientAir24 ambientAir)
			throws ParseException {
		logger.info("ambient 24 => verify param period :" + ambientAir.getPeriod()
				+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		EmissionAmbientAir24 data = new EmissionAmbientAir24();
		//data = service.verifyData(ambientAir);
		try {
			data = service.verifyData(ambientAir);
			if(!data.getStatus().equals("0")){
				return new ResponseEntity<>("99", HttpStatus.BAD_REQUEST);
			}else{
				return new ResponseEntity<>("0", HttpStatus.OK);
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = e + " <== error";
	        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@RequestMapping(value = "getDataChart")
	public ChartResponse<EmissionAmbientAir24> getDataChart(@ModelAttribute("ambientAir") EmissionAmbientAir24 ambientAir)
			throws ParseException {
		logger.info("ambient 24 => chart param search" + ambientAir.getPeriodFrom() + "-" + ambientAir.getPeriodTo()
				+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		ChartResponse<EmissionAmbientAir24> data = new ChartResponse<>();
		data = service.getDataChart(ambientAir);
		return data;
	}

}
