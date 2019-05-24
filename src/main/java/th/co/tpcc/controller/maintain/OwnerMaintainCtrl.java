package th.co.tpcc.controller.maintain;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.Owner;
import th.co.tpcc.service.OwnerService;

@RestController
@RequestMapping("/owner")
public class OwnerMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OwnerService ownerService;
	
	@RequestMapping("/ownerEdit.htm")
	public ModelAndView ownerEdit(String ownerId) {
		logger.info(" ownerEdit : "+ownerId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner_edit");
		
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));
		
		Owner owner =  new Owner();
		if(StringUtils.isNotEmpty(ownerId)){
			owner =  ownerService.getOwnerById(ownerId);
		}
		mav.addObject("owner", owner);
		
		return mav;
	}
	
	@RequestMapping("/ownerPopup.htm")
	public ModelAndView ownerPopup(String ownerId) {
		ModelAndView mav = ownerEdit(ownerId);
		mav.setViewName("owner_popup");		
		return mav;
	}
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<Owner> getDataTable(Owner owner) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<Owner> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = ownerService.getDataTable(owner);
		return dataTableAjax;
	}
	
	@RequestMapping("/ownerSave.htm")
	public RedirectView saveOrUpdate(Owner owner) {
		RedirectView rv = new RedirectView();
		if(StringUtils.isEmpty(owner.getBirthDate())){
			owner.setBirthDate(null);
		}
		if(StringUtils.isEmpty(owner.getWorkStartDate())){
			owner.setWorkStartDate(null);
		}
		ownerService.saveOrUpdate(owner);
		rv.setUrl("ownerEdit.htm?edit=Y&status=S&ownerId=" + owner.getOwnerId());
		return rv;
	}
	
	@RequestMapping(value={"/updateOwnerImage"} )
	public @ResponseBody String updateOwnerImage(@RequestParam("file") MultipartFile file, @ModelAttribute("owner") Owner owner) {
		try {
			owner.setOwnerImage(file.getBytes());
			ownerService.updateOwnerImage(owner);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "SUCCESS";
	}
	
	@RequestMapping("/ownerDelete")
	public  @ResponseBody String userDelete(@ModelAttribute("owner") Owner owner) {
		logger.info(" owner Delete > : "+owner);
		ownerService.delete(owner);
		return "SUCCESS";
	}
	
	
	@RequestMapping(value = "/verify")
	public ResponseEntity<?> verify(@ModelAttribute("owner") Owner owner) {
		try {
			logger.info(" owner verify > : "+owner);
			owner = ownerService.verify(owner);
			if(null!=owner&&owner.getOwnerId()!=null){
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
	

/*	@RequestMapping("/verify")
	public  @ResponseBody Owner verify(@ModelAttribute("owner") Owner owner) {
		logger.info(" owner verify > : "+owner);
		return ownerService.verify(owner);
	}*/
	
}
