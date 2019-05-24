package th.co.portal.controller.gas;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.gas.RequestedHistory;
import th.co.portal.service.gas.EquipmentHistoryService;

@RestController
@RequestMapping("/jobHistory/")
public class EquipmentHistoryCtrl {
	

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EquipmentHistoryService service ;
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<RequestedHistory> getDataTable(@ModelAttribute("bean") RequestedHistory bean) {
		logger.info(" getDataTable.getHistoryTable ");
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(bean);
		return dataTableAjax;
	}
	
	
}
