package th.co.baiwa.common.bean;

import com.google.gson.annotations.Expose;

public class UserBeanTest {
	
	private Long userId;
	@Expose
	private String username;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}
