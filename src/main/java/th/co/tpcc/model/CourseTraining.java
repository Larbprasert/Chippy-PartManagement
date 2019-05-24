
package th.co.tpcc.model;

import java.math.BigDecimal;
import java.sql.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CourseTraining extends Course {

	private Integer courseTrainId;
	private Integer courseGenNo;
	private String courseDateStr;
	private String courseDateEndStr;
	private String courseTypeDesc;
	private Date courseDate;
	private Date courseDateEnd;
	private String coursePlace;
	private String courseOwner;
	private BigDecimal coursePrice;
	private String isComplete;
	
	private Integer ownerId; //(** for search)
	private String companyCode;
	private String deptCode;

	public Date getCourseDate() {
		return courseDate;
	}

	public void setCourseDate(Date date) {
		this.courseDate = date;
	}

	public String getCoursePlace() {
		return coursePlace;
	}

	public void setCoursePlace(String coursePlace) {
		this.coursePlace = coursePlace;
	}

	public BigDecimal getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(BigDecimal coursePrice) {
		this.coursePrice = coursePrice;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getCourseOwner() {
		return courseOwner;
	}

	public void setCourseOwner(String courseOwner) {
		this.courseOwner = courseOwner;
	}

	public String getCourseDateStr() {
		return courseDateStr;
	}

	public void setCourseDateStr(String courseDateStr) {
		this.courseDateStr = courseDateStr;
	}

	public Integer getCourseTrainId() {
		return courseTrainId;
	}

	public void setCourseTrainId(Integer courseTrainId) {
		this.courseTrainId = courseTrainId;
	}

	public Integer getCourseGenNo() {
		return courseGenNo;
	}

	public void setCourseGenNo(Integer courseGenNo) {
		this.courseGenNo = courseGenNo;
	}

	public Integer getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

	public String getIsComplete() {
		return isComplete;
	}

	public void setIsComplete(String isComplete) {
		this.isComplete = isComplete;
	}

	public String getCourseTypeDesc() {
		return courseTypeDesc;
	}

	public void setCourseTypeDesc(String courseTypeDesc) {
		this.courseTypeDesc = courseTypeDesc;
	}

	public Date getCourseDateEnd() {
		return courseDateEnd;
	}

	public void setCourseDateEnd(Date courseDateEnd) {
		this.courseDateEnd = courseDateEnd;
	}

	public String getCourseDateEndStr() {
		return courseDateEndStr;
	}

	public void setCourseDateEndStr(String courseDateEndStr) {
		this.courseDateEndStr = courseDateEndStr;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

}
