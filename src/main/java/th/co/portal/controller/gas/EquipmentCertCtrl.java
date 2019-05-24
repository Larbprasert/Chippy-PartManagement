package th.co.portal.controller.gas;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.gas.CertDocument;
import th.co.portal.service.gas.EquipmentCertService;

@RestController
@RequestMapping("/cert/")
public class EquipmentCertCtrl {
	

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EquipmentCertService service ;
	
//	@InitBinder
//    public void initBinder (WebDataBinder binder) {
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true));
//    }
	
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<CertDocument> getDataTable(@ModelAttribute("bean") CertDocument bean) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(bean);
		return dataTableAjax;
	}
	
	/*@RequestMapping("doSave.htm")
	public ModelAndView saveOrUpdate(@ModelAttribute("bean") CertDocument bean,RedirectAttributes redir) {
		
		service.saveOrUpdate(bean);
	    
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../gas/gas_registered_list.htm");
		mav.addObject("status","S");
		redir.addFlashAttribute("status","S");
		return mav;
	}
	*/
//	@RequestMapping("dDelete")
//	public @ResponseBody String courseDelete(@ModelAttribute("CertDocument") CertDocument CertDocument) {
//		courseService.delete(CertDocument);
//		return "SUCCESS";
//	}
	
	/*@RequestMapping(value = "getEquipmentDetail.json")
	public CertDocument getEquipmentDetail(CertDocument bean)
			throws ParseException {
		
		CertDocument CertDocument = service.getEquipment(bean);
		return CertDocument;
	}
	
	
	@RequestMapping(value = "verify")
	public ResponseEntity<?> verify(@ModelAttribute("bean") CertDocument bean) {
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
	}*/
	
}
