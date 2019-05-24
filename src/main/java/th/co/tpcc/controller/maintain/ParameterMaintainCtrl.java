package th.co.tpcc.controller.maintain;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.SysParam;
import th.co.tpcc.service.SysParamService;

@RestController
@RequestMapping("/param")
public class ParameterMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SysParamService sysParamService;
	
	@RequestMapping(value = "/getSysParamTable.json")
	public DataTableAjax<SysParam> getDataTable(@ModelAttribute("sysParam") SysParam sysParam) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<SysParam> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = sysParamService.queryParameter(sysParam);
		return dataTableAjax;
	}
	
	@RequestMapping("/paramEdit.htm")
	public ModelAndView paramEdit(String paramId) {
		logger.info(" paramEdit : "+paramId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("parameter_edit");
		
		mav.addObject("LOV_PARAM_TYPE",ApplicationCache.getLovByType("PARAM_TYPE"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		
		SysParam sysParam =  new SysParam();
		if(StringUtils.isNotEmpty(paramId)){
			sysParam =  sysParamService.getParameterById(paramId);
		}
		mav.addObject("sysParam", sysParam);
		
		return mav;
	}
	
	@RequestMapping("/paramSave.htm")
	public RedirectView paramSave(@ModelAttribute("sysParam") SysParam sysParam) {
		logger.info(" paramSave > sysParam : "+sysParam);
		sysParamService.saveOrUpdateParameter(sysParam);
	    RedirectView rv = new RedirectView();
        rv.setUrl("paramEdit.htm?status=S&paramId="+sysParam.getParamId());
        return rv;
	}
	 
	@RequestMapping("/paramDelete")
	public String paramDelete(String paramId) {
		logger.info(" paramDelete > : "+paramId);
		sysParamService.delete(paramId);
		return "SUCCESS";
	}
	
}
