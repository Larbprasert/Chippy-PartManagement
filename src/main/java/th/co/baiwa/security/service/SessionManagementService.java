package th.co.baiwa.security.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service("sessionManagementService")
public class SessionManagementService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SessionRegistry sessionRegistry;
	
	public SessionInformation getSessionInformation(String sessionId) {
		return sessionRegistry.getSessionInformation(sessionId);
	}
	
	public List<SessionInformation> getActiveSessionList() {
		List<SessionInformation> activeSessions = new ArrayList<SessionInformation>();
		for(Object principal : sessionRegistry.getAllPrincipals()) {
			activeSessions.addAll(sessionRegistry.getAllSessions(principal, false));
		}
		return activeSessions;
	}
	
	public List<SessionInformation> getDuplicateLoginSessionList(String username, String sessionId) {
		List<SessionInformation> activeSessionList = getActiveSessionList();
		UserDetails userDetails = null;
		
		List<SessionInformation> duplicateSessionList = new ArrayList<SessionInformation>();
		for (SessionInformation sessionInfo : activeSessionList) {
			userDetails = (UserDetails) sessionInfo.getPrincipal();
			logger.debug("Active Session Checking Username:{}, SessionId:{}", userDetails.getUsername(), sessionInfo.getSessionId());
			if (username.equals(userDetails.getUsername()) && !sessionId.equals(sessionInfo.getSessionId())) {
				logger.warn("Duplicate Login with Username:{}, SessionId:{}", userDetails.getUsername(), sessionInfo.getSessionId());
				duplicateSessionList.add(sessionInfo);
			}
		}
		
		return duplicateSessionList;
	}
	
	public void logoutSession(String sessionId) {
		SessionInformation session = sessionRegistry.getSessionInformation(sessionId);
		if (session != null) {
			UserDetails userDetails = (UserDetails) session.getPrincipal();
			logger.info("Logout User:{}, SessionId:{}", userDetails.getUsername(), session.getSessionId());
			session.expireNow();
		}
	}
	
}
