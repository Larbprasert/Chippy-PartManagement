package th.co.baiwa.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.admin.entity.User;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.admin.service.UserService;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.EditDataTableRespone;
import th.co.tpcc.model.SysParam;

@Controller
@RequestMapping(value = "/admin/user")
public class UserManagementController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/viewUser.htm", method = RequestMethod.GET)
	public ModelAndView viewUser(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("viewUser");
		
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_ROLE",ApplicationCache.getLovRole());
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));

		return  mav;
	}
	
	@RequestMapping(value = "/editUser.htm", method = RequestMethod.GET)
	public ModelAndView editUser(String userId) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editUser");
		
		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ROLE",ApplicationCache.getLovRole());
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));

		UserProfile userProfile =  new UserProfile();
		if(StringUtils.isNotEmpty(userId)){
			userProfile =  userService.getById(userId);
		}
		
		mav.addObject("userProfile", userProfile);
		
		return  mav;
	}

	@RequestMapping(value = "/checkExist")
	public ResponseEntity<?> checkExist(@RequestParam String userName) {
		try {
			logger.info(" userName : "+userName);
			if(!userService.checkExist(userName)){
				return new ResponseEntity<>("0", HttpStatus.OK);
			}else{
				return new ResponseEntity<>("99", HttpStatus.BAD_REQUEST);
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = e + " <== error";
	        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
		}
	}
	

	@RequestMapping(value = "/getUserTable.json")
	public @ResponseBody DataTableAjax<UserProfile> getUser(@ModelAttribute("userProfile") UserProfile userProfile) {
		DataTableAjax<UserProfile> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = userService.queryUserList(userProfile);
		return dataTableAjax;
	}
	
	@RequestMapping("/userSave.htm")
	public RedirectView userSave(@ModelAttribute("userProfile") UserProfile userProfile) {
		logger.info(" userSave > : "+userProfile);
		userService.saveOrUpdate(userProfile);
	    RedirectView rv = new RedirectView();
        rv.setUrl("editUser.htm?edit=Y&status=S&userId="+userProfile.getUserId());
        return rv;
	}
	 
	@RequestMapping("/userDelete")
	public String userDelete(String paramId) {
//		ModelAndView mav = new ModelAndView();
		logger.info(" userDelete > : "+paramId);
//		sysParamService.delete(paramId);
//		ModelAndView mav = paramEdit(sysParam.getParamId()+"");
//		mav.addObject("SAVE_STATUS", "S");
		return "SUCCESS";
	}
}
