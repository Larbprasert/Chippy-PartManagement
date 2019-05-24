package th.co.portal.controller.gas;

import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.gas.RequestList;
import th.co.portal.service.gas.GasRequestListService;

@RestController
@RequestMapping("/GasRequestList/")
public class GasRequestListCtrl {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GasRequestListService service;

	//All
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public DataTableAjax<RequestList> search(
//			@RequestParam("department") String department,
//			@RequestParam("status") String status, 
//			@RequestParam("equipmentCode") String equipmentCode,
//			@RequestParam("equipmentType") String equipmentType
			RequestList req
			) throws ParseException {
//		logger.info("GasRequestList => department :" + department + " status :" + status + " equipmentCode :"
//				+ equipmentCode + " equipmentType :" + equipmentType);
		logger.info("GasRequestList => req :" +req);

		DataTableAjax<RequestList> dataTableAjax = service.getDataTable(req);
		return dataTableAjax;
	}
}
