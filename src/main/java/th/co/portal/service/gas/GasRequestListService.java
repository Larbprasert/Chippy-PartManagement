package th.co.portal.service.gas;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.dao.gas.GasRequestDao;
import th.co.portal.model.gas.RequestList;

@Service("gasRequestListService")
public class GasRequestListService {

	@Autowired
	private GasRequestDao dao;

	public DataTableAjax<RequestList> getDataTable(RequestList req) {
		
		
		List<RequestList>  requestList = new  ArrayList<>();
		requestList =dao.getRequestList(req);
//		for (int i = 0; i < 8; i++) {
//			RequestList request = new RequestList();
//			
//			request.setId(i);
//			request.setJobNo("1025465"+i);
//			request.setDepartment("department"+i);
//			request.setEquipmentCode("equipmentCode"+i);
//			request.setEquipmentType("equipmentType"+i);
//			request.setLastCalDate("lastCalDate"+i);
//			request.setNextCalDate("nextCalDate"+i);
//			request.setScheduleStatus("scheduleStatus"+i);
//			request.setStatus(status);
//
//			
//			
//			requestList.add(request);
//		}
		DataTableAjax<RequestList> dataTableAjax = new DataTableAjax<>();
		dataTableAjax.setData(requestList);
		
		return dataTableAjax;
	}
}