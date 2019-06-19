package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class MachineBean extends BaseDomain{
	private String machine_ID;
    private String machine_name;
    
    private String activeFlag;
    private String activeFlag_name;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;
	
    private ProductionLineBean productionLine;
//	private String productionLine_ID;
//	private String productionLine_name;
		

	public String getMachine_ID() {
        return machine_ID;
	}

     public void setMachine_ID(String newMachine_ID) {
        machine_ID = newMachine_ID;
	}

    
     public String getMachine_name() {
        return machine_name;
	}

     public void setMachine_name(String newMachine_name) {
    	 machine_name = newMachine_name;
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

	public ProductionLineBean getProductionLine() {
		return productionLine;
	}

	public void setProductionLine(ProductionLineBean productionLine) {
		this.productionLine = productionLine;
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
//	
//	public String getProductionLine_ID() {
//        return productionLine_ID;
//	}
//
//     public void setProductionLine_ID(String newProductionLine_ID) {
//        productionLine_ID = newProductionLine_ID;
//	}
//
//     public String getProductionLine_name() {
//        return productionLine_name;
//	}
//
//     public void setProductionLine_name(String newProductionLine_name) {
//    	 productionLine_name = newProductionLine_name;
//	}
}
