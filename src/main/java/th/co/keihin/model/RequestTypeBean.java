package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class RequestTypeBean extends BaseDomain {
	private String requestType_ID;
    private String requestType_name;
    
    private int activeFlag;
    private String activeFlag_name;
  
	public String getRequestType_ID() {
        return requestType_ID;
	}

     public void setRequestType_ID(String newRequestType_ID) {
        requestType_ID = newRequestType_ID;
	}

    
     public String getRequestType_name() {
        return requestType_name;
	}

     public void setRequestType_name(String newRequestType_name) {
    	 requestType_name = newRequestType_name;
	}
     
    public int getActiveFlag() {
    	return this.activeFlag;
    }
    
    public void setActiveFlag(int activeFlag) {
    	this.activeFlag= activeFlag;
    }
    
     
 	public String getActiveFlag_name() {
		return activeFlag_name;
	}

	public void setActiveFlag_name(String activeFlag_name) {
		this.activeFlag_name = activeFlag_name;
	}

}
