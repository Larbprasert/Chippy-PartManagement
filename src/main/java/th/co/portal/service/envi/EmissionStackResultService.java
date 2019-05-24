package th.co.portal.service.envi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionStackResultDao;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.EmissionStackResult;

@Service("emissionStackService")
public class EmissionStackResultService {
	
	@Autowired
	private EmissionStackResultDao dao;
	
	public DataTableAjax<EmissionStackResult> getDataTable(EmissionStackResult param) {
		String result = dao.getStackbyParameter(param.getParameter_code());
		String[] array = result.split("\\,", -1);
		//System.out.println("query for stack :"+array.toString());
		
		return dao.getDataTable(param,array);
	}
	public void saveOrUpdate(EmissionStackResult obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			obj.setId(dao.insert(obj));
		}
	}
	
	public ChartResponse<EmissionStackResult> getDataChart(EmissionStackResult param) {
		return dao.getDataChart(param);
	}

}
