package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class DepartmentBean extends BaseDomain {

	private String dept_ID;
    private String dept_name;
    
    private int activeFlag;
    private String activeFlag_name;
    

	public String getDept_ID() {
        return dept_ID;
	}

     public void setDept_ID(String newDept_ID) {
        dept_ID = newDept_ID;
	}

    
     public String getDept_name() {
        return dept_name;
	}

     public void setDept_name(String newDept_name) {
    	 dept_name = newDept_name;
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

//	For print check data 
//	call on font-end --> ${departmentBean} 
	@Override
	public String toString() {
		return "DepartmentBean [dept_ID=" + dept_ID + ", dept_name=" + dept_name + ", activeFlag=" + activeFlag
				+ ", activeFlag_name=" + activeFlag_name + "]";
	}

				
}