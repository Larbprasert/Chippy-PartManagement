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
import th.co.tpcc.model.SheDept;
import th.co.tpcc.service.DeptService;

@RestController
@RequestMapping("/dept")
public class DeptMaintainCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("/deptEdit.htm")
	public ModelAndView deptEdit(String deptId) {
		logger.info(" deptEdit : "+deptId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dept_edit");
		SheDept invDept =  new SheDept();
		if(StringUtils.isNotEmpty(deptId)){
//			invDept =  deptService.getById(deptId);
		}
		mav.addObject("invDept", invDept);
		
		return mav;
	}
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<SheDept> getDataTable(@ModelAttribute("invDept") SheDept invDept) {
		logger.info(" getDataTable.getDataTable ");
		DataTableAjax<SheDept> dataTableAjax = new DataTableAjax<>();
//		dataTableAjax = deptService.getDataTable(invDept);
		return dataTableAjax;
	}
	
	@RequestMapping("/deptSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("invDept") SheDept invDept) {
//		deptService.saveOrUpdate(invDept);
		RedirectView rv = new RedirectView();
	    rv.setUrl("deptEdit.htm?status=S&deptId="+invDept.getDeptId());
	    return rv;
	}
}
