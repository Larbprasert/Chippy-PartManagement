package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.PRTRChemicalDao;
import th.co.portal.dao.envi.PRTREmissionDao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.PRTRChemical;
import th.co.portal.model.envi.PRTREmission;
import th.co.portal.model.envi.UtilityEnergyInv;

@Service("PRTREmissionService")
public class PRTREmissionService {
	
	@Autowired
	private PRTREmissionDao dao;
	
	
	public DataTableAjax<PRTREmission> getDataTable(String company,String year) {
		return dao.getDataTable(company,year);
	}
	
	public void saveOrUpdate(PRTREmission obj) {
		
		
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			dao.insert(obj);
		}
		//obj.setId(dao.insert(obj));
	}
	
	public ChartResponse<PRTREmission> getDataChart(PRTREmission param) {
		return dao.getDataChart(param);
	}
	
}
