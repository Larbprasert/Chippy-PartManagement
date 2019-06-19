package th.co.baiwa.security.constant;

public class SecurityConstants {
	
	public static final String LOGIN_URL = "/login.htm";
	public static final String LOGIN_SUCCESS_URL = "/home.htm";
	public static final String LOGIN_WARNING_URL = "/login.htm?warning";
	public static final String LOGIN_ERROR_URL = "/login.htm?error";
	public static final String LOGOUT_URL = "/logout.htm";
	public static final String LOGOUT_SUCCESS_URL= "/login.htm?logout";
	public static final String CONFIRM_LOGIN_URL = "/confirm-login.htm";
	
	/**
	 * Used to cache an warning login exception in the session.
	 */
	public static final String WARNING_EXCEPTION = "WARNING_EXCEPTION";
	
}
