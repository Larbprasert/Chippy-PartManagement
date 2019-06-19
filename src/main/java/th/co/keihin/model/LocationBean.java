package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class LocationBean extends BaseDomain{
	private String location_ID;
    private String location_name;
    
    private String activeFlag;
    private String activeFlag_name;
    
	private FactoryBean factory;
//	private String factory_ID;
//	private String factory_name;
//		

	public String getLocation_ID() {
        return location_ID;
	}

     public void setLocation_ID(String newLocation_ID) {
        location_ID = newLocation_ID;
	}

    
     public String getLocation_name() {
        return location_name;
	}

     public void setLocation_name(String newLocation_name) {
    	 location_name = newLocation_name;
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

//	public String getFactory_ID() {
//		return factory_ID;
//	}
//
//	public void setFactory_ID(String factory_ID) {
//		this.factory_ID = factory_ID;
//	}
//
//	public String getFactory_name() {
//		return factory_name;
//	}
//
//	public void setFactory_name(String factory_name) {
//		this.factory_name = factory_name;
//	}


	public FactoryBean getFactory() {
		return factory;
	}

	public void setFactory(FactoryBean factory) {
		this.factory = factory;
	}
	
	
}
