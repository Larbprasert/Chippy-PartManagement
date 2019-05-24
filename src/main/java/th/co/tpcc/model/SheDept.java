
package th.co.tpcc.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class SheDept extends BaseDomain{

	private Integer deptId;
	private String deptCode;
	private String deptNameTh;
	private String deptNameEn;

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptNameTh() {
		return deptNameTh;
	}

	public void setDeptNameTh(String deptNameTh) {
		this.deptNameTh = deptNameTh;
	}

	public String getDeptNameEn() {
		return deptNameEn;
	}

	public void setDeptNameEn(String deptNameEn) {
		this.deptNameEn = deptNameEn;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

}
