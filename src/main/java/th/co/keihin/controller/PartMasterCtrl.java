package th.co.keihin.controller;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.keihin.model.FileUploadBean;
import th.co.keihin.model.MachineBean;
import th.co.keihin.model.PartMasterBean;
import th.co.keihin.model.ProductionLineBean;
import th.co.keihin.service.LocationService;
import th.co.keihin.service.MachineService;
import th.co.keihin.service.MakerService;
import th.co.keihin.service.MoldTypeService;
import th.co.keihin.service.PartMasterService;
import th.co.keihin.service.ProductionLineService;
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

	@Autowired
	private ProductionLineService productionLineService;

//	

	@RequestMapping("/partMaster/partMaster_list.htm")
	public ModelAndView partMaster_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("partMaster_list");
		return mav;
	}

	@RequestMapping("/partMaster/partMaster_view.htm")
	public ModelAndView partMaster_view(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("partMasterBean", partMasterService.getPartMasterBeanByID(bean.getPart_ID()));

		mav.setViewName("partMaster_view");
		return mav;
	}

	@RequestMapping("/partMaster/partMaster_create.htm")
	public ModelAndView partMaster_create(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("partMasterBean", partMasterService.getPartMasterBeanByID(bean.getPart_ID()));

		mav.addObject("LOV_UNITTYPE", unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION", locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER", makerService.loadActiveMaker());
		mav.addObject("LOV_MOLDTYPE", moldTypeService.loadActiveMoldType());

		mav.addObject("LOV_ACTIVE_FLG", ApplicationCache.getLovActiveFlag());

		mav.addObject("LOV_RANKING", ApplicationCache.getLovRanking());

		mav.setViewName("partMaster_create");
		return mav;
	}

	@RequestMapping("/partMaster/partMaster_edit.htm")
	public ModelAndView partMaster_edit(HttpServletRequest httpRequest, PartMasterBean bean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("partMasterBean", partMasterService.getPartMasterBeanByID(bean.getPart_ID()));

		mav.addObject("LOV_UNITTYPE", unitTypeService.loadActiveUnitType());
		mav.addObject("LOV_LOCATION", locationService.loadActiveLocation());
		mav.addObject("LOV_MAKER", makerService.loadActiveMaker());
		mav.addObject("LOV_MOLDTYPE", moldTypeService.loadActiveMoldType());

		mav.addObject("LOV_ACTIVE_FLG", ApplicationCache.getLovActiveFlag());

		mav.addObject("LOV_MOVEMENT", ApplicationCache.getLovMovement());

		mav.addObject("LOV_RANKING", ApplicationCache.getLovRanking());

		mav.setViewName("partMaster_edit");
		return mav;
	}

	@RequestMapping("/partMaster/partMaster_save.htm")
	public ModelAndView partMaster_save(HttpServletRequest httpRequest, PartMasterBean bean, String rAction) {

		if ("Edit".equals(rAction)) {
			partMasterService.edit(bean);
		} else if ("Create".equals(rAction)) {
			partMasterService.save(bean);
		} else if ("Delete".equals(rAction)) {
			partMasterService.delete(bean);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../partMaster/partMaster_list.htm");
		mav.addObject("status", "S");

		return mav;
	}

	@RequestMapping("/partMaster/search.json")
	public DataTableAjax<PartMasterBean> search(HttpServletRequest request, HttpServletResponse response,
			PartMasterBean bean) throws ServletException, IOException {
		DataTableAjax<PartMasterBean> dataTableAjax = partMasterService.getAll(bean);
		return dataTableAjax;
	}

	@RequestMapping("/partMaster/sparepart_report.htm")
	public ModelAndView spartpart_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("LOV_PRODUCTIONLINE", productionLineService.loadActiveProductionLine());

		mav.addObject("LOV_MACHINE", machineService.loadActiveMachine());		

		mav.setViewName("sparepart_report");
		return mav;
	}

	@RequestMapping(value = "/partMaster/getMachineByProductionLine.json",headers = "Accept=application/json")
	public List<LovInfo> getMachineProductionLine(HttpServletRequest httpRequest,MachineBean bean) {

		return machineService.loadActiveMachineByProductionLine(bean.getProductionLine().getProductionLine_ID());
	}

	@RequestMapping("/partMaster/report")
	public void getExcel(HttpServletResponse response, ProductionLineBean bean) throws ServletException, IOException {

		ByteArrayInputStream in = partMasterService.partToExcel(bean);

		try {
			response.setContentType("application/vnd.ms-excel");
//			response.setHeader("Content-disposition", "attachment; filename=SparePartReport"+bean.getMachine_name()+".xlsx");
			response.setHeader("Content-disposition", "attachment; filename=SparePartReport.xlsx");
			FileCopyUtils.copy(in, response.getOutputStream());
//	                response.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
