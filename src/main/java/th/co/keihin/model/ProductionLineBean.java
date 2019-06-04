package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class ProductionLineBean extends BaseDomain{
	private String productionLine_ID;
    private String productionLine_name;
    
    private int activeFlag;
    private String activeFlag_name;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;
	
	private FactoryBean factory;
//	private String factory_ID;
//	private String factory_name;
		

	public String getProductionLine_ID() {
        return productionLine_ID;
	}

     public void setProductionLine_ID(String newProductionLine_ID) {
        productionLine_ID = newProductionLine_ID;
	}

    
     public String getProductionLine_name() {
        return productionLine_name;
	}

     public void setProductionLine_name(String newProductionLine_name) {
    	 productionLine_name = newProductionLine_name;
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

	public FactoryBean getFactory() {
		return factory;
	}

	public void setFactory(FactoryBean factory) {
		this.factory = factory;
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
//	public String getFactory_ID() {
//        return factory_ID;
//	}
//
//     public void setFactory_ID(String newFactory_ID) {
//        factory_ID = newFactory_ID;
//	}
//
//     public String getFactory_name() {
//        return factory_name;
//	}
//
//     public void setFactory_name(String newFactory_name) {
//    	 factory_name = newFactory_name;
//	}
}
