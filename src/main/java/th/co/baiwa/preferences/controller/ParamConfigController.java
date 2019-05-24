package th.co.baiwa.preferences.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.EditDataTableRespone;
import th.co.baiwa.common.bean.FieldErrors;
import th.co.baiwa.common.constant.CommonConstants.ANGULAR2;
import th.co.baiwa.preferences.entity.ParameterGroup;
import th.co.baiwa.preferences.entity.ParameterInfo;
import th.co.baiwa.preferences.service.ParameterService;

@Controller
@RequestMapping(value = "/admin")
public class ParamConfigController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ParameterService parameterService;
	
	@RequestMapping(value = "/param-config.htm", method = RequestMethod.GET)
	public ModelAndView param(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(ANGULAR2.VIWE_NAME);
		mav.addObject(ANGULAR2.APP_NAME, "baiwa/paramconfig.main");
		
		return mav;
	}
	
	@RequestMapping(value = "/param-config-detail.htm", method = RequestMethod.GET)
	public ModelAndView paramDetail(HttpServletRequest httpRequest, @RequestParam String groupId) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(ANGULAR2.VIWE_NAME);
		mav.addObject(ANGULAR2.APP_NAME, "baiwa/paramConfigDetail.main");
		
		return mav;
	}
	
	@RequestMapping(value = "/getParamGroup.json", method = RequestMethod.POST)
	public @ResponseBody DataTableAjax<ParameterGroup> getParamGroup(Integer start, Integer length) {
		DataTableAjax<ParameterGroup> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = parameterService.queryParameterGroup(start,length);
		
		return dataTableAjax;
	}
	
	@RequestMapping(value = "/paramGroupAction.json", method = RequestMethod.POST)
	public @ResponseBody EditDataTableRespone<ParameterGroup> paramGroupAction(@RequestBody EditDataTableRespone<ParameterGroup> editDataTable) {
		logger.info("editDataTable");
		
		try {
			parameterService.paramGroupAction(editDataTable);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			editDataTable.setError(e.getMessage());
			FieldErrors parameterGroupCode = new FieldErrors();
			parameterGroupCode.setName("parameterGroupCode");
			parameterGroupCode.setStatus("Error paramcode not found!");
			List<FieldErrors> fieldErrors = new ArrayList<>();
			fieldErrors.add(parameterGroupCode);
			editDataTable.setFieldErrors(fieldErrors);
		}
		
		return editDataTable;
	}
	
	@RequestMapping(value = "/getParamInfo.json", method = RequestMethod.POST)
	public @ResponseBody DataTableAjax<ParameterInfo> getParamInfo(Integer start, Integer length, String paramGroupId) {
		logger.info("paramGroupId : " + paramGroupId);
		
		DataTableAjax<ParameterInfo> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = parameterService.queryParameterInfo(start,length,paramGroupId);
		
		return dataTableAjax;
	}
	
	@RequestMapping(value = "/paraminfopAction.json", method = RequestMethod.POST)
	public @ResponseBody EditDataTableRespone<ParameterInfo> paraminfopAction(@RequestBody EditDataTableRespone<ParameterInfo> editDataTable) {
		logger.info("editDataTable");
		
		try {
			parameterService.paraminfopAction(editDataTable);
		} catch (Exception e) {
			logger.error(e.getMessage());
			editDataTable.setError(e.getMessage());
		}
		
		return editDataTable;
	}
	
	@RequestMapping(value = "/getParamGroupById.json", method = RequestMethod.POST)
	public @ResponseBody ParameterGroup getParamGroupById(@RequestBody ParameterGroup parameterGroup) {
		try {
			return parameterService.getParamGroupById(parameterGroup);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ParameterGroup();
		}
	}
	
}
