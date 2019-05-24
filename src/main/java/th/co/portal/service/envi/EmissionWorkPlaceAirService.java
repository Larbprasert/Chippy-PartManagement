package th.co.portal.service.envi;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionWorkPlaceAirDao;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.SystemParam;

@Service("workPlaceAirService")
public class EmissionWorkPlaceAirService {
	@Autowired
	private EmissionWorkPlaceAirDao dao;

	public DataTableAjax<EmissionWorkPlaceAir> getDataTable(EmissionWorkPlaceAir param) {
		return dao.getDataTable(param);
	}

	public List<SystemParam> getparam(String param) {
		return dao.getSystemParam(param);
	}

	public String addAndUpdate(EmissionWorkPlaceAir workplaceAir) {
	
		String successCode ;
		try {
			if(workplaceAir.getId() == null || workplaceAir.getId() ==  0 ) {
				if(dao.checkDuplicateData(workplaceAir) > 0) {
					successCode = "-1";
				}else {
					successCode =  dao.insertData(workplaceAir);
				}	
			}else {
				successCode = dao.updateData(workplaceAir);
			}
		}catch (Exception e) {
			e.printStackTrace();
			successCode = "0";
		}
		
		return successCode;
		
	}

}
