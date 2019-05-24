package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.PRTRChemicalDao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.PRTRChemical;
import th.co.portal.model.envi.UtilityEnergyInv;

@Service("PRTRChemicalService")
public class PRTRChemicalService {
	
	@Autowired
	private PRTRChemicalDao dao;
	
	public DataTableAjax<PRTRChemical> getDataTable(String name ,String status) {
		return dao.getDataTable(name,status);
	}
	
	public void saveOrUpdate(PRTRChemical obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			dao.insert(obj);
		}
		//obj.setId(dao.insert(obj));
	}
	
	public ChartResponse<PRTRChemical> getDataChart(PRTRChemical param) {
		return dao.getDataChart(param);
	}

	public DataTableAjax<PRTRChemical> getDataOnSelect() {
		return dao.getDataOnSelect();
	}
	
}
