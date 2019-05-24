package th.co.baiwa.core.exception;

public class EditTableFieldValidateException extends Exception {

	private static final long serialVersionUID = -248584035350058102L;
	private String fieldName;
	private String code;
	private String fileErrorDescription;

	public EditTableFieldValidateException(String fieldName, String fileErrorDescription) {
		super(fileErrorDescription);
		this.fieldName = fieldName;
		this.fileErrorDescription = fileErrorDescription;
	}

	public EditTableFieldValidateException(String fieldName, String code, String fileErrorDescription) {
		super(fileErrorDescription);
		this.fieldName = fieldName;
		this.code = code;
		this.fileErrorDescription = fileErrorDescription;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFileErrorDescription() {
		return fileErrorDescription;
	}

	public void setFileErrorDescription(String fileErrorDescription) {
		this.fileErrorDescription = fileErrorDescription;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
