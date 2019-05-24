package th.co.baiwa.security.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

public class CustomLogoutHandler extends SecurityContextLogoutHandler {
	
//	@Autowired
//	private AuditLogService auditLogService;
	
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// TODO Insert AduitLog here.
		
//		AuditLogInfo auditLogInfo = new AuditLogInfo();
//		auditLogInfo.setActionName(USER_ACTION.LOGOFF);
//		SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss",new Locale("th", "TH"));
//		auditLogInfo.setActionDetails("User ID " + UserLoginUtils.getCurrentUser().getUsername() + " Login on " + sd.format(new Date()));
//		auditLogService.insertLog(auditLogInfo);
//		
		super.logout(request, response, authentication);

	}
	
}
