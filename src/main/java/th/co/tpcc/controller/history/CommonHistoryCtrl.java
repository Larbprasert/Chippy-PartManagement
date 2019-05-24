package th.co.tpcc.controller.history;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import th.co.baiwa.common.ApplicationCache;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.service.HistoryReportService;
import th.co.tpcc.service.PositionCourseService;

@RestController
@RequestMapping("/history")
public class CommonHistoryCtrl {

	private Gson gson = new Gson();

	@Autowired
	private PositionCourseService positionService;
	
	@Autowired
	private HistoryReportService reportService;
	
	
	@RequestMapping("/asset.htm")
	public ModelAndView searchByRegId(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("asset_history");
		
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		return mav;
	}

	@RequestMapping("/claim.htm")
	public ModelAndView searchByDate(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("claim_history");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		return mav;
	}
	
	@RequestMapping("/person.htm")
	public ModelAndView searchPerson(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("person_history");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		return mav;
	}
	
	@RequestMapping("/course.htm")
	public ModelAndView searchCourse(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("course_history");
		
		mav.addObject("LOV_ASSET_TYPE",ApplicationCache.getLovByType("ASSET_TYPE"));
		mav.addObject("LOV_ASSET_STATUS",ApplicationCache.getLovByType("ASSET_STATUS"));
		
		return mav;
	}

	 @RequestMapping("/reportSum.htm")
	 public ModelAndView reportSum(HttpServletRequest httpRequest) {
		 ModelAndView mav = new ModelAndView();
		 
		 List<Course> courseList = positionService.getCourseList();
		 mav.addObject("LOV_COURSE_LIST",  courseList);
		 mav.addObject("LOV_COMPANY", ApplicationCache.getLovByType("COMPANY"));
		 
		 
		 
		 
		 
		 mav.setViewName("report_history");
		 return mav;
	 }
	 
	 @RequestMapping( "/reportNumberTrain.json")
	 public  @ResponseBody String reportNumberTrain(HttpServletRequest httpRequestt, CourseTraining courseTraining) {
		 
		 List<Course> courseList = positionService.getCourseList();
		 
		 Map datas = new HashMap();
		 
		 datas.put("courseList", courseList);
		 
		 datas.put("LOV_COMPANY", ApplicationCache.getLovByType("COMPANY"));
		 
		 datas.put("reportData", reportService.getReport01(courseTraining));
		 
		 return gson.toJson(datas);
	 }


}
