package th.co.portal.controller.envi;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.EmissionWorkPlaceNoise;
import th.co.portal.model.envi.SystemParam;
import th.co.portal.service.envi.EmissionWorkPlaceNoiseService;

@RestController
@RequestMapping("/workPlaceNoise/")
public class EmissionWorkPlaceNoiseCtrl   {
	
	@Autowired
	private EmissionWorkPlaceNoiseService service;
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<EmissionWorkPlaceNoise> getDataTable(EmissionWorkPlaceNoise workplaceNoise)
			throws ParseException {
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(workplaceNoise);
		return dataTableAjax;
	}
	
	@RequestMapping(value = "addAndUpdateData.json")
	public String addAndUpdateData(EmissionWorkPlaceNoise workplaceNoise)
			throws ParseException {
		String success = service.addAndUpdate(workplaceNoise);
		return success ; 
	}

}
