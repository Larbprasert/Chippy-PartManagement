package th.co.portal.controller.envi;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

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
import th.co.portal.service.envi.EmissionAmbientAirService;

@RestController
@RequestMapping("/ambientAir/")
public class EmissionAmbientAirCtrl {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmissionAmbientAirService service;

	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<EmissionAmbientAir> getDataTable(@ModelAttribute("ambientAir") EmissionAmbientAir ambientAir)
			throws ParseException {
		logger.info("ambient air param search" + ambientAir.getPeriodFrom() + "-" + ambientAir.getPeriodTo()
				+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(ambientAir);
		return dataTableAjax;
	}
	
	@RequestMapping("doSave.htm")
	public ModelAndView saveOrUpdate(@ModelAttribute("util") EmissionAmbientAir emission ,RedirectAttributes redir) {

		
//		logger.info("ambient air param insert id :" +emission.getId()+" period:"+ emission.getPeriod() + " : parameter is" + emission.getParameter_code() 
//		+ " \n company :" + emission.getCompanyName() +" plant value:"+emission.getPlant_min()+": "+emission.getPlant_max()
//		+ "nongfab value"+ emission.getNongfab_min()+":"+emission.getNongfab_max()
//		+ "chlk value "+ emission.getChkl_min()+":" +emission.getChkl_max());
		ModelAndView mav = new ModelAndView();
		EmissionAmbientAir data = new EmissionAmbientAir();
		try {
			data = service.verifyData(emission);
			if(!data.getStatus().equals("0")){
				mav.addObject("status","F");
				return mav;
				
			}else{
				service.saveOrUpdate(emission);
			}
			
			mav.setViewName("redirect:../envi/emission_ambient_air_search.htm");
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
	public  ResponseEntity<?> verifyData(@ModelAttribute("ambientAir") EmissionAmbientAir ambientAir)
			throws ParseException {
		//logger.info("verify param period :" + ambientAir.getPeriod()
		//		+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		EmissionAmbientAir data = new EmissionAmbientAir();
//		data = service.verifyData(ambientAir);
//		return data;
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
	public ChartResponse<EmissionAmbientAir> getDataChart(@ModelAttribute("ambientAir") EmissionAmbientAir ambientAir)
			throws ParseException {
		logger.info("ambient air param search" + ambientAir.getPeriodFrom() + "-" + ambientAir.getPeriodTo()
				+ " : parameter is" + ambientAir.getParameter_code() + " \n company :" + ambientAir.getCompanyName());
		ChartResponse<EmissionAmbientAir> data = new ChartResponse<>();
		data = service.getDataChart(ambientAir);
		return data;
	}

}
