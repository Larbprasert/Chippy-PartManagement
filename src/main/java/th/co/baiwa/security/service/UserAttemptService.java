package th.co.baiwa.security.service;

public interface UserAttemptService {
	
	public void resetFailAttempt(String username);
	
	public void updateFailAttempt(String username);
	
}
