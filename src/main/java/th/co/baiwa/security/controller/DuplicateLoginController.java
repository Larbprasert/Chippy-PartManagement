package th.co.baiwa.security.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.security.constant.SecurityConstants;
import th.co.baiwa.security.service.SessionManagementService;

@Controller
public class DuplicateLoginController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SessionManagementService sessionManagementService;
	
	@RequestMapping(value = SecurityConstants.CONFIRM_LOGIN_URL, method = RequestMethod.POST)
	public ModelAndView confirmLogin(HttpServletRequest request) {
		logger.info("confirmLogin");
		
		String sessionId = request.getSession(false).getId();
		SessionInformation info = sessionManagementService.getSessionInformation(sessionId);
		UserDetails userDetails = (UserDetails) info.getPrincipal();
		List<SessionInformation> duplicateSessionList = sessionManagementService.getDuplicateLoginSessionList(userDetails.getUsername(), sessionId);
		
		for (SessionInformation sessionInfo : duplicateSessionList) {
			sessionManagementService.logoutSession(sessionInfo.getSessionId());
		}
		
		return new ModelAndView(new RedirectView(request.getContextPath() + SecurityConstants.LOGIN_SUCCESS_URL));
	}
	
}
