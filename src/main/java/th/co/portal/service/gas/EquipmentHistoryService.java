package th.co.portal.service.gas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.EquipmentHistoryDao;
import th.co.portal.model.gas.RequestedHistory;


@Service("EquipmentHistoryService")
public class EquipmentHistoryService{

	@Autowired
	private EquipmentHistoryDao dao;

	public DataTableAjax<RequestedHistory> getDataTable(RequestedHistory param) {
		return dao.getDataTable(param);
	}

	
	/*public ResponseResult insertRequestTrans(Requested requested) {
		requested.setRequestStatus(GasConstants.REQUEST_STATUS.CREATED);
		requested.setEqType(GasConstants.EQUIPMENT_TYPE.GAS_DETECTOR);
		
		dao.insertRequestTrans(requested);
		
		ResponseResult responseResult = new ResponseResult();

		responseResult.setCode(GasConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(GasConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(requested);
		return responseResult;
			
	}*/
	
}
