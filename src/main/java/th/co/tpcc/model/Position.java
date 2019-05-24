
package th.co.tpcc.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class Position extends BaseDomain {

	private Integer positionId;
	private String positionCode;
	private String positionType;
	private String positionNameTh;
	private String positionNameEn;

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionType() {
		return positionType;
	}

	public void setPositionType(String positionType) {
		this.positionType = positionType;
	}

	public String getPositionNameTh() {
		return positionNameTh;
	}

	public void setPositionNameTh(String positionNameTh) {
		this.positionNameTh = positionNameTh;
	}

	public String getPositionNameEn() {
		return positionNameEn;
	}

	public void setPositionNameEn(String positionNameEn) {
		this.positionNameEn = positionNameEn;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

}
