package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.UtilityEnergyInvDao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.UtilityEnergyInv;


@Service("utilityEnergyInvService")
public class UtilityEnergyInvService{

	@Autowired
	private UtilityEnergyInvDao dao;

//	public Course getById(String id) {
//		return courseDao.selectById(id);
//	}
//
	public DataTableAjax<UtilityEnergyInv> getDataTable(UtilityEnergyInv param) {
		return dao.getDataTable(param);
	}

	public void saveOrUpdate(UtilityEnergyInv obj) {
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

	public UtilityEnergyInv verify(UtilityEnergyInv util) {
		return dao.verify(util);
	}
	
	public  ChartResponse<UtilityEnergyInv>  getDataChart(UtilityEnergyInv util) {
		return dao.getDataChart(util);
	}
	
}
