package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class UserTypeBean extends BaseDomain {
	private String userType_ID;
    private String userType_name;
    
    private int activeFlag;
    private String activeFlag_name;
    
		

	public String getUserType_ID() {
        return userType_ID;
	}

     public void setUserType_ID(String newUserType_ID) {
        userType_ID = newUserType_ID;
	}

    
     public String getUserType_name() {
        return userType_name;
	}

     public void setUserType_name(String newUserType_name) {
    	 userType_name = newUserType_name;
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