package th.co.keihin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;

import th.co.keihin.model.PartMasterBean;
import th.co.keihin.service.PartMasterService;

import th.co.keihin.model.MachineBean;
import th.co.keihin.service.MachineService;

import th.co.keihin.model.PartMachineBean;
import th.co.keihin.service.PartMachineService;

@RestController
public class PartMachineCtrl {
	
	@Autowired
	private PartMachineService partMachineService;
	
	@Autowired
	private PartMasterService partMasterService;
	
	@Autowired
	private MachineService machineService;
	
	
	@RequestMapping("/partMachine/search.json")
	public DataTableAjax<PartMachineBean> search(HttpServletRequest request, HttpServletResponse response,PartMachineBean bean) throws ServletException, IOException {
		DataTableAjax<PartMachineBean> dataTableAjax = partMachineService.getAll(bean);
		return dataTableAjax;
	}
	
	@RequestMapping("/partMachine/searchPart.json")
	public DataTableAjax<PartMachineBean> searchPart(HttpServletRequest request, HttpServletResponse response,PartMachineBean bean) throws ServletException, IOException {
		DataTableAjax<PartMachineBean> dataTableAjax = partMachineService.getPartToMachine(bean);
		return dataTableAjax;
	}
	

}
