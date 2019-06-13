package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class RequestBean extends BaseDomain{

		private String request_ID;
	    private String doc_number;
	    
	    private RequestTypeBean requestType; 
//	    private String requestType_ID;
//	    private String requestType_name;
	    
	    private SectionBean section;
//	    private String section_ID;
//	    private String location_ID;
	    
	    private String beforeDetail;
	    private String beforePicture;
	    
	    
	    private String user_ID;
	    private String user_name;
	    
	    private MachineBean machine;
//	    private String machine_ID;
//	    private String machine_name;
	    
	    private LocationBean location;
	    	    	    
//	    private Date informDate;
//	    private Time informTime;
	    
	    private CheckToolBean checkTool;
	    
	    
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
	    	    	    
	    private int status;
	    private String status_name;
	    
//	    private Date createDate;
//		private String createBy;
//		
//		private Date updateDate;
//		private String updateBy;
//		
//		private int cCreate;
//		private int cOnProcess;
//		private int cComplete;
//		private int cSummary;
	    
	    


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
	     
	     
	     
//		public String getrequestType_ID() {
//	        return requestType_ID;
//		}
//
//	     public void setrequestType_ID(String newrequestType_ID) {
//	    	 requestType_ID = newrequestType_ID;
//		}
//	     
//	    public String getrequestType_name() {
//	         return requestType_name;
//	 	}
//
//	    public void setrequestType_name(String newrequestType_name) {
//	    	requestType_name = newrequestType_name;
//	 	} 	     
//	     	     
//
//	 	public String getSection_ID() {
//	        return section_ID;
//		}
//
//	     public void setSection_ID(String newSection_ID) {
//	        section_ID = newSection_ID;
//		}
//
//	 	public String getLocation_ID() {
//	        return location_ID;
//		}
//
//	     public void setLocation_ID(String newLocation_ID) {
//	        location_ID = newLocation_ID;
//		}	    

	 	public String getbeforeDetail() {
	        return beforeDetail;
		}

	     public void setbeforeDetail(String newbeforeDetail) {
	    	 beforeDetail = newbeforeDetail;
		}	     
		     		     
	 	public String getbeforePicture() {
	        return beforePicture;
		}

	     public void setbeforePicture(String newbeforePicture) {
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

//		public String getMachine_ID() {
//	        return machine_ID;
//		}
//
//	     public void setMachine_ID(String newMachine_ID) {
//	        machine_ID = newMachine_ID;
//		}
//
//	    
//	     public String getMachine_name() {
//	        return machine_name;
//		}
//
//	     public void setMachine_name(String newMachine_name) {
//	    	 machine_name = newMachine_name;
//		}
//	    
//
//	    public int getStatus() {
//	    	return this.status;
//	    }
	    
	    public void setStatus(int status) {
	    	this.status = status;
	    } 
	    
	    public String getstatus_name() {
	         return status_name;
	 	}

	    public void setstatus_name(String newstatus_name) {
	    	status_name = newstatus_name;
	 	} 		    
	    

	    //informDate
//	    public Date getInformdate() {
//	    	return this.informDate;
//	    }
//	    
//	    public void setInformdate(Date informDate) {
//	    	this.informDate = informDate;
//	    }
//	    
//	    //informTime
//	    public Time getInformtime() {
//	    	return this.informTime;
//	    }
//	    
//	    public void setInformtime(Time informTime) {
//	    	this.informTime = informTime;
//	    }	    

	    //requestApprove
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
		

	     //repairApprove
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
	     

	     //confirmRepair
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

	     
	     //confirmRequest
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
	    
	    //qaApprove
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
	     
	    //achApprove
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
	     
     
//	 	public Date getCreateDate() {
//			return this.createDate;
//		}
//
//		public void setCreateDate(Date createDate) {
//			this.createDate = createDate;
//		}
//		
//		public String getCreateBy() {
//			return this.createBy;
//		}
//		
//		public void setCreateBy(String createBy) {
//			this.createBy = createBy;
//		}
//		
//		public Date getupdateDate() {
//			return this.updateDate;
//		}
//
//		public void setUpdateDate(Date updateDate) {
//			this.updateDate = updateDate;
//		}
//
//		public String getUpdateBy() {
//			return this.updateBy;
//		}
//		
//		public void setUpdateBy(String updateBy) {
//			this.updateBy = updateBy;
//		}
//
//		public int getcCreate() {
//			return cCreate;
//		}
//
//		public void setcCreate(int cCreate) {
//			this.cCreate = cCreate;
//		}
//
//		public int getcOnProcess() {
//			return cOnProcess;
//		}
//
//		public void setcOnProcess(int cOnProcess) {
//			this.cOnProcess = cOnProcess;
//		}
//
//		public int getcComplete() {
//			return cComplete;
//		}
//
//		public void setcComplete(int cComplete) {
//			this.cComplete = cComplete;
//		}
//
//		public int getcSummary() {
//			return cSummary;
//		}
//
//		public void setcSummary(int cSummary) {
//			this.cSummary = cSummary;
//		}
		
		
	}

