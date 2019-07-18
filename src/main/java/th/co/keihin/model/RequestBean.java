package th.co.keihin.model;

import java.util.List;

import javax.mail.internet.InternetAddress;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class RequestBean extends BaseDomain {

	private String request_ID;
	private String doc_number;

	private RequestTypeBean requestType;
	private String requestTypeSearch;
	// private String requestType_name;

	private SectionBean section;
	private String sectionSearch;
	// private String location_ID;

	private String beforeDetail;
	private List beforePicture;

	private String user_ID;
	private String user_name;

	private MachineBean machine;
	private String fileId;

	private LocationBean location;

	private String informDate;
	private String informTime;

	private CheckToolBean checkTool;

	private String requestApproveBy;
	private String requestSectionBy;
	private String repairSectionBy;
	private String repairPersonBy;
	private String confirmRepairBy;
	private String qaApproveBy;
	private String achApproveBy;
	private String requestApproveFlg;
	private String requestSectionFlg;
	private String repairSectionFlg;
	private String repairPersonFlg;
	private String confirmRepairFlg;
	private String qaApproveFlg;
	private String achApproveFlg;

	/** For details */
	private String sectionName;
	private String requestStatus;
	private String requestBy;
	private String status_name;

	// Repair Detail
	private String checkToolBefore_ID;
	private String checkToolAfter_ID;
	private String attachFile;
	private String afterComment;
	private String afterDescription;
	private String startTime;
	private String finishTime;
	private String confirmJudment;
	private String concernQA;
	private String maintenanceType;
	
	private InternetAddress[] addressTo;
	private InternetAddress[] addressCC;
	
	

	public String getRequest_ID() {
		return request_ID;
	}

	public void setRequest_ID(String request_ID) {
		this.request_ID = request_ID;
	}

	public String getDoc_number() {
		return doc_number;
	}

	public void setDoc_number(String doc_number) {
		this.doc_number = doc_number;
	}

	public RequestTypeBean getRequestType() {
		return requestType;
	}

	public void setRequestType(RequestTypeBean requestType) {
		this.requestType = requestType;
	}

	public String getRequestTypeSearch() {
		return requestTypeSearch;
	}

	public void setRequestTypeSearch(String requestTypeSearch) {
		this.requestTypeSearch = requestTypeSearch;
	}

	public SectionBean getSection() {
		return section;
	}

	public void setSection(SectionBean section) {
		this.section = section;
	}

	public String getSectionSearch() {
		return sectionSearch;
	}

	public void setSectionSearch(String sectionSearch) {
		this.sectionSearch = sectionSearch;
	}

	public String getBeforeDetail() {
		return beforeDetail;
	}

	public void setBeforeDetail(String beforeDetail) {
		this.beforeDetail = beforeDetail;
	}

	public List getBeforePicture() {
		return beforePicture;
	}

	public void setBeforePicture(List beforePicture) {
		this.beforePicture = beforePicture;
	}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public MachineBean getMachine() {
		return machine;
	}

	public void setMachine(MachineBean machine) {
		this.machine = machine;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public LocationBean getLocation() {
		return location;
	}

	public void setLocation(LocationBean location) {
		this.location = location;
	}

	public String getInformDate() {
		return informDate;
	}

	public void setInformDate(String informDate) {
		this.informDate = informDate;
	}

	public String getInformTime() {
		return informTime;
	}

	public void setInformTime(String informTime) {
		this.informTime = informTime;
	}

	public CheckToolBean getCheckTool() {
		return checkTool;
	}

	public void setCheckTool(CheckToolBean checkTool) {
		this.checkTool = checkTool;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getRequestBy() {
		return requestBy;
	}

	public void setRequestBy(String requestBy) {
		this.requestBy = requestBy;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getCheckToolBefore_ID() {
		return checkToolBefore_ID;
	}

	public void setCheckToolBefore_ID(String checkToolBefore_ID) {
		this.checkToolBefore_ID = checkToolBefore_ID;
	}

	public String getCheckToolAfter_ID() {
		return checkToolAfter_ID;
	}

	public void setCheckToolAfter_ID(String checkToolAfter_ID) {
		this.checkToolAfter_ID = checkToolAfter_ID;
	}

	public String getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}

	public String getAfterComment() {
		return afterComment;
	}

	public void setAfterComment(String afterComment) {
		this.afterComment = afterComment;
	}

	public String getAfterDescription() {
		return afterDescription;
	}

	public void setAfterDescription(String afterDescription) {
		this.afterDescription = afterDescription;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getConfirmJudment() {
		return confirmJudment;
	}

	public void setConfirmJudment(String confirmJudment) {
		this.confirmJudment = confirmJudment;
	}

	public String getConcernQA() {
		return concernQA;
	}

	public void setConcernQA(String concernQA) {
		this.concernQA = concernQA;
	}

	public String getMaintenanceType() {
		return maintenanceType;
	}

	public void setMaintenanceType(String maintenanceType) {
		this.maintenanceType = maintenanceType;
	}

	public String getRequestApproveBy() {
		return requestApproveBy;
	}

	public void setRequestApproveBy(String requestApproveBy) {
		this.requestApproveBy = requestApproveBy;
	}

	public String getRequestSectionBy() {
		return requestSectionBy;
	}

	public void setRequestSectionBy(String requestSectionBy) {
		this.requestSectionBy = requestSectionBy;
	}

	public String getRepairSectionBy() {
		return repairSectionBy;
	}

	public void setRepairSectionBy(String repairSectionBy) {
		this.repairSectionBy = repairSectionBy;
	}

	public String getRepairPersonBy() {
		return repairPersonBy;
	}

	public void setRepairPersonBy(String repairPersonBy) {
		this.repairPersonBy = repairPersonBy;
	}

	public String getConfirmRepairBy() {
		return confirmRepairBy;
	}

	public void setConfirmRepairBy(String confirmRepairBy) {
		this.confirmRepairBy = confirmRepairBy;
	}

	public String getQaApproveBy() {
		return qaApproveBy;
	}

	public void setQaApproveBy(String qaApproveBy) {
		this.qaApproveBy = qaApproveBy;
	}

	public String getAchApproveBy() {
		return achApproveBy;
	}

	public void setAchApproveBy(String achApproveBy) {
		this.achApproveBy = achApproveBy;
	}

	public String getRequestApproveFlg() {
		return requestApproveFlg;
	}

	public void setRequestApproveFlg(String requestApproveFlg) {
		this.requestApproveFlg = requestApproveFlg;
	}

	public String getRequestSectionFlg() {
		return requestSectionFlg;
	}

	public void setRequestSectionFlg(String requestSectionFlg) {
		this.requestSectionFlg = requestSectionFlg;
	}

	public String getRepairSectionFlg() {
		return repairSectionFlg;
	}

	public void setRepairSectionFlg(String repairSectionFlg) {
		this.repairSectionFlg = repairSectionFlg;
	}

	public String getRepairPersonFlg() {
		return repairPersonFlg;
	}

	public void setRepairPersonFlg(String repairPersonFlg) {
		this.repairPersonFlg = repairPersonFlg;
	}

	public String getConfirmRepairFlg() {
		return confirmRepairFlg;
	}

	public void setConfirmRepairFlg(String confirmRepairFlg) {
		this.confirmRepairFlg = confirmRepairFlg;
	}

	public String getQaApproveFlg() {
		return qaApproveFlg;
	}

	public void setQaApproveFlg(String qaApproveFlg) {
		this.qaApproveFlg = qaApproveFlg;
	}

	public String getAchApproveFlg() {
		return achApproveFlg;
	}

	public void setAchApproveFlg(String achApproveFlg) {
		this.achApproveFlg = achApproveFlg;
	}

	public InternetAddress[] getAddressTo() {
		return addressTo;
	}

	public void setAddressTo(InternetAddress[] addressTo) {
		this.addressTo = addressTo;
	}

	public InternetAddress[] getAddressCC() {
		return addressCC;
	}

	public void setAddressCC(InternetAddress[] addressCC) {
		this.addressCC = addressCC;
	}

}
