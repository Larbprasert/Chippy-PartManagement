package th.co.portal.service.gas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.EquipmentCertDao;
import th.co.portal.model.gas.UploadFile;


@Service("equipmentCertService")
public class EquipmentCertService{

	@Autowired
	private EquipmentCertDao dao;

	public DataTableAjax<UploadFile> getDataTable(UploadFile param) {
		return dao.getDataTable(param);
	}

	
}
