package th.co.baiwa.core.exception;

public class BusinessException extends Exception {
	private static final long serialVersionUID = -1643857771168231134L;
	private String code;
	private String errorDescription;
	
	
	
	public BusinessException(String code, String errorDescription) {
		super(errorDescription);
		this.code = code;
		this.errorDescription = errorDescription;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getErrorDescription() {
		return errorDescription;
	}
	public void setErrorDescription(String errorDescription) {
		this.errorDescription = errorDescription;
	}

	

}
