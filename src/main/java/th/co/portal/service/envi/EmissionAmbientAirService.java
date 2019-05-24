package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionAmbientAirDao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.UtilityEnergyInv;

@Service("EmissionAmbientAirService")
public class EmissionAmbientAirService {
	
	@Autowired
	private EmissionAmbientAirDao dao;
	
	public DataTableAjax<EmissionAmbientAir> getDataTable(EmissionAmbientAir param) {
		return dao.getDataTable(param);
	}
	
	public void saveOrUpdate(EmissionAmbientAir obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			obj.setId(dao.insert(obj));
		}
		//obj.setId(dao.insert(obj));
	}
	
	public ChartResponse<EmissionAmbientAir> getDataChart(EmissionAmbientAir param) {
		return dao.getDataChart(param);
	}
	public EmissionAmbientAir verifyData(EmissionAmbientAir param) {
		return dao.verifyData(param);
	}

}
