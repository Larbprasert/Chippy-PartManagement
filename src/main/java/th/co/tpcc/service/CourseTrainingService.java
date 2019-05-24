package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.CourseTrainingDao;
import th.co.tpcc.dao.OwnerDao;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.model.Owner;

@Service("courseTrainingService")
public class CourseTrainingService{

	@Autowired
	private CourseTrainingDao courseDao;

//	@Autowired
//	private OwnerDao ownerDao;
	
	public CourseTraining getById(String id) {
		return courseDao.selectById(id);
	}

	public DataTableAjax<CourseTraining> getDataTable(CourseTraining param) {
		return courseDao.getDataTable(param);
	}
	
	public DataTableAjax<CourseTraining> getTrainNeed(CourseTraining param) {
		return courseDao.getTrainNeed(param);
	}

	public void saveOrUpdate(CourseTraining obj) {
		if(obj.getCourseTrainId()!=null && obj.getCourseTrainId()>0){
			courseDao.update(obj);
		}else{
			obj.setCourseTrainId(courseDao.insert(obj));
		}
	}

	public void delete(CourseTraining course) {
		courseDao.delete(course.getCourseId());
	}
	public String findNextGroupNo(String courseCode) {
		return courseDao.findNextGroupNo(courseCode);
	}

	public Course verify(CourseTraining course) {
		return courseDao.selectByCode(course.getCourseCode());
	}
	
	public DataTableAjax<Owner> getTrainList(CourseTraining course) {
		return courseDao.getTrainList(course.getCourseTrainId());
	}

	
	public DataTableAjax<Owner> getTrainAddList(CourseTraining course) {
		return courseDao.getTrainAddList(course);
	}
	
	public void addContractSave(String courseTrainId, String[] ownerId) {
		if(courseTrainId!=null){
			courseDao.addContractSave(courseTrainId, ownerId);
		}
	}

	public void delete(String courseTrainId, String ownerId) {
		courseDao.deleteTrainOwner(courseTrainId, ownerId);
	}

}
