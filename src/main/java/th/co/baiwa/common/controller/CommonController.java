package th.co.baiwa.common.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.UserBean;
import th.co.baiwa.common.util.UserLoginUtils;

@RestController
public class CommonController {
	
	@Autowired
	private ApplicationCache applicationCache;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private Gson gson = new Gson();
	
//	@RequestMapping(value = "/anonymous.htm")
//	public ModelAndView anonymous() {
//		logger.info(" # anonymous 0 ");
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("anonymous");
//		
//		logger.info(" # anonymous success ");
//		
//		return mav;
//	}
	
	@RequestMapping(value = "/she/home.htm", method = RequestMethod.GET)
	public ModelAndView welcome(Locale locale, HttpServletRequest httpRequest, String home) {
		ModelAndView mav = new ModelAndView();
		
		boolean isNotLogin =  SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken ;
		
		logger.info(" # /she/home.htm ,isNotLogin=" + isNotLogin);
		logger.info("Welcome home! The client locale is {}.", locale);
		
        mav.addObject("isSessionTimout", isNotLogin);
        String view = "home";
        
        UserBean user = UserLoginUtils.getCurrentUser();
        if(null!=user){
        	if(user.getAuthorities().stream().anyMatch( ro -> ro.getAuthority().contains("ENVI"))){
        		view = "dashboard_envi";
        	}else if(user.getAuthorities().stream().anyMatch( ro -> ro.getAuthority().contains("GAS"))){
        		view = "dashboard_gas";
        	}
        	
	        //Add Message
//	        Map<String, String> msgs = ApplicationCache.getAllMessageEN();
//	        String json = gson.toJson(msgs);
//	        mav.addObject("jsonmsg", json);
//	        mav.addObject("displayUsername", user.getUsername());
//      
//	        ConcurrentHashMap<String, List<LovInfo>> lov = ApplicationCache.getLov();
//	        json = gson.toJson(lov);
//	        mav.addObject("lovmaster", json);
        }
        
        
        mav.setViewName(view);
		return mav;
	}
	
	
//	private boolean doFoosHaveGoodQuality(Collection<Foo> foos) {
//	    return foos.stream().anyMatch(foo -> ... some test ... );
//	}
	
	@RequestMapping("/error404.htm")
	public ModelAndView erorr404() {
		// logger.info(" ### in error404");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error404");
		return mav;		
	}
	
	@RequestMapping("/error403.htm")
	public ModelAndView erorr403() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error403");
		return mav;		
	}
	
	@RequestMapping("/error500.htm")
	public ModelAndView erorr500() {
		logger.info(" ### in error500");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error500");
		return mav;
	}
	
	@RequestMapping("/reloadCache")
	public @ResponseBody String reloadCache() {
		logger.info(" ### reloadCache ###");
		applicationCache.reloadCache();
		return "SUCCESS";
	}

}
