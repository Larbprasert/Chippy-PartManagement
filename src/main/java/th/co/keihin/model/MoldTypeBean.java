package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class MoldTypeBean extends BaseDomain {
	
	private String moldType_ID;
    private String moldType_name;
	
    private int activeFlag;
    private String activeFlag_name;
    	

	public String getMoldType_ID() {
        return moldType_ID;
	}

     public void setMoldType_ID(String newMoldType_ID) {
        moldType_ID = newMoldType_ID;
	}

    
     public String getMoldType_name() {
        return moldType_name;
	}

     public void setMoldType_name(String newMoldType_name) {
    	 moldType_name = newMoldType_name;
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
