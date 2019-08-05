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

import th.co.keihin.service.LocationService;
import th.co.keihin.service.MachineService;
import th.co.keihin.service.MakerService;
import th.co.keihin.service.MoldTypeService;
import th.co.keihin.service.PartMasterService;
import th.co.keihin.service.UnitTypeService;


@RestController
public class PartMasterCtrl {
	
	@Autowired
	private PartMasterService partMasterService;

	@Autowired
	private UnitTypeService unitTypeService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private MakerService makerService;
	
	@Autowired
	private MoldTypeService moldTypeService;

	@Autowired
	private MachineService machineService;
	
	
//	
	@RequestMapping("/partMaster/sparepart_report.htm")
	public ModelAndView spartpart_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("LOV_MACHINE",machineService.loadActiveMachine());
		
		mav.setViewName("sparepart_report");
		return mav;
	}
	
	@RequestMapping("/partMaster/partMaster_list.htm")
	public ModelAndView partMaster_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("partMaster_list");
		return mav;
	}
	
	@RequestMapping("/partMaster/partMaster_view.htm")
	public ModelAndView partMaster_view(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));

		mav.setViewName("partMaster_view");
		return mav;
	}
	 
	@RequestMapping("/partMaster/partMaster_create.htm")
	public ModelAndView partMaster_create(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));
		
		mav.addObject("LOV_UNITTYPE",unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER",makerService.loadActiveMaker());
		mav.addObject("LOV_MOLDTYPE",moldTypeService.loadActiveMoldType());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.addObject("LOV_RANKING",ApplicationCache.getLovRanking());

		mav.setViewName("partMaster_create");
		return mav;
	}
	
	@RequestMapping("/partMaster/partMaster_edit.htm")
	public ModelAndView partMaster_edit(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("partMasterBean",partMasterService.getPartMasterBeanByID(bean.getPart_ID()));
		
		mav.addObject("LOV_UNITTYPE",unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER",makerService.loadActiveMaker());
		mav.addObject("LOV_MOLDTYPE",moldTypeService.loadActiveMoldType());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.addObject("LOV_MOVEMENT",ApplicationCache.getLovMovement());
				
		mav.addObject("LOV_RANKING",ApplicationCache.getLovRanking());
		
		mav.setViewName("partMaster_edit");
		return mav;
	}
	
	@RequestMapping("/partMaster/partMaster_save.htm")
	public ModelAndView partMaster_save(HttpServletRequest httpRequest, PartMasterBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			partMasterService.edit(bean);
		}else if ("Create".equals(rAction)) {
			partMasterService.save(bean);
		}else if ("Delete".equals(rAction)) {
			partMasterService.delete(bean);		
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../partMaster/partMaster_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/partMaster/search.json")
	public DataTableAjax<PartMasterBean> search(HttpServletRequest request, HttpServletResponse response,PartMasterBean bean) throws ServletException, IOException {
		DataTableAjax<PartMasterBean> dataTableAjax = partMasterService.getAll(bean);
		return dataTableAjax;
	}
}
