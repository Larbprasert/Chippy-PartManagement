package th.co.tpcc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.PositionCourseDao;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.PositionCourse;


@Service("PositionCourseService")
public class PositionCourseService{

	@Autowired
	private PositionCourseDao positionCourseDao;
	
//	@Autowired
//	private CourseDao courseDao;

	public PositionCourse getById(String id) {
		return positionCourseDao.selectById(id);
	}

	public DataTableAjax<PositionCourse> getDataTable(PositionCourse param) {
		return positionCourseDao.getDataTable(param);
	}

	public List<Course> getCourseList() {
		return positionCourseDao.getCourseList();
	}

	public void update(PositionCourse obj) {
		 positionCourseDao.update(obj);
	}

	
}
