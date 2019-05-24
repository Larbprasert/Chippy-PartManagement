package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.InvClaimHistoryDao;
import th.co.tpcc.dao.InvDocumentDao;
import th.co.tpcc.model.InvClaimHistory;

@Service("claimService")
public class ClaimService{

	@Autowired
	private InvClaimHistoryDao claimhistoryDao;
	
	@Autowired
	private InvDocumentDao invDocumentDao;

	public InvClaimHistory getById(String id) {
		InvClaimHistory claimHistory  = claimhistoryDao.selectById(id);
		claimHistory.setDocuments(invDocumentDao.selectByClaimId(claimHistory.getClaimId()));
		return claimHistory;
	}
	public DataTableAjax<InvClaimHistory> getDataTable(InvClaimHistory param) {
		return claimhistoryDao.getDataTable(param);
	}

	public void saveOrUpdate(InvClaimHistory obj) {
		if(obj.getClaimId()!=null && obj.getClaimId()>0){
			claimhistoryDao.update(obj);
		}else{
			obj.setClaimId(claimhistoryDao.insert(obj));
		}
	}
}
