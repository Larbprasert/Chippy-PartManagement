package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class UnitTypeBean extends BaseDomain {
	private String unitType_ID;
    private String unitType_name;
    
	private int activeFlag;
	private String activeFlag_name;

	public String getUnitType_ID() {
        return unitType_ID;
	}

     public void setUnitType_ID(String newUnitType_ID) {
        unitType_ID = newUnitType_ID;
	}

    
     public String getUnitType_name() {
        return unitType_name;
	}

     public void setUnitType_name(String newUnitType_name) {
    	 unitType_name = newUnitType_name;
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
