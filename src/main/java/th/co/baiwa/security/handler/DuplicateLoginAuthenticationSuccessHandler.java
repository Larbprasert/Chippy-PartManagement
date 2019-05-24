package th.co.baiwa.security.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import th.co.baiwa.common.util.UserLoginUtils;
import th.co.baiwa.security.constant.SecurityConstants;
import th.co.baiwa.security.exception.DuplicateLoginException;
import th.co.baiwa.security.service.SessionManagementService;

public class DuplicateLoginAuthenticationSuccessHandler extends CustomAuthenticationSuccessHandler {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private String warningTargetUrl;
	
	@Autowired
	private SessionManagementService sessionManagementService;
	
	public DuplicateLoginAuthenticationSuccessHandler(String defaultTargetUrl, String warningTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
		setWarningTargetUrl(warningTargetUrl);
	}
	
	/**
	 * Builds the target URL according to the logic defined in the main class
	 */
	@Override
	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String currentUsername = UserLoginUtils.getCurrentUser().getUsername();
		String currentSessionId = session.getId();
		logger.debug("Current Username:{}, SessionId:{}", currentUsername, currentSessionId);
		List<SessionInformation> duplicateSessionList = sessionManagementService.getDuplicateLoginSessionList(currentUsername, currentSessionId);
		
		String url = null;
		if (!CollectionUtils.isEmpty(duplicateSessionList)) {
			url = warningTargetUrl;
			session.setAttribute(SecurityConstants.WARNING_EXCEPTION, new DuplicateLoginException("Duplicate Login with Username:" + currentUsername));
		} else {
			url = getDefaultTargetUrl();
		}
		
		return url;
	}
	
	public void setWarningTargetUrl(String warningTargetUrl) {
		if (warningTargetUrl != null) {
			Assert.hasText(warningTargetUrl, "warningTargetUrl cannot be empty");
		}
		this.warningTargetUrl = warningTargetUrl;
	}
	
}
