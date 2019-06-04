package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class MakerBean extends BaseDomain {
	private String maker_ID;
    private String maker_name;
    private int maker_tel;
    private String maker_contactName;
    private String maker_contactLastName;
    private String maker_address1;
    private String maker_province;
    private String maker_email;
    
    private int activeFlag;
    private String activeFlag_name;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;
    
	public String getMaker_ID() {
        return maker_ID;
	}

     public void setMaker_ID(String newMaker_ID) {
        maker_ID = newMaker_ID;
	}

    
     public String getMaker_name() {
        return maker_name;
	}

     public void setMaker_name(String newMaker_name) {
    	 maker_name = newMaker_name;
	}

     public int getMaker_tel() {
     	return this.maker_tel;
     }
     
     public void setMaker_tel(int maker_tel) {
     	this.maker_tel= maker_tel;
     }      
     
     public String getMaker_contactName() {
         return maker_contactName;
 	}

      public void setMaker_contactName(String newMaker_contactName) {
     	 maker_contactName = newMaker_contactName;
 	}

    
    public String getMaker_contactLastName() {
          return maker_contactLastName;
  	}

    public void setMaker_contactLastName(String newMaker_contactLastName) {
    	maker_contactLastName = newMaker_contactLastName;
  	}
     
    public String getMaker_address1() {
           return maker_address1;
   	}

    public void setMaker_address1(String newMaker_address1) {
    	maker_address1 = newMaker_address1;
   	}
    
    public String getMaker_province() {
        return maker_province;
	}

     public void setMaker_province(String newMaker_province) {
    	 maker_province = newMaker_province;
	}

    public String getMaker_email() {
         return maker_email;
 	}

    public void setMaker_email(String newMaker_email) {
    	maker_email = newMaker_email;
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

//	public Date getCreateDate() {
//		return this.createDate;
//	}
//
//	public void setCreateDate(Date createDate) {
//		this.createDate = createDate;
//	}
//	
//	public String getCreateBy() {
//		return this.createBy;
//	}
//	
//	public void setCreateBy(String createBy) {
//		this.createBy = createBy;
//	}
//	
//	public Date getupdateDate() {
//		return this.updateDate;
//	}
//
//	public void setUpdateDate(Date updateDate) {
//		this.updateDate = updateDate;
//	}
//
//	public String getUpdateBy() {
//		return this.updateBy;
//	}
//	
//	public void setUpdateBy(String updateBy) {
//		this.updateBy = updateBy;
//	}
	
}
