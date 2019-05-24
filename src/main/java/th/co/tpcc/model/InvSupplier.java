
package th.co.tpcc.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class InvSupplier extends BaseDomain{

	private Integer supId;
	private String supCode;
	private String supNameTh;
	private String supNameEn;

	public Integer getSupId() {
		return supId;
	}

	public void setSupId(Integer supId) {
		this.supId = supId;
	}

	public String getSupCode() {
		return supCode;
	}

	public void setSupCode(String supCode) {
		this.supCode = supCode;
	}

	public String getSupNameTh() {
		return supNameTh;
	}

	public void setSupNameTh(String supNameTh) {
		this.supNameTh = supNameTh;
	}

	public String getSupNameEn() {
		return supNameEn;
	}

	public void setSupNameEn(String supNameEn) {
		this.supNameEn = supNameEn;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

}
