package th.co.portal.controller.envi;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.constant.CommonConstants;
import th.co.portal.constant.EnviConstants;
import th.co.tpcc.model.SysParam;

@Controller
@RequestMapping("/envi/")
public class CommonEnviCtrl {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//	private Gson gson = new Gson();

//	@Autowired
//	private UserService userService;
	
	// utility
	@RequestMapping("utility_energy_search.htm")
	@PreAuthorize("hasRole('ENVI_ADMIN')")
	public ModelAndView utility_energy_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		 boolean b = httpRequest.isUserInRole("ROLE_ENVI_ADMIN");
		 System.out.println("ROLE_ENVI_ADMIN=" + b);

		mav.setViewName("utility_energy_search");
		return mav;
	}
	 
	
	@RequestMapping("utility_energy_report.htm")
	public ModelAndView utility_energy_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("utility_energy_report");
		return mav;
	}
	
	@RequestMapping("utility_energy_ems_report.htm")
	public ModelAndView utility_energy_ems_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("utility_energy_ems_report");
		return mav;
	}
	@RequestMapping("utility_energy_con_report.htm")
	public ModelAndView utility_energy_con_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("utility_energy_con_report");
		return mav;
	}
	
	//emission ambient air
	@RequestMapping("emission_ambient_air_report.htm")
	public ModelAndView emission_ambient_air_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		

		SysParam param_tsp = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_TSP");
		SysParam param_sox = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_SOX");
		SysParam param_nox = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_NOX");
		SysParam param_co = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_CO");
		SysParam param_formal = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_FORMAL");


		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		
		mav.addObject("AMB_AIR_TSP", param_tsp.getValue_1());
		mav.addObject("AMB_AIR_SOX", param_sox.getValue_1());
		mav.addObject("AMB_AIR_NOX", param_nox.getValue_1());
		mav.addObject("AMB_AIR_CO", param_co.getValue_1());
		mav.addObject("AMB_AIR_FORMAL", param_formal.getValue_1());

		mav.setViewName("emission_ambient_air_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_ambient_air_search.htm")
	public ModelAndView emission_ambient_air_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_ambient_air_search");
		return mav;
	}
	
	//emission ambient air24
	@RequestMapping("emission_ambient_air24_report.htm")
	public ModelAndView emission_ambient_air24_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		SysParam param_ben = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_BENZEN");
		SysParam param_met = ApplicationCache.getParamGroupValue("EMISSION_STD","AMB_AIR_METCHL");
		
		
		mav.addObject("AMB_AIR_BENZEN", param_ben.getValue_1());
		mav.addObject("AMB_AIR_METCHL", param_met.getValue_1());
		mav.setViewName("emission_ambient_air24_report");
		return mav;
	}

	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_ambient_air24_search.htm")
	public ModelAndView emission_ambient_air24_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_ambient_air24_search");
		return mav;
	}
	
	//emission stack
	@RequestMapping("emission_stack_report.htm")
	public ModelAndView emission_stack_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("EMISSION_STACK",ApplicationCache.getParamGroupType("EMISSION_STACK_PARAM"));
		mav.addObject("STACK_NO",ApplicationCache.getParamGroupType("EMISSION_STACK_NO."));
		mav.addObject("EMISSION_STD",ApplicationCache.getParamGroupType("EMISSION_STD"));
		
		mav.addObject("EMISSION_STD_JSON",ApplicationCache.getParamGroupTypeToJSON("EMISSION_STD"));
		
		mav.setViewName("emission_stack_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_stack_search.htm")
	public ModelAndView emission_stack_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_stack_search");
		return mav;
	}
	
	//emission_wp_air
	@RequestMapping("emission_wp_air_report.htm")
	public ModelAndView emission_wp_air_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wp_air_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_wp_air_search.htm")
	public ModelAndView emission_wp_air_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wp_air_search");
		return mav;
	}
	
	//emission_wp_noise
	@RequestMapping("emission_wp_noise_report.htm")
	public ModelAndView emission_wp_noise_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wp_noise_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_wp_noise_search.htm")
	public ModelAndView emission_wp_noise_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wp_noise_search");
		return mav;
	}
	
	//emission_wwt
	@RequestMapping("emission_wwt_report.htm")
	public ModelAndView emission_wwt_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wwt_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("emission_wwt_search.htm")
	public ModelAndView emission_wwt_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emission_wwt_search");
		return mav;
	}
	
	//prtr
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("prtr_chemical_manage.htm")
	public ModelAndView prtr_chemical_manage(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("prtr_chemical_manage");
		return mav;
	}
	@RequestMapping("prtr_target_report.htm")
	public ModelAndView prtr_target_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("prtr_target_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("prtr_target_search.htm")
	public ModelAndView prtr_target_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("prtr_target_search");
		return mav;
	}
	
	//waste
	@RequestMapping("waste_report.htm")
	public ModelAndView waste_report(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("waste_report");
		return mav;
	}
	
	@PreAuthorize("hasRole('"+CommonConstants.ROLES.ROLE_ENVI_ADMIN+"')")
	@RequestMapping("waste_search.htm")
	public ModelAndView waste_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("waste_search");
		return mav;
	}

}
