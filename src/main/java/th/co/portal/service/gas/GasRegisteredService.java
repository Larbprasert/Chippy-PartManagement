package th.co.portal.service.gas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.GasRegisteredDao;
import th.co.portal.model.gas.Equipment;


@Service("gasRegisteredService")
public class GasRegisteredService{

	@Autowired
	private GasRegisteredDao dao;

	public DataTableAjax<Equipment> getDataTable(Equipment param) {
		return dao.getDataTable(param);
	}

	public void saveOrUpdate(Equipment obj) {
		if(obj.getId()!=null && obj.getId()>0){
			dao.update(obj);
		}else{
			obj.setId(dao.insert(obj));
		}
	}
	
	public Equipment getEquipment(Equipment util) {
	return dao.getEquipment(util);
}

	public Equipment verify(Equipment util) {
		return dao.verify(util);
	}

	public List queryUserByRole(String roleSup) {
		return dao.queryUserByRole(roleSup);
	}
	
}
