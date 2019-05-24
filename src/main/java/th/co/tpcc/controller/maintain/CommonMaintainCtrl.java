package th.co.tpcc.controller.maintain;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import th.co.baiwa.admin.service.UserService;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.tpcc.model.InvAsset;
import th.co.tpcc.model.SysParam;

@RestController
@RequestMapping("/maintain")
public class CommonMaintainCtrl {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private Gson gson = new Gson();

	@Autowired
	private UserService userService;
	
	@RequestMapping("/asset.htm")
	public ModelAndView asset(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_maintain");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		mav.addObject("invAsset", new InvAsset());
		return mav;
	}
	
	@RequestMapping("/edit.htm")
	public ModelAndView edit(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_edit");
		
		return mav;
	}
	
	@RequestMapping("/parameter.htm")
	public ModelAndView parameter(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("parameter_maintain");
		mav.addObject("LOV_PARAM_TYPE",ApplicationCache.getLovByType("PARAM_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("sysParam", new SysParam());
		return mav;
	}
	
	@RequestMapping("/themes_setting.htm")
	public ModelAndView searchByDate(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("themes_setting");
		return mav;
	}
	
	@RequestMapping("/owner.htm")
	public ModelAndView owner(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner_maintain");
//		mav.addObject("LOV_DEPT",ApplicationCache.getLovDept());
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));

		return mav;
	}
	
	@RequestMapping("/dept.htm")
	public ModelAndView dept(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dept_maintain");
		return mav;
	}
	
	@RequestMapping("/course.htm")
	public ModelAndView course(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("course_maintain");
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		return mav;
	}
	
	@RequestMapping("/positionCourse.htm")
	public ModelAndView positionCourse(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("position_course_maintain");
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));

		return mav;
	}
	
	
	/****--- Theme Maintenance ---- ***/
	@RequestMapping(value = "/updateTheme")
	public String updateTheme(@RequestParam String theme) {
		try {
			if(null!=UserLoginUtils.getCurrentUser() && null!=UserLoginUtils.getCurrentUser().getUserProfile()){
				UserLoginUtils.getCurrentUser().getUserProfile().getProfile().setThemeCode(theme);
				userService.updateUserTheme(UserLoginUtils.getCurrentUser().getUserId(),theme);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";
	}
	
}
