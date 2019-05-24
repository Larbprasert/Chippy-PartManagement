package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.InvAssetHistoryDao;
import th.co.tpcc.model.InvAssetHistory;

@Service("AssetmanageService")
public class AssetmanageService {

	@Autowired
	private InvAssetHistoryDao assethistoryDao;

	public InvAssetHistory getById(String id) {
		return assethistoryDao.selectById(id);
	}
	public DataTableAjax<InvAssetHistory> getDataTable(InvAssetHistory param) {
		return assethistoryDao.getDataTable(param);
	}

	public void saveOrUpdate(InvAssetHistory obj) {
		if(obj.getAssetOwnerId()!=null && obj.getAssetOwnerId()>0){
			assethistoryDao.update(obj);
		}else{
			obj.setAssetOwnerId(assethistoryDao.insert(obj));
		}
	}
}
