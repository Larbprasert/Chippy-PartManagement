package th.co.portal.service.envi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionWorkPlaceNoiseDao;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.EmissionWorkPlaceNoise;
import th.co.portal.model.envi.SystemParam;

@Service("workPlaceNoiseService")
public class EmissionWorkPlaceNoiseService {

	@Autowired
	private EmissionWorkPlaceNoiseDao dao;

	public DataTableAjax<EmissionWorkPlaceNoise> getDataTable(EmissionWorkPlaceNoise param) {
		return dao.getDataTable(param);
	}

	public String addAndUpdate(EmissionWorkPlaceNoise workplaceNoise) {
	
		String successCode ;
		try {
			if(workplaceNoise.getId() == null) {
				if(dao.checkDuplicateData(workplaceNoise) > 0) {
					successCode = "-1";
				}else {
					successCode =  dao.insertData(workplaceNoise);
				}
			}else {
				successCode = dao.updateData(workplaceNoise);
			}
		}catch (Exception e) {
			successCode = "0";
		}
		
		return successCode;
		
	}

}
