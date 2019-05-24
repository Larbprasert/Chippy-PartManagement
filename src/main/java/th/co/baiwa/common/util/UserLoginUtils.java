package th.co.baiwa.common.util;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;

import th.co.baiwa.common.bean.UserBean;
import th.co.baiwa.security.model.UserDetails;

public class UserLoginUtils {

	public static UserBean getCurrentUser() {
		UserBean userBean = null;
		
		if (SecurityContextHolder.getContext().getAuthentication() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserBean) {
				userBean = (UserBean) principal;
			} else {
				// "anonymous" user
				String username = principal.toString();
				userBean = new UserDetails(username, "", AuthorityUtils.NO_AUTHORITIES);
			}
		}
		
		return userBean;
	}

	public static String logging(String msg) {
		UserBean userBean = UserLoginUtils.getCurrentUser();
		
		String userId = userBean != null ? userBean.getUserId().toString() : "NO LOGON";
		msg = userId + " : " + msg;
		
		return msg;
	}
	
}
