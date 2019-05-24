package th.co.baiwa.security.exception;

import org.springframework.security.core.AuthenticationException;

@SuppressWarnings("serial")
public class DuplicateLoginException extends AuthenticationException {
	
	public DuplicateLoginException(String msg) {
		super(msg);
	}
	
	public DuplicateLoginException(String msg, Throwable t) {
		super(msg, t);
	}
	
}
