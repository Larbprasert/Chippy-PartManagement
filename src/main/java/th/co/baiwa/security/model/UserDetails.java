package th.co.baiwa.security.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import th.co.baiwa.common.bean.UserBean;

public class UserDetails extends User implements UserBean {

	private static final long serialVersionUID = 2637807472705815470L;

	private Long userId;
	
	private th.co.baiwa.admin.entity.User userProfile;
	
	// Add More Information about USER here.

	// Constructor
	public UserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	// Constructor
	public UserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	// ==================================================
	// Getter & Setter Method
	// ==================================================
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public th.co.baiwa.admin.entity.User getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(th.co.baiwa.admin.entity.User userProfile) {
		this.userProfile = userProfile;
	}

}
