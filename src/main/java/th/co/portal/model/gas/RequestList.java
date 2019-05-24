package th.co.portal.model.gas;

public class RequestList extends Equipment {

	private Integer reqId;
	private Integer eqId;
	private String jobNo;
	private String requestStatusCode;
	private String requestStatusDesc;
	private String purposeCode;
	private String purposeDesc;

	public Integer getReqId() {
		return reqId;
	}

	public void setReqId(Integer reqId) {
		this.reqId = reqId;
	}

	public Integer getEqId() {
		return eqId;
	}

	public void setEqId(Integer eqId) {
		this.eqId = eqId;
	}

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public String getRequestStatusCode() {
		return requestStatusCode;
	}

	public void setRequestStatusCode(String requestStatusCode) {
		this.requestStatusCode = requestStatusCode;
	}

	public String getRequestStatusDesc() {
		return requestStatusDesc;
	}

	public void setRequestStatusDesc(String requestStatusDesc) {
		this.requestStatusDesc = requestStatusDesc;
	}

	public String getPurposeDesc() {
		return purposeDesc;
	}

	public void setPurposeDesc(String purposeDesc) {
		this.purposeDesc = purposeDesc;
	}

	public String getPurposeCode() {
		return purposeCode;
	}

	public void setPurposeCode(String purposeCode) {
		this.purposeCode = purposeCode;
	}

}
