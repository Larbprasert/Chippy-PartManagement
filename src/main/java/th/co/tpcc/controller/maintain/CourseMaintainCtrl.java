package th.co.tpcc.controller.maintain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.Course;
import th.co.tpcc.service.CourseService;

@RestController
@RequestMapping("/course")
public class CourseMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@InitBinder
    public void initBinder (WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true));
    }
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/courseEdit.htm")
	public ModelAndView courseEdit(String courseId) {
		logger.info(" courseEdit : "+courseId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("course_edit");
		Course course =  new Course();
		if(StringUtils.isNotEmpty(courseId)){
			course =  courseService.getById(courseId);
		}
		mav.addObject("course", course);
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		mav.addObject("LOV_POSITON",ApplicationCache.getLovByType("POSITION_MASTER"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));


		return mav;
	}
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<Course> getDataTable(@ModelAttribute("course") Course course) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<Course> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = courseService.getDataTable(course);
		return dataTableAjax;
	}
	
	@RequestMapping("/courseSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("course") Course course) {
		courseService.saveOrUpdate(course);
		RedirectView rv = new RedirectView();
	    rv.setUrl("courseEdit.htm?status=S&courseId="+course.getCourseId());
	    return rv;
	}
	@RequestMapping("/courseDelete")
	public @ResponseBody String courseDelete(@ModelAttribute("course") Course course) {
		courseService.delete(course);
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/verify")
	public ResponseEntity<?> verify(@ModelAttribute("course") Course course) {
		try {
			logger.info(" verify > : "+course);
			course = courseService.verify(course);
			if(null!=course&&course.getCourseId()!=null){
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
