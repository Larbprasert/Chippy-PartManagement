package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.OwnerDao;
import th.co.tpcc.model.CourseOwner;
import th.co.tpcc.model.Owner;

@Service("OwnerService")
public class OwnerService{

	@Autowired
	private OwnerDao ownerDao;

	public Owner getOwnerById(String ownerId) {
		return ownerDao.getOwnerById(ownerId);
	}

	public DataTableAjax<Owner> getDataTable(Owner param) {
		return ownerDao.getDataTable(param);
	}
	
	public DataTableAjax<Owner> getDataTableOwnerTrain(Owner param) {
		return ownerDao.getDataTableOwnerTrain(param);
	}
	
	public DataTableAjax getDataTablePersonCourse(CourseOwner param) {
		return ownerDao.getDataTablePersonCourse(param);
	}

	public void saveOrUpdate(Owner owner) {
		if(owner.getOwnerId()!=null && owner.getOwnerId()>0){
			ownerDao.update(owner);
		}else{
			owner.setOwnerId(ownerDao.insert(owner));
			updateOwnerImage(owner);
		}
	}
	
	public void updateOwnerImage(Owner owner) {
			ownerDao.updateOwnerImage(owner);
	}
	
	public void delete(Owner owner) {
		ownerDao.delete(owner.getOwnerId());
	}

	public Owner verify(Owner owner) {
		return ownerDao.verify(owner.getOwnerCode());
	}
}
