package th.co.baiwa.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
//	@Autowired
//	private AuditLogService auditLogService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		super.onAuthenticationSuccess(request, response, authentication);
		// TODO Insert AuditLog here.
//		AuditLogInfo auditLogInfo = new AuditLogInfo();
//		auditLogInfo.setActionName(USER_ACTION.LOGIN);
//		SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss",new Locale("th", "TH"));
//		auditLogInfo.setActionDetails("User ID " + UserLoginUtils.getCurrentUser().getUsername() + " Login on " + sd.format(new Date()));
//		auditLogService.insertLog(auditLogInfo);
	}
	
}
