package th.co.tpcc.controller.maintain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.PositionCourse;
import th.co.tpcc.service.PositionCourseService;

@RestController
@RequestMapping("/posCourse")
public class PositionCourseMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@InitBinder
    public void initBinder (WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true));
    }
	
	@Autowired
	private PositionCourseService positionService;
	
	
	@RequestMapping("/positionEdit.htm")
	public ModelAndView positionEdit(String positionId) {
		logger.info(" positionEdit : "+positionId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("position_course_edit");
		PositionCourse positionCourse =  new PositionCourse();
		if(StringUtils.isNotEmpty(positionId)){
			positionCourse =  positionService.getById(positionId);
		}
		mav.addObject("positionCourse", positionCourse);
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		mav.addObject("LOV_POSITON",ApplicationCache.getLovByType("POSITION_MASTER"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));

		List<Course> courseList = positionService.getCourseList();
		mav.addObject("courseList", courseList);
		
		return mav;
	}

	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<PositionCourse> getDataTable(@ModelAttribute("positionCourse") PositionCourse positionCourse) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<PositionCourse> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = positionService.getDataTable(positionCourse);
		return dataTableAjax;
	}
		
	@RequestMapping("/positionSave.htm")
	public RedirectView update(@ModelAttribute("positionCourse") PositionCourse positionCourse) {
		positionService.update(positionCourse);
		RedirectView rv = new RedirectView();
	    rv.setUrl("positionEdit.htm?status=S&positionId="+positionCourse.getPositionId());
	    return rv;
	}
	
	/*
	@RequestMapping("/positionDelete.htm")
	public @ResponseBody String positionDelete(@ModelAttribute("positionCourse") PositionCourse positionCourse) {
		positionService.delete(positionCourse);
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/verify")
	public ResponseEntity<?> verify(@ModelAttribute("positionCourse") PositionCourse positionCourse) {
		try {
			logger.info(" verify > : "+positionCourse);
			positionCourse = positionService.verify(positionCourse);
			if(null!=positionCourse&&positionCourse.getPositionCourseId()!=null){
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
