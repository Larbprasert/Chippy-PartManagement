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

import th.co.keihin.service.MachineService;
import th.co.keihin.model.MachineBean;

import th.co.keihin.service.ProductionLineService;
import th.co.keihin.model.ProductionLineBean;


@RestController
public class MachineCtrl {
	
	@Autowired
	private MachineService machineService;

	@Autowired
	private ProductionLineService productionLineService;
//	
	@RequestMapping("/machine/machine_list.htm")
	public ModelAndView machine_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("machine_list");
		return mav;
	}
	
	@RequestMapping("/machine/machine_view.htm")
	public ModelAndView machine_view(HttpServletRequest httpRequest, MachineBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("machineBean",machineService.getMachineBeanByID(bean.getMachine_ID()));
	
		mav.setViewName("machine_view");
		return mav;
	}
	 
	@RequestMapping("/machine/machine_create.htm")
	public ModelAndView machine_create(HttpServletRequest httpRequest, MachineBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("machineBean",machineService.getMachineBeanByID(bean.getMachine_ID()));
		
		mav.addObject("LOV_FACTORY",productionLineService.loadActiveProductionLine());

		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("machine_create");
		return mav;
	}
	
	@RequestMapping("/machine/machine_edit.htm")
	public ModelAndView machine_edit(HttpServletRequest httpRequest, MachineBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("machineBean",machineService.getMachineBeanByID(bean.getMachine_ID()));
		
		mav.addObject("LOV_FACTORY",productionLineService.loadActiveProductionLine());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
				
		mav.setViewName("machine_edit");
		return mav;
	}
	
	@RequestMapping("/machine/machine_save.htm")
	public ModelAndView machine_save(HttpServletRequest httpRequest, MachineBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			machineService.edit(bean);
		}else if ("Create".equals(rAction)) {
			machineService.save(bean);
		}else if ("Delete".equals(rAction)) {
			machineService.delete(bean);		
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../machine/machine_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/machine/search.json")
	public DataTableAjax<MachineBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<MachineBean> dataTableAjax = machineService.getAll();
		return dataTableAjax;
	}

}
