package th.co.tpcc.service;

import org.springframework.stereotype.Service;


@Service("DeptService")
public class DeptService{

	/*@Autowired
	private SheDeptDao deptDao;

	public SheDept getById(String id) {
		return deptDao.selectById(id);
	}

	public DataTableAjax<SheDept> getDataTable(SheDept param) {
		return deptDao.getDataTable(param);
	}

	public void saveOrUpdate(SheDept obj) {
		if(obj.getDeptId()!=null && obj.getDeptId()>0){
			deptDao.update(obj);
		}else{
			obj.setDeptId(deptDao.insert(obj));
		}
	}
	*/
	
}
