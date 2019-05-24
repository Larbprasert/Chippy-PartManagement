package th.co.portal.controller.envi;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.EmissionWWT;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.EmissionWorkPlaceNoise;
import th.co.portal.service.envi.EmissionWWTService;
import th.co.portal.service.envi.EmissionWorkPlaceNoiseService;

@RestController
@RequestMapping("/wwt/")
public class EmissionWWTCtrl  {
	
	@Autowired
	private EmissionWWTService service;
	
	@RequestMapping(value = "getDataTable.json")
	public DataTableAjax<EmissionWWT> getDataTable(EmissionWWT param)
			throws ParseException {
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(param);
		return dataTableAjax;
	}
	
	@RequestMapping(value = "addAndUpdateData.json")
	public String addAndUpdateData(EmissionWWT param)
			throws ParseException {
		String success = service.addAndUpdate(param);
		return success ; 
	}
}
