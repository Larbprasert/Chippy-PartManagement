package th.co.tpcc.controller.manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.tpcc.model.Course;
import th.co.tpcc.service.PositionCourseService;

@RestController
@RequestMapping("/manage")
public class CommonManagementCtrl {
	
	@RequestMapping("/assetmanage.htm")
	public ModelAndView assetMaintenance(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_manage");
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		return mav;
	}

	@RequestMapping("/claimmanage.htm")
	public ModelAndView claim(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("claim_manage");
		
		mav.addObject("LOV_BRAND_ASSET",ApplicationCache.getLovByType("BRAND"));
		mav.addObject("LOV_MODEL_ASSET",ApplicationCache.getLovByType("MODEL"));
		mav.addObject("LOV_CLAIM_STATUS",ApplicationCache.getLovByType("CLAIM_TYPE"));

		return mav;
	}
	 
	
	@RequestMapping("/training_manage.htm")
	public ModelAndView training_manage(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("training_manage");
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));
		return mav;
	}
	
	@Autowired
	private PositionCourseService positionService;
	
	@RequestMapping("job_course_manage.htm")
	public ModelAndView job_course_manage(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job_course_manage");
		
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));

		List<Course> courseList = positionService.getCourseList();
		mav.addObject("LOV_COURSE_LIST", courseList);

		return mav;
	}
	
	@RequestMapping("job_course_search.htm")
	public ModelAndView JobCourseSearch(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job_course_search");
		
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		
		List<Course> courseList = positionService.getCourseList();
		mav.addObject("LOV_COURSE_LIST", courseList);
		
		return mav;
	}

	@RequestMapping("job_course_add.htm")
	public ModelAndView job_course_add(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job_course_add");
		
		List<Course> courseList = positionService.getCourseList();
		mav.addObject("LOV_COURSE_LIST", courseList);
		
		return mav;
	}
	
	@RequestMapping("/budget.htm")
	public ModelAndView budget(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("budget_manage");
		return mav;
	}

	// @RequestMapping("/list")
	// public ModelAndView list(HttpServletRequest httpRequest) {
	// ModelAndView mav = new ModelAndView();
	// mav.setViewName("list");
	// return mav;
	// }

	// @RequestMapping("/detail")
	// public ModelAndView detail(HttpServletRequest httpRequest) {
	// ModelAndView mav = new ModelAndView();
	// mav.setViewName("detail");
	// return mav;
	// }
	//
	// @RequestMapping("/report")
	// public ModelAndView report(HttpServletRequest httpRequest) {
	// ModelAndView mav = new ModelAndView();
	// mav.setViewName("report");
	// return mav;
	// }
}
