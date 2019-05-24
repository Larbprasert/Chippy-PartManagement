package th.co.tpcc.controller.manage;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.model.Owner;
import th.co.tpcc.service.CourseService;
import th.co.tpcc.service.CourseTrainingService;

@RestController
@RequestMapping("/course_manage")
public class CourseManageCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CourseTrainingService trainingService ;
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<CourseTraining> getDataTable(@ModelAttribute("courseTraining") CourseTraining courseTraining) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<CourseTraining> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = trainingService.getDataTable(courseTraining);
		return dataTableAjax;
	}
	
	
	@RequestMapping(value = "/getTrainNeed.json")
	public DataTableAjax<CourseTraining> getTrainNeed(@ModelAttribute("courseTraining") CourseTraining courseTraining) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<CourseTraining> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = trainingService.getTrainNeed(courseTraining);
		return dataTableAjax;
	}
	
	
	@RequestMapping(value = "/getTrainList.json")
	public DataTableAjax<Owner> getTrainList(@ModelAttribute("courseTraining") CourseTraining courseTraining) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<Owner> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = trainingService.getTrainList(courseTraining);
		return dataTableAjax;
	}
	
	@RequestMapping(value = "/getTrainAddList.json")
	public DataTableAjax<Owner> getTrainAddList(@ModelAttribute("courseTraining") CourseTraining courseTraining) {
		logger.info(" getDataTable.getTrainAddList ");
		DataTableAjax<Owner> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = trainingService.getTrainAddList(courseTraining);
		return dataTableAjax;
	}
	
	
	@RequestMapping("/courseEdit.htm")
	public ModelAndView courseEdit(String courseTrainId) {
		logger.info(" courseTrainId : "+courseTrainId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("job_course_manage_edit");
		
		mav.addObject("LOV_CLAIM_STATUS",ApplicationCache.getLovByType("CLAIM_TYPE"));
		mav.addObject("LOV_ASSET",ApplicationCache.getLovAsset());
		mav.addObject("LOV_OWNER",ApplicationCache.getLovOwner());
		mav.addObject("LOV_SYS_USERS",ApplicationCache.getLovUsers());

		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		
//		CourseTraining CourseTraining =  new CourseTraining();
//		if(StringUtils.isNotEmpty(claimId)){
//			CourseTraining =  claimService.getById(claimId);
//		}
		
//		mav.addObject("CourseTraining", CourseTraining);
		
		CourseTraining course =  new CourseTraining();
		if(StringUtils.isNotEmpty(courseTrainId)){
			course =  trainingService.getById(courseTrainId);
		}
		mav.addObject("course", course);
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));

		
		return mav;
	}
	
	@RequestMapping("/courseSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("course") CourseTraining course) {
		trainingService.saveOrUpdate(course);
		RedirectView rv = new RedirectView();
	    rv.setUrl("courseEdit.htm?edit=Y&status=S&courseTrainId="+course.getCourseTrainId());
	    return rv;
	}
	
	@RequestMapping("/coursePopup.htm")
	public ModelAndView claimPopup(String claimId) {
		ModelAndView mav = courseEdit(claimId);
		mav.setViewName("job_cours_popup");
		return mav;
	}
	
	@RequestMapping("/findNextGroupNo.json")
	public String findNextGroupNo(String courseCode) {
		return trainingService.findNextGroupNo(courseCode);
	}
	
	@RequestMapping("/addContractSave")
	public String addContractSave(String[] ownerId, String courseTrainId) {
		for (String id : ownerId) {
			logger.info(" id : "+id);
		}
		logger.info(" courseTrainId : "+courseTrainId);
		trainingService.addContractSave(courseTrainId,ownerId);
		
	    return "SUCCESS";
	}
	
	
	@RequestMapping("/addContract.htm")
	public ModelAndView courseAddContract(@ModelAttribute("course") CourseTraining course) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));
		mav.addObject("LOV_COURSE_TYPE",ApplicationCache.getLovByType("COURSE_TYPE"));
		
		if(null!=course.getCourseTrainId()){
			course =  trainingService.getById(course.getCourseTrainId().toString());
		}
		
		mav.addObject("course", course);
		mav.setViewName("job_course_add_contract");
		return mav;
	}
	

	@RequestMapping("/delContractSave")
	public  @ResponseBody String userDelete(String ownerId, String courseTrainId) {
		logger.info(" courseTrainId Delete > : "+courseTrainId);
		logger.info(" owner Delete > : "+ownerId);
		trainingService.delete(courseTrainId, ownerId);
		return "SUCCESS";
	}
	
	
}
