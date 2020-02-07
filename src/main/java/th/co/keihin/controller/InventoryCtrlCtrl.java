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
import th.co.keihin.model.InventoryCtrlBean;
import th.co.keihin.service.LocationService;
import th.co.keihin.service.MakerService;
import th.co.keihin.service.InventoryCtrlService;
import th.co.keihin.service.UnitTypeService;

@RestController
public class InventoryCtrlCtrl {

	@Autowired
	private InventoryCtrlService inventoryCtrlService;

	@Autowired
	private UnitTypeService unitTypeService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private MakerService makerService;
	

	@RequestMapping("/inventoryCtrl/inventoryCtrl_list.htm")
	public ModelAndView inventoryCtrl_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("inventoryCtrl_list");
		return mav;
	}

	@RequestMapping("/inventoryCtrl/inventoryCtrl_view.htm")
	public ModelAndView inventoryCtrl_view(HttpServletRequest httpRequest, InventoryCtrlBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("inventoryCtrlBean", inventoryCtrlService.getInventoryCtrlBeanByID(bean.getInventory_ID()));

		mav.setViewName("inventoryCtrl_view");
		return mav;
	}

	@RequestMapping("/inventoryCtrl/inventoryCtrl_create.htm")
	public ModelAndView inventoryCtrl_create(HttpServletRequest httpRequest, InventoryCtrlBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("inventoryCtrlBean", inventoryCtrlService.getInventoryCtrlBeanByID(bean.getInventory_ID()));

		mav.addObject("LOV_UNITTYPE", unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION", locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER", makerService.loadActiveMaker());
		
		mav.addObject("LOV_ACTIVE_FLG", ApplicationCache.getLovActiveFlag());

		mav.addObject("LOV_RANKING", ApplicationCache.getLovRanking());

		mav.setViewName("inventoryCtrl_create");
		return mav;
	}

	@RequestMapping("/inventoryCtrl/inventoryCtrl_edit.htm")
	public ModelAndView inventoryCtrl_edit(HttpServletRequest httpRequest, InventoryCtrlBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("inventoryCtrlBean", inventoryCtrlService.getInventoryCtrlBeanByID(bean.getInventory_ID()));

		mav.addObject("LOV_UNITTYPE", unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION", locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER", makerService.loadActiveMaker());
		
		mav.addObject("LOV_ACTIVE_FLG", ApplicationCache.getLovActiveFlag());

		mav.addObject("LOV_MOVEMENT", ApplicationCache.getLovMovement());

		mav.addObject("LOV_RANKING", ApplicationCache.getLovRanking());

		mav.setViewName("inventoryCtrl_edit");
		return mav;
	}

	@RequestMapping("/inventoryCtrl/inventoryCtrl_save.htm")
	public ModelAndView inventoryCtrl_save(HttpServletRequest httpRequest, InventoryCtrlBean bean, String rAction) {

		if ("Edit".equals(rAction)) {
			inventoryCtrlService.edit(bean);
		} else if ("Create".equals(rAction)) {
			inventoryCtrlService.save(bean);
		} else if ("Delete".equals(rAction)) {
			inventoryCtrlService.delete(bean);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../inventoryCtrl/inventoryCtrl_list.htm");
		mav.addObject("status", "S");

		return mav;
	}

	@RequestMapping("/inventoryCtrl/search.json")
	public DataTableAjax<InventoryCtrlBean> search(HttpServletRequest request, HttpServletResponse response,
			InventoryCtrlBean bean) throws ServletException, IOException {
		DataTableAjax<InventoryCtrlBean> dataTableAjax = inventoryCtrlService.getAll(bean);
		return dataTableAjax;
	}
	
	
}
