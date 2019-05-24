package th.co.baiwa.preferences.entity;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class ParameterGroup extends BaseDomain {

	private Long paramGroupId;
	private String paramGroupCode;
	private String paramGroupDesc;

	public Long getParamGroupId() {
		return paramGroupId;
	}

	public void setParamGroupId(Long paramGroupId) {
		this.paramGroupId = paramGroupId;
	}

	public String getParamGroupCode() {
		return paramGroupCode;
	}

	public void setParamGroupCode(String paramGroupCode) {
		this.paramGroupCode = paramGroupCode;
	}

	public String getParamGroupDesc() {
		return paramGroupDesc;
	}

	public void setParamGroupDesc(String paramGroupDesc) {
		this.paramGroupDesc = paramGroupDesc;
	}

}
