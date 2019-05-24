package th.co.baiwa.preferences.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.EditDataTableRespone;
import th.co.baiwa.common.constant.CommonConstants.EditDataTableAction;
import th.co.baiwa.preferences.dao.ParameterGroupDao;
import th.co.baiwa.preferences.dao.ParameterInfoDao;
import th.co.baiwa.preferences.entity.ParameterGroup;
import th.co.baiwa.preferences.entity.ParameterInfo;

@Service("parameterService")
public class ParameterService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ParameterGroupDao parameterGroupDao;
	
	@Autowired
	private ParameterInfoDao parameterInfoDao;

	public DataTableAjax<ParameterGroup> queryParameterGroup(Integer start, Integer length) {
		DataTableAjax<ParameterGroup> dataTableAjax = new DataTableAjax<>();
		
		Long count = parameterGroupDao.countParameterGroup();
		List<ParameterGroup> data = parameterGroupDao.queryParameterGroup(start,length);
		dataTableAjax.setRecordsTotal(count.intValue());
		dataTableAjax.setRecordsFiltered(count.intValue());
		dataTableAjax.setData(data);
		
		return dataTableAjax;
	}

	public void paramGroupAction(EditDataTableRespone<ParameterGroup> editDataTable) {
		logger.info("paramGroupAction");
		
		if (EditDataTableAction.CREATE.equals(editDataTable.getAction())) {
			for (ParameterGroup paramGroup : editDataTable.getData()) {
				//parameterGroupDao.persist(paramGroup);
			}
		} else if (EditDataTableAction.EDIT.equals(editDataTable.getAction())) {
			ParameterGroup oldParamGroup = null;
			for (ParameterGroup paramGroup : editDataTable.getData()) {
				//oldParamGroup = parameterGroupDao.findOne(paramGroup.getParamGroupId());
				oldParamGroup.setParamGroupCode(paramGroup.getParamGroupCode());
				oldParamGroup.setParamGroupDesc(paramGroup.getParamGroupDesc());
				//parameterGroupDao.merge(oldParamGroup);
			}
		} else if (EditDataTableAction.REMOVE.equals(editDataTable.getAction())) {
			for (ParameterGroup paramGroup : editDataTable.getData()) {
				//parameterGroupDao.delete(paramGroup);
			}
		}
	}

	public DataTableAjax<ParameterInfo> queryParameterInfo(Integer start, Integer length, String paramGroupId) {
//		DataTableAjax<ParameterInfo> dataTableAjax = new DataTableAjax<>();
//		
//		Long count = parameterInfoDao.countParameterInfo(paramGroupId);
//		List<ParameterInfo> data = parameterInfoDao.queryParameterInfo(start,length,paramGroupId);
//		dataTableAjax.setRecordsTotal(count.intValue());
//		dataTableAjax.setRecordsFiltered(count.intValue());
//		dataTableAjax.setData(data);
//		
//		return dataTableAjax;
		return null;
	}

	public void paraminfopAction(EditDataTableRespone<ParameterInfo> editDataTable) {
//		logger.info("paraminfopAction");
//		
//		String user = UserLoginUtils.getCurrentUser().getUsername();
//		Date createbyDate = new Date();
//		if(EditDataTableAction.CREATE.equals(editDataTable.getAction())){
//			for (ParameterInfo info : editDataTable.getData()) {
//				info.setCreatedBy(user);
//				info.setCreatedDate(createbyDate);
//				parameterInfoDao.persist(info);
//			}
//		}else if(EditDataTableAction.EDIT.equals(editDataTable.getAction())){
//			for (ParameterInfo info : editDataTable.getData()) {
//				info.setUpdatedBy(user);
//				info.setUpdatedDate(createbyDate);
//				parameterInfoDao.merge(info);
//			}
//		}else if(EditDataTableAction.REMOVE.equals(editDataTable.getAction())){
//			for (ParameterInfo info : editDataTable.getData()) {
//				parameterInfoDao.remove(info);
//			}
//		}
	}

	public ParameterGroup getParamGroupById(ParameterGroup parameterGroup) {
//		return parameterGroupDao.getParamGroupById(parameterGroup);
		return null;
	}

}
