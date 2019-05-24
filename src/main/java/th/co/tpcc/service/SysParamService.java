package th.co.tpcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.dao.SysParamDao;
import th.co.tpcc.model.SysParam;

@Service("SysParamService")
public class SysParamService{
	
	@Autowired
	private SysParamDao sysParamDao;
	
	@Autowired
	private ApplicationCache applicationCache;
	
	public DataTableAjax<SysParam> queryParameter(SysParam param) {
		return sysParamDao.queryParameter(param);
	}

	public SysParam getParameterById(String paramId) {
		return sysParamDao.getParameterById(paramId);
	}

	public SysParam saveOrUpdateParameter(SysParam sysParam) {
		if(sysParam.getParamId()>0){
			sysParamDao.update(sysParam);
		}else{
			sysParamDao.insert(sysParam);
		}
		
		applicationCache.reloadCache();
		
		return sysParam;
	}

	public void delete(String paramId) {
		sysParamDao.delete(Long.parseLong(paramId));
	}
}
