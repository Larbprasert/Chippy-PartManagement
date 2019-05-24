package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionAmbientAir24Dao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.EmissionAmbientAir24;

@Service("emissionAmbientAir24Service")
public class EmissionAmbientAir24Service {
	
	@Autowired
	private EmissionAmbientAir24Dao dao;
	
	public DataTableAjax<EmissionAmbientAir24> getDataTable(EmissionAmbientAir24 param) {
		return dao.getDataTable(param);
	}
	
	public void saveOrUpdate(EmissionAmbientAir24 obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			obj.setId(dao.insert(obj));
		}
		//obj.setId(dao.insert(obj));
	}
	public ChartResponse<EmissionAmbientAir24> getDataChart(EmissionAmbientAir24 param) {
		return dao.getDataChart(param);
	}
	
	public EmissionAmbientAir24 verifyData(EmissionAmbientAir24 param) {
		return dao.verifyData(param);
	}


}
