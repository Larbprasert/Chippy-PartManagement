package th.co.portal.controller.gas;

import java.text.ParseException;
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
import th.co.portal.model.envi.SystemParam;
import th.co.portal.model.gas.Equipment;
import th.co.portal.service.gas.GasRegisteredService;

@RestController
@RequestMapping("/gasRegistered/")
public class GasRegisterdCtrl {
	

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GasRegisteredService service ;
	
//	@InitBinder
//    public void initBinder (WebDataBinder binder) {
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true));
//    }
	
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<Equipment> getDataTable(@ModelAttribute("bean") Equipment bean) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(bean);
		return dataTableAjax;
	}
	
	@RequestMapping("doSave.htm")
	public ModelAndView saveOrUpdate(@ModelAttribute("bean") Equipment bean,RedirectAttributes redir) {
		service.saveOrUpdate(bean);
	    
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../gas/gas_registered_list.htm");
		mav.addObject("status","S");
//		mav.addObject("companyCode", bean.getCompanyCode());
		
		redir.addFlashAttribute("status","S");
//		redir.addFlashAttribute("companyCode", bean.getCompanyCode());

//		modelAndView.setViewName("redirect:welcome");
//	    .addFlashAttribute("USERNAME",uname);
		return mav;
	}
	
//	@RequestMapping("dDelete")
//	public @ResponseBody String courseDelete(@ModelAttribute("Equipment") Equipment Equipment) {
//		courseService.delete(Equipment);
//		return "SUCCESS";
//	}
	
	@RequestMapping(value = "getEquipmentDetail.json")
	public Equipment getEquipmentDetail(Equipment bean)
			throws ParseException {
		
		Equipment equipment = service.getEquipment(bean);
		return equipment;
	}
	
	
	@RequestMapping(value = "verify")
	public ResponseEntity<?> verify(@ModelAttribute("bean") Equipment bean) {
		try {
			logger.info(" verify > : "+bean);
			bean = service.verify(bean);
			if(null!=bean&&bean.getId()!=null){
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
	
}
