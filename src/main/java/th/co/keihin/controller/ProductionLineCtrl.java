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

import th.co.keihin.service.ProductionLineService;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.ProductionLineBean;

import th.co.keihin.service.FactoryService;


@RestController
public class ProductionLineCtrl {
	
	@Autowired
	private ProductionLineService productionLineService;

	@Autowired
	private FactoryService factoryService;
//	
	@RequestMapping("/productionLine/productionLine_list.htm")
	public ModelAndView productionLine_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("productionLine_list");
		return mav;
	}
	
	@RequestMapping("/productionLine/productionLine_view.htm")
	public ModelAndView productionLine_view(HttpServletRequest httpRequest, ProductionLineBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("productionLineBean",productionLineService.getProductionLineBeanByID(bean.getProductionLine_ID()));

		mav.setViewName("productionLine_view");
		return mav;
	}
	 
	@RequestMapping("/productionLine/productionLine_create.htm")
	public ModelAndView productionLine_create(HttpServletRequest httpRequest, ProductionLineBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productionLineBean",productionLineService.getProductionLineBeanByID(bean.getProductionLine_ID()));
		
		mav.addObject("LOV_FACTORY",factoryService.loadActiveFactory());

		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());

		mav.setViewName("productionLine_create");
		return mav;
	}
	
	@RequestMapping("/productionLine/productionLine_edit.htm")
	public ModelAndView productionLine_edit(HttpServletRequest httpRequest, ProductionLineBean bean) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productionLineBean",productionLineService.getProductionLineBeanByID(bean.getProductionLine_ID()));
		
		mav.addObject("LOV_FACTORY",factoryService.loadActiveFactory());
		
		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
				
		mav.setViewName("productionLine_edit");
		return mav;
	}
	
	@RequestMapping("/productionLine/productionLine_save.htm")
	public ModelAndView productionLine_save(HttpServletRequest httpRequest, ProductionLineBean bean, String rAction) {
		
		if ("Edit".equals(rAction)) {
			productionLineService.edit(bean);
		}else if ("Create".equals(rAction)) {
			productionLineService.save(bean);
		}else if ("Delete".equals(rAction)) {
			productionLineService.delete(bean);		
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../productionLine/productionLine_list.htm");
		mav.addObject("status","S");
		
		return mav;
	}
	
	
	@RequestMapping("/productionLine/search.json")
	public DataTableAjax<ProductionLineBean> search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataTableAjax<ProductionLineBean> dataTableAjax = productionLineService.getAll();
		return dataTableAjax;
	}
}
