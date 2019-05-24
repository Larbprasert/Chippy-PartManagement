package th.co.portal.controller.dashboard;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import th.co.portal.service.envi.UtilityEnergyInvService;

@Controller
@RequestMapping("/dashboard/")
public class CommonDashboardCtrl {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UtilityEnergyInvService service ;
	
	
	@RequestMapping("getDahboardData")
	public ModelAndView utility_energy_search(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("utility_energy_search");
		
		
		return mav;
	}
	 

}
