package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class PartMasterBean extends BaseDomain{
	
	private String sysPart_ID;
	
	private String part_ID;
    private String part_name;
    
    private UnitTypeBean unitType;
//    private String unitType_ID;
//    private String unitType_name;
    
    private LocationBean location;
//    private String location_ID;
//    private String location_name;
    
    private MakerBean maker;
//    private String maker_ID;
//    private String maker_name;
    
    private MoldTypeBean moldType;
//    private String moldType_ID;
//    private String moldType_name;    
        
    private int min_stock;
    private int max_stock;
    private int qty;
    private float price;
        
    private int activeFlag;
    private String activeFlag_name;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;
	

	public String getSysPart_ID() {
        return sysPart_ID;
	}

     public void setSysPart_ID(String newSysPart_ID) {
        sysPart_ID = newSysPart_ID;
	}		
	
	public String getPart_ID() {
        return part_ID;
	}

     public void setPart_ID(String newPart_ID) {
        part_ID = newPart_ID;
	}

    
     public String getPart_name() {
        return part_name;
	}

     public void setPart_name(String newPart_name) {
    	 part_name = newPart_name;
	}

	public UnitTypeBean getUnitType() {
		return unitType;
	}

	public void setUnitType(UnitTypeBean unitType) {
		this.unitType = unitType;
	}

	public LocationBean getLocation() {
		return location;
	}

	public void setLocation(LocationBean location) {
		this.location = location;
	}

	public MakerBean getMaker() {
		return maker;
	}

	public void setMaker(MakerBean maker) {
		this.maker = maker;
	}

	public MoldTypeBean getMoldType() {
		return moldType;
	}

	public void setMoldType(MoldTypeBean moldType) {
		this.moldType = moldType;
	}

	public int getMin_stock() {
		return min_stock;
	}

	public void setMin_stock(int min_stock) {
		this.min_stock = min_stock;
	}

	public int getMax_stock() {
		return max_stock;
	}

	public void setMax_stock(int max_stock) {
		this.max_stock = max_stock;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}

	public String getActiveFlag_name() {
		return activeFlag_name;
	}

	public void setActiveFlag_name(String activeFlag_name) {
		this.activeFlag_name = activeFlag_name;
	}
	
}
