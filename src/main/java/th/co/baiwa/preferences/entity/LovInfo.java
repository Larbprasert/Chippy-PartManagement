package th.co.baiwa.preferences.entity;

public class LovInfo {
	private String type;
	private String code;
	private String descTH;
	private String descEN;
	
	public LovInfo() {
	}
	
	public LovInfo(String type, String code, String descTH, String descEN) {
		super();
		this.type = type;
		this.code = code;
		this.descTH = descTH;
		this.descEN = descEN;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescTH() {
		return descTH;
	}

	public void setDescTH(String descTH) {
		this.descTH = descTH;
	}

	public String getDescEN() {
		return descEN;
	}

	public void setDescEN(String descEN) {
		this.descEN = descEN;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
