package th.co.baiwa.admin.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.admin.service.UserService;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.keihin.service.SectionService;

@RestController
@RequestMapping("/profile")
public class UserProfileCtrl {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SectionService sectionService;
	
	@RequestMapping(value = "/viewProfile.htm", method = RequestMethod.GET)
	public ModelAndView viewUser(String userId) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editUser");

		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ROLE",ApplicationCache.getLovRole());
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));

		mav.addObject("LOV_SECTION",sectionService.loadActiveSection());

		
		UserProfile userProfile =  new UserProfile();
		if(StringUtils.isNotEmpty(userId)){
			userProfile =  userService.getById(userId);
		}
		
		mav.addObject("userProfile", userProfile);
		
		return  mav;
	}
	
	@RequestMapping(value = "/userProfile.htm", method = RequestMethod.GET)
	public ModelAndView userProfile() {
		ModelAndView mav = new ModelAndView();
		
		UserProfile userProfile= UserLoginUtils.getCurrentUser().getUserProfile().getProfile();
		
		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ROLE",ApplicationCache.getLovRole());
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_DEPT",ApplicationCache.getLovByType("DEPARTMENT"));
		
		mav.addObject("LOV_SECTION",sectionService.loadActiveSection());
		if(userProfile != null && StringUtils.isNotEmpty(userProfile.getUserId())){
			userProfile =  userService.getById(userProfile.getUserId());

			mav.setViewName("editProfile");
		}else{
			mav.setViewName("error403");
		}
		
		mav.addObject("userProfile", userProfile);
		return  mav;
	}
	
	@RequestMapping("/profileSave.htm")
	public RedirectView userSave(@ModelAttribute("userProfile") UserProfile userProfile) {
		userService.saveOrUpdate(userProfile);
	    RedirectView rv = new RedirectView();
	    rv.addStaticAttribute("status", "S");
        rv.setUrl("userProfile.htm");
        return rv;
	}
	
}
