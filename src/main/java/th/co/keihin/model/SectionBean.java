package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class SectionBean extends BaseDomain{
	private String section_ID;
    private String section_name;
    
    private String activeFlag;
    private String activeFlag_name;
    

    private DepartmentBean department;
//    
//	private String dept_ID;
//	private String dept_name;
//		

	public String getSection_ID() {
        return section_ID;
	}

	public void setSection_ID(String newSection_ID) {
        section_ID = newSection_ID;
	}

    
     public String getSection_name() {
        return section_name;
	}

     public void setSection_name(String newSection_name) {
    	 section_name = newSection_name;
	}

     
    public String getActiveFlag() {
    	return this.activeFlag;
    }
    
    public void setActiveFlag(String activeFlag) {
    	this.activeFlag= activeFlag;
    } 
    
     
 	public String getActiveFlag_name() {
		return activeFlag_name;
	}

	public void setActiveFlag_name(String activeFlag_name) {
		this.activeFlag_name = activeFlag_name;
	}

    public DepartmentBean getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentBean department) {
		this.department = department;
	}
	
//	public String getDept_ID() {
//        return dept_ID;
//	}
//
//     public void setDept_ID(String newDept_ID) {
//        dept_ID = newDept_ID;
//	}
//
//     public String getDept_name() {
//        return dept_name;
//	}
//
//     public void setDept_name(String newDept_name) {
//    	 dept_name = newDept_name;
//	}
     
}
