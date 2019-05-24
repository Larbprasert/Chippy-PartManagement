
package th.co.tpcc.model;

import java.math.BigDecimal;
import java.sql.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;
import th.co.baiwa.common.util.DateUtils;

public class Course extends BaseDomain {

	private Integer courseId;
	private String courseCode;
	private String courseType;
	private String courseNameTh;
	private String courseNameEn;
	private String active;

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getCourseNameTh() {
		return courseNameTh;
	}

	public void setCourseNameTh(String courseNameTh) {
		this.courseNameTh = courseNameTh;
	}

	public String getCourseNameEn() {
		return courseNameEn;
	}

	public void setCourseNameEn(String courseNameEn) {
		this.courseNameEn = courseNameEn;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

}
