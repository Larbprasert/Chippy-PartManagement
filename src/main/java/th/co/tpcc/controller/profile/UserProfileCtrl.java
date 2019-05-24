package th.co.tpcc.controller.profile;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.admin.service.UserService;
import th.co.baiwa.common.ApplicationCache;

@RestController
@RequestMapping("/profile")
public class UserProfileCtrl {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/viewProfile.htm", method = RequestMethod.GET)
	public ModelAndView viewUser(String userId) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editUser");
		
		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ROLE",ApplicationCache.getLovRole());
		
		UserProfile userProfile =  new UserProfile();
		if(StringUtils.isNotEmpty(userId)){
			userProfile =  userService.getById(userId);
		}
		
		mav.addObject("userProfile", userProfile);
		
		return  mav;
	}
	
}
