package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.InvAssetDao;
import th.co.tpcc.model.InvAsset;

@Service("AssetService")
public class AssetService {

	@Autowired
	private InvAssetDao assetDao;

	public InvAsset getById(String id) {
		return assetDao.selectById(id);
	}

	public DataTableAjax<InvAsset> getDataTable(InvAsset param) {
		return assetDao.getDataTable(param);
	}

	public void saveOrUpdate(InvAsset obj) {
		if (obj.getAssetId() != null && obj.getAssetId() > 0) {
			assetDao.update(obj);
		} else {
			obj.setAssetId(assetDao.insert(obj));
		}
	}

	public boolean existHostId(String hostId) {
		return assetDao.existHostId(hostId);
	}
}
