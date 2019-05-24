
package th.co.tpcc.model;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class PositionCourse extends BaseDomain {

	private Integer positionId;
	private String positionCode;
	private String positionType;
	private String positionNameTh;
	private String positionNameEn;
	private String courseCode;

	private List<Course> courseList;

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

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

}
