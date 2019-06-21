package th.co.keihin.model;

import java.util.List;

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
	// private String machine_ID;
	// private String machine_name;

	private LocationBean location;

	private String informDate;
	private String informTime;


	private CheckToolBean checkTool;

	private String requestApprove_ID;
	private String requestApprove_name;

	private String repairApprove_ID;
	private String repairApprove_name;

	private String confirmRepair_ID;
	private String confirmRepair_name;

	private String confirmRequest_ID;
	private String confirmRequest_name;

	private String qaApprove_ID;
	private String qaApprove_name;

	private String achApprove_ID;
	private String achApprove_name;

	/** For details */
	private String sectionName;
	private String requestStatus;
	private String requestBy;
	private String status_name;

	public CheckToolBean getCheckTool() {
		return checkTool;
	}

	public void setCheckTool(CheckToolBean checkTool) {
		this.checkTool = checkTool;
	}

	public RequestTypeBean getRequestType() {
		return requestType;
	}

	public void setRequestType(RequestTypeBean requestType) {
		this.requestType = requestType;
	}

	public LocationBean getLocation() {
		return location;
	}

	public void setLocation(LocationBean location) {
		this.location = location;
	}

	public String getrequest_ID() {
		return request_ID;
	}

	public void setrequest_ID(String newrequest_ID) {
		request_ID = newrequest_ID;
	}

	public String geDoc_number() {
		return doc_number;
	}

	public void setDoc_number(String newDoc_number) {
		doc_number = newDoc_number;
	}

	// public String getrequestType_ID() {
	// return requestType_ID;
	// }
	//
	// public void setrequestType_ID(String newrequestType_ID) {
	// requestType_ID = newrequestType_ID;
	// }
	//
	// public String getrequestType_name() {
	// return requestType_name;
	// }
	//
	// public void setrequestType_name(String newrequestType_name) {
	// requestType_name = newrequestType_name;
	// }
	//
	//
	// public String getSection_ID() {
	// return section_ID;
	// }
	//
	// public void setSection_ID(String newSection_ID) {
	// section_ID = newSection_ID;
	// }
	//
	// public String getLocation_ID() {
	// return location_ID;
	// }
	//
	// public void setLocation_ID(String newLocation_ID) {
	// location_ID = newLocation_ID;
	// }

	public String getbeforeDetail() {
		return beforeDetail;
	}

	public void setbeforeDetail(String newbeforeDetail) {
		beforeDetail = newbeforeDetail;
	}

	public List getbeforePicture() {
		return beforePicture;
	}

	public void setbeforePicture(List newbeforePicture) {
		beforePicture = newbeforePicture;
	}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String newUser_ID) {
		user_ID = newUser_ID;
	}

	public String getuser_name() {
		return user_name;
	}

	public void setuser_name(String newuser_name) {
		user_name = newuser_name;
	}

	// public String getMachine_ID() {
	// return machine_ID;
	// }
	//
	// public void setMachine_ID(String newMachine_ID) {
	// machine_ID = newMachine_ID;
	// }
	//
	//
	// public String getMachine_name() {
	// return machine_name;
	// }
	//
	// public void setMachine_name(String newMachine_name) {
	// machine_name = newMachine_name;
	// }
	//
	//

	public String getstatus_name() {
		return status_name;
	}

	public void setstatus_name(String newstatus_name) {
		status_name = newstatus_name;
	}

	 
	// requestApprove
	public String getrequestApprove_ID() {
		return requestApprove_ID;
	}

	public void setrequestApprove_ID(String newrequestApprove_ID) {
		requestApprove_ID = newrequestApprove_ID;
	}

	public String getrequestApprove_name() {
		return requestApprove_name;
	}

	public void setrequestApprove_name(String newrequestApprove_name) {
		requestApprove_name = newrequestApprove_name;
	}

	// repairApprove
	public String getrepairApprove_ID() {
		return repairApprove_ID;
	}

	public void setrepairApprove_ID(String newrepairApprove_ID) {
		repairApprove_ID = newrepairApprove_ID;
	}

	public String getrepairApprove_name() {
		return repairApprove_name;
	}

	public void setrepairApprove_name(String newrepairApprove_name) {
		repairApprove_name = newrepairApprove_name;
	}

	// confirmRepair
	public String getconfirmRepair_ID() {
		return confirmRepair_ID;
	}

	public void setconfirmRepair_ID(String newconfirmRepair_ID) {
		confirmRepair_ID = newconfirmRepair_ID;
	}

	public String getconfirmRepair_name() {
		return confirmRepair_name;
	}

	public void setconfirmRepair_name(String newconfirmRepair_name) {
		confirmRepair_name = newconfirmRepair_name;
	}

	// confirmRequest
	public String getconfirmRequest_ID() {
		return confirmRequest_ID;
	}

	public void setconfirmRequest_ID(String newconfirmRequest_ID) {
		confirmRequest_ID = newconfirmRequest_ID;
	}

	public String getconfirmRequest_name() {
		return confirmRequest_name;
	}

	public void setconfirmRequest_name(String newconfirmRequest_name) {
		confirmRequest_name = newconfirmRequest_name;
	}

	// qaApprove
	public String getqaApprove_ID() {
		return qaApprove_ID;
	}

	public void setqaApprove_ID(String newqaApprove_ID) {
		qaApprove_ID = newqaApprove_ID;
	}

	public String getqaApprove_name() {
		return qaApprove_name;
	}

	public void setqaApprove_name(String newqaApprove_name) {
		qaApprove_name = newqaApprove_name;
	}

	// achApprove
	public String getachApprove_ID() {
		return achApprove_ID;
	}

	public void setachApprove_ID(String newachApprove_ID) {
		achApprove_ID = newachApprove_ID;
	}

	public String getachApprove_name() {
		return achApprove_name;
	}

	public void setachApprove_name(String newachApprove_name) {
		achApprove_name = newachApprove_name;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public SectionBean getSection() {
		return section;
	}

	public void setSection(SectionBean section) {
		this.section = section;
	}

	public MachineBean getMachine() {
		return machine;
	}

	public void setMachine(MachineBean machine) {
		this.machine = machine;
	}

	public String getSectionSearch() {
		return sectionSearch;
	}

	public void setSectionSearch(String sectionSearch) {
		this.sectionSearch = sectionSearch;
	}

	public String getRequestTypeSearch() {
		return requestTypeSearch;
	}

	public void setRequestTypeSearch(String requestTypeSearch) {
		this.requestTypeSearch = requestTypeSearch;
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

	public String getRequestBy() {
		return requestBy;
	}

	public void setRequestBy(String requestBy) {
		this.requestBy = requestBy;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

}
