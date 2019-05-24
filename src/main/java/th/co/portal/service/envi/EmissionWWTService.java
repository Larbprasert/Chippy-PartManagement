package th.co.portal.service.envi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.envi.EmissionWWTDao;
import th.co.portal.dao.envi.EmissionWorkPlaceNoiseDao;
import th.co.portal.model.envi.EmissionWWT;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.EmissionWorkPlaceNoise;
import th.co.portal.model.envi.SystemParam;

@Service("wwtService")
public class EmissionWWTService {

	@Autowired
	private EmissionWWTDao dao;

	public DataTableAjax<EmissionWorkPlaceAir> getDataTable(EmissionWWT param) {
		return dao.getDataTable(param);
	}

	public String addAndUpdate(EmissionWWT param) {
	
		String successCode ;
		try {
			if(param.getId() == 0  || param.getId() == null) {
				if(dao.checkDuplicateData(param) > 0) {
					successCode = "-1";
				}else {
					successCode =  dao.insertData(param);
				}
			}else {
				successCode = dao.updateData(param);
			}
		}catch (Exception e) {
			successCode = "0";
		}
		
		return successCode;
		
	}

}
