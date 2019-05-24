
package th.co.portal.model.gas;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class RequestedHistory extends BaseDomain {

	private Integer id;
	private Integer eqId;
	private String eqCode;
	private String jobNo;
	private String jobType;
	private String jobStatus;
	private String dateFrom;
	private String dateTo;
	private String remark;
	

	public RequestedHistory(Requested requested) {
		setEqId(requested.getEquipmentId());
		setEqCode( requested.getEqCode());
		setJobNo(requested.getJobNo());
		setJobStatus(requested.getRequestStatus());
		setRemark(requested.getRemark());
	}

	public RequestedHistory() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEqId() {
		return eqId;
	}

	public void setEqId(Integer eqId) {
		this.eqId = eqId;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getEqCode() {
		return eqCode;
	}

	public void setEqCode(String eqCode) {
		this.eqCode = eqCode;
	}
	

	public String getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}

	public String getDateTo() {
		return dateTo;
	}

	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

}
