package th.co.portal.model.gas;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class Requested extends BaseDomain {

	private Integer id; /* ID Primary */
	private Integer equipmentId; /* รหัส Equipment */
	private String jobNo; /* รหัส JobNo */
	private Integer approveId; /* รหัส Approve Id */
	private Integer receiveId; /* รหัส Receive Id */
	private String requestStatus; /* สถานะ Request */
	private String companyCode; /* รหัส บริษัท */
	private String departmentCode; /* รหัส แผนก/ผ่าย */
	private String requesterId; /* รหัส ผู้ร้องขอ */
	private String agentName; /* ชื่อตัวแทน */
	private String phone; /* เบอร์โทรศัพท์ */
	private String objectiveCode; /* รหัส วัตถุประสงค์ */
	private String eqCode; /* หมายเลขอุปกณ์ */
	private String serialNo; /* ซีรีนันเบอร์ */
	private String eqType; /* รหัส Equipment Type ('Gas','FFE') */

	private String objectiveName; /* วัตถุประสงค์ */
	private String requesterName; /* ชื่อผู้ร้องขอ */
	private String departmentName; /* ชื่อ แผนก/ผ่าย */
	private String companyName; /* ชื่อ บริษัท เช่น('tpcc','tpac') */

	// private String jobStatus; /*--- request Status */
	
	
	private String approveType;  
	private String remark; /*--- Remark */

	private Equipment equipment;

	private String approve_by;
	private String approve_date;
	private String acknow_by;
	private String acknow_date;
	private String she_receive_by;
	private String she_receive_date;
	private String she_send_no;
	private String she_send_vendor;
	private String she_send_name;
	private String she_send_date;
	private String vendor_sign_by;
	private String vendor_sign_date;
	private String she_sign_by;
	private String she_sign_date;
	private String complete_req_by;
	private String complete_req_date;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(Integer equipmentId) {
		this.equipmentId = equipmentId;
	}

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public Integer getApproveId() {
		return approveId;
	}

	public void setApproveId(Integer approveId) {
		this.approveId = approveId;
	}

	public Integer getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Integer receiveId) {
		this.receiveId = receiveId;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	// public String getRequesterCode() {
	// return requesterCode;
	// }
	//
	// public void setRequesterCode(String requesterCode) {
	// this.requesterCode = requesterCode;
	// }

	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getObjectiveCode() {
		return objectiveCode;
	}

	public void setObjectiveCode(String objectiveCode) {
		this.objectiveCode = objectiveCode;
	}

	public String getEqCode() {
		return eqCode;
	}

	public void setEqCode(String eqCode) {
		this.eqCode = eqCode;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getEqType() {
		return eqType;
	}

	public void setEqType(String eqType) {
		this.eqType = eqType;
	}

	public String getObjectiveName() {
		return objectiveName;
	}

	public void setObjectiveName(String objectiveName) {
		this.objectiveName = objectiveName;
	}

	public String getRequesterName() {
		return requesterName;
	}

	public void setRequesterName(String requesterName) {
		this.requesterName = requesterName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
 
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRequesterId() {
		return requesterId;
	}

	public void setRequesterId(String requesterId) {
		this.requesterId = requesterId;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}

	public String getApprove_by() {
		return approve_by;
	}

	public void setApprove_by(String approve_by) {
		this.approve_by = approve_by;
	}

	public String getApprove_date() {
		return approve_date;
	}

	public void setApprove_date(String approve_date) {
		this.approve_date = approve_date;
	}

	public String getAcknow_by() {
		return acknow_by;
	}

	public void setAcknow_by(String acknow_by) {
		this.acknow_by = acknow_by;
	}

	public String getAcknow_date() {
		return acknow_date;
	}

	public void setAcknow_date(String acknow_date) {
		this.acknow_date = acknow_date;
	}

	public String getShe_receive_by() {
		return she_receive_by;
	}

	public void setShe_receive_by(String she_receive_by) {
		this.she_receive_by = she_receive_by;
	}

	public String getShe_receive_date() {
		return she_receive_date;
	}

	public void setShe_receive_date(String she_receive_date) {
		this.she_receive_date = she_receive_date;
	}

	public String getShe_send_no() {
		return she_send_no;
	}

	public void setShe_send_no(String she_send_no) {
		this.she_send_no = she_send_no;
	}

	public String getShe_send_vendor() {
		return she_send_vendor;
	}

	public void setShe_send_vendor(String she_send_vendor) {
		this.she_send_vendor = she_send_vendor;
	}

	public String getShe_send_name() {
		return she_send_name;
	}

	public void setShe_send_name(String she_send_name) {
		this.she_send_name = she_send_name;
	}

	public String getShe_send_date() {
		return she_send_date;
	}

	public void setShe_send_date(String she_send_date) {
		this.she_send_date = she_send_date;
	}

	public String getVendor_sign_by() {
		return vendor_sign_by;
	}

	public void setVendor_sign_by(String vendor_sign_by) {
		this.vendor_sign_by = vendor_sign_by;
	}

	public String getVendor_sign_date() {
		return vendor_sign_date;
	}

	public void setVendor_sign_date(String vendor_sign_date) {
		this.vendor_sign_date = vendor_sign_date;
	}

	public String getShe_sign_by() {
		return she_sign_by;
	}

	public void setShe_sign_by(String she_sign_by) {
		this.she_sign_by = she_sign_by;
	}

	public String getShe_sign_date() {
		return she_sign_date;
	}

	public void setShe_sign_date(String she_sign_date) {
		this.she_sign_date = she_sign_date;
	}

	public String getComplete_req_by() {
		return complete_req_by;
	}

	public void setComplete_req_by(String complete_req_by) {
		this.complete_req_by = complete_req_by;
	}

	public String getComplete_req_date() {
		return complete_req_date;
	}

	public void setComplete_req_date(String complete_req_date) {
		this.complete_req_date = complete_req_date;
	}

	public String getApproveType() {
		return approveType;
	}

	public void setApproveType(String approveType) {
		this.approveType = approveType;
	}

}