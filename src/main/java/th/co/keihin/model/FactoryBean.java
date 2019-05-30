package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class FactoryBean extends BaseDomain {
	
	private String factory_ID;
    private String factory_name;
	
    private int activeFlag;
    private String activeFlag_name;
    


	public String getFactory_ID() {
        return factory_ID;
	}

     public void setFactory_ID(String newFactory_ID) {
        factory_ID = newFactory_ID;
	}

    
     public String getFactory_name() {
        return factory_name;
	}

     public void setFactory_name(String newFactory_name) {
    	 factory_name = newFactory_name;
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
