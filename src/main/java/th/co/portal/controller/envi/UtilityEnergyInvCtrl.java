package th.co.portal.controller.envi;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.UtilityEnergyInv;
import th.co.portal.service.envi.UtilityEnergyInvService;

@RestController
@RequestMapping("/util/")
public class UtilityEnergyInvCtrl {
	

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UtilityEnergyInvService service ;
	
	@InitBinder
    public void initBinder (WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true));
    }
	
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<UtilityEnergyInv> getDataTable(@ModelAttribute("util") UtilityEnergyInv util) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(util);
		return dataTableAjax;
	}
	
	@RequestMapping("doSave.htm")
	public ModelAndView saveOrUpdate(@ModelAttribute("util") UtilityEnergyInv util,RedirectAttributes redir) {
		service.saveOrUpdate(util);
//		RedirectView rv = new RedirectView();
//	    rv.setUrl("../envi/utility_energy_search.htm?status=S&id="+util.getId()+"");
//	    rv.addStaticAttribute("companyCode", util.getCompanyCode());
//		return rv;
	    
	    
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../envi/utility_energy_search.htm");
		mav.addObject("status","S");
		mav.addObject("companyCode", util.getCompanyCode());
		
		redir.addFlashAttribute("status","S");
		redir.addFlashAttribute("companyCode", util.getCompanyCode());

//		modelAndView.setViewName("redirect:welcome");
//	    .addFlashAttribute("USERNAME",uname);
		return mav;
	}
	
//	@RequestMapping("dDelete")
//	public @ResponseBody String courseDelete(@ModelAttribute("UtilityEnergyInv") UtilityEnergyInv UtilityEnergyInv) {
//		courseService.delete(UtilityEnergyInv);
//		return "SUCCESS";
//	}
	
	@RequestMapping(value = "verify")
	public ResponseEntity<?> verify(@ModelAttribute("util") UtilityEnergyInv util) {
		try {
			logger.info(" verify > : "+util);
			util = service.verify(util);
			if(null!=util&&util.getId()!=null){
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
	public ChartResponse<UtilityEnergyInv> getDataChart(@ModelAttribute("util") UtilityEnergyInv util)
			throws ParseException {
		logger.info("utility chart param search" + util.getFromYear()+ "-" + util.getToYear()
				+ "  \n company :" + util.getCompanyCode());
		ChartResponse<UtilityEnergyInv> data = new ChartResponse<>();
		data = service.getDataChart(util);
		return data;
	}
//	@RequestMapping(value = "getDataChartEmission")
//	public ChartResponse<UtilityEnergyInv> getDataChartEmission(@ModelAttribute("util") UtilityEnergyInv util) {
//		logger.info("utility chart param search" + util.getFromYear()+ "-" + util.getToYear()
//				+ "  \n company :" + util.getCompanyCode());
//		ChartResponse<UtilityEnergyInv> data = new ChartResponse<>();
//		data = service.getDataChart(util);
//		return data;
//	}
	
}
