package th.co.portal.service.gas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.FFERegisteredDao;
import th.co.portal.model.gas.Equipment;


@Service("ffeRegisteredService")
public class FFERegisteredService{

	@Autowired
	private FFERegisteredDao dao;

	public DataTableAjax<Equipment> getDataTable(Equipment param) {
		return dao.getDataTable(param);
	}

	public void saveOrUpdate(Equipment obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			obj.setId(dao.insert(obj));
		}
	}
//
//	public void delete(Course course) {
//		courseDao.delete(course.getCourseId());
//	}
//
//	public Course verify(Course course) {
//		return courseDao.selectByCode(course.getCourseCode());
//	}

	public Equipment verify(Equipment util) {
		return dao.verify(util);
	}
	
}
