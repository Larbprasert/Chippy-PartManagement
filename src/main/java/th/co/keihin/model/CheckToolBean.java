package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class CheckToolBean extends BaseDomain {
	
	private String checkTool_ID;
    private String checkTool_name;
    
    private int activeFlag;
    private String activeFlag_name;
    
    private int timing;
    private String timing_name;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;
		


	public String getCheckTool_ID() {
        return checkTool_ID;
	}

     public void setCheckTool_ID(String newCheckTool_ID) {
        checkTool_ID = newCheckTool_ID;
	}

    
     public String getCheckTool_name() {
        return checkTool_name;
	}

     public void setCheckTool_name(String newCheckTool_name) {
    	 checkTool_name = newCheckTool_name;
	}

     public int getTiming() {
     	return this.timing;
     }
     
     public void setTiming(int timing) {
     	this.timing= timing;
     }   

     public String getTiming_name() {
         return timing_name;
 	}

      public void setTiming_name(String newTiming_name) {
     	 timing_name = newTiming_name;
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
