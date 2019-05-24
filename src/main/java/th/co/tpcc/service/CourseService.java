package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.CourseDao;
import th.co.tpcc.model.Course;


@Service("CourseService")
public class CourseService{

	@Autowired
	private CourseDao courseDao;

	public Course getById(String id) {
		return courseDao.selectById(id);
	}

	public DataTableAjax<Course> getDataTable(Course param) {
		return courseDao.getDataTable(param);
	}

	public void saveOrUpdate(Course obj) {
		if(obj.getCourseId()!=null && obj.getCourseId()>0){
			courseDao.update(obj);
		}else{
			obj.setCourseId(courseDao.insert(obj));
		}
	}

	public void delete(Course course) {
		courseDao.delete(course.getCourseId());
	}

	public Course verify(Course course) {
		return courseDao.selectByCode(course.getCourseCode());
	}
	
}
