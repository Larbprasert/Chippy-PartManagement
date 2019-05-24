package th.co.tpcc.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class SysParam extends BaseDomain {

	private int paramId;
	private String paramCode;
	private String paramType;
	private String descTh;
	private String descEn;
	private String value_1;
	private String value_2;
	private String active;
	private String sortNo;

	public int getParamId() {
		return paramId;
	}

	public void setParamId(int _paramId) {
		paramId = _paramId;
	}

	public String getParamCode() {
		return paramCode;
	}

	public void setParamCode(String _paramCode) {
		paramCode = _paramCode;
	}

	public String getParamType() {
		return paramType;
	}

	public void setParamType(String _paramType) {
		paramType = _paramType;
	}

	public String getDescTh() {
		return descTh;
	}

	public void setDescTh(String _descTh) {
		descTh = _descTh;
	}

	public String getDescEn() {
		return descEn;
	}

	public void setDescEn(String _descEn) {
		descEn = _descEn;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String _active) {
		active = _active;
	}

	public String getSortNo() {
		return sortNo;
	}

	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}

	public String getValue_1() {
		return value_1;
	}

	public void setValue_1(String value_1) {
		this.value_1 = value_1;
	}

	public String getValue_2() {
		return value_2;
	}

	public void setValue_2(String value_2) {
		this.value_2 = value_2;
	}

}