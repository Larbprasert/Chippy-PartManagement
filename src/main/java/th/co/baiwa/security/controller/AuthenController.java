package th.co.baiwa.security.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.security.constant.SecurityConstants;
import th.co.baiwa.security.exception.DuplicateLoginException;

@Controller
public class AuthenController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = SecurityConstants.LOGIN_URL, method = RequestMethod.GET)
	public ModelAndView login(
		@RequestParam(value = "warning", required = false) String warning,
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout,
		HttpServletRequest request,HttpServletResponse response) {
		
		logger.info("login");
		
		ModelAndView mav = new ModelAndView();
		if (warning != null) {
			mav.addObject("warning", getWarningMessage(request, SecurityConstants.WARNING_EXCEPTION));
		}
		if (error != null) {
			mav.addObject("error", getErrorMessage(request, WebAttributes.AUTHENTICATION_EXCEPTION));
		}
		if (logout != null) {
			mav.addObject("msg", "You've been logged out successfully.");
		}
		
		mav.setViewName("login");
		
		response.addHeader("REQUIRES_AUTH","1");
		
		return mav;
	}
	
	// Customize the warning message
	private String getWarningMessage(HttpServletRequest request, String key) {
		
		HttpSession session = request.getSession();
		Exception exception = (Exception) session.getAttribute(key);
		
		String warning = "";
		if (exception != null) {
			if (exception instanceof DuplicateLoginException) {
				warning = "Duplicate Login, Want to continue?";
			} else {
				warning = "Warning!!";
			}
		}
		
		session.removeAttribute(SecurityConstants.WARNING_EXCEPTION);
		
		return warning;
	}
	
	// Customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {
		
		Exception exception = (Exception) request.getSession().getAttribute(key);
		
		String error = "";
		if (exception != null) {
			if (exception instanceof BadCredentialsException) {
				error = "Invalid username and password!";
			} else if (exception instanceof LockedException) {
				error = exception.getMessage();
			} else {
				error = "Invalid username and password!";
			}
		}
		
		return error;
	}

	// For 403 access denied page
	@RequestMapping(value = "/403.htm", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		
		ModelAndView mav = new ModelAndView();
		
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			mav.addObject("username", userDetail.getUsername());
		}
		
		mav.setViewName("403");
		
		return mav;
	}

}
