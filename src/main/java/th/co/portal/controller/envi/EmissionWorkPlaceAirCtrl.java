package th.co.portal.controller.envi;

import java.text.ParseException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.SystemParam;
import th.co.portal.service.envi.EmissionWorkPlaceAirService;


@RestController
@RequestMapping("/workPlaceAir/")
public class EmissionWorkPlaceAirCtrl {
	@Autowired
	private EmissionWorkPlaceAirService service;
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<EmissionWorkPlaceAir> getDataTable(EmissionWorkPlaceAir workplaceAir)
			throws ParseException {
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(workplaceAir);
		return dataTableAjax;
	}
	
	@RequestMapping(value = "getSysParam.json")
	public List<SystemParam> getparam(String param)
			throws ParseException {
		
		List<SystemParam> listparam = service.getparam(param);
		return listparam;
	}
	
	@RequestMapping(value = "addAndUpdateData.json")
	public String addAndUpdateData(EmissionWorkPlaceAir workplaceAir)
			throws ParseException {
		String success = service.addAndUpdate(workplaceAir);
		return success ; 
	}
	
}
