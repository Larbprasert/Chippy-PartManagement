package th.co.portal.service.gas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.EquipmentCertDao;
import th.co.portal.model.gas.CertDocument;


@Service("equipmentCertService")
public class EquipmentCertService{

	@Autowired
	private EquipmentCertDao dao;

	public DataTableAjax<CertDocument> getDataTable(CertDocument param) {
		return dao.getDataTable(param);
	}

	
}
