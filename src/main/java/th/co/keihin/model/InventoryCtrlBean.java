package th.co.keihin.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class InventoryCtrlBean extends BaseDomain{
	
	private String sysInventory_ID;
	
	private String inventory_ID;
    private String inventory_name;
    
    private UnitTypeBean unitType;
//    private String unitType_ID;
//    private String unitType_name;
    
    private LocationBean location;
//    private String location_ID;
//    private String location_name;
    
    private MakerBean maker;
//    private String maker_ID;
//    private String maker_name;
    
          
    private int min_stock;
    private int max_stock;
    private int qty;
    private float price;
        
    private int activeFlag;
    private String activeFlag_name;
    
    private int movementCode;
    private String movement_name;
    
    private int qty_before;
    
//	private Date createDate;
//	private String createBy;
//	
//	private Date updateDate;
//	private String updateBy;

    private int rank;
    private String rank_name;
    
    private String invoice_number;
       
	
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

	public String getSysInventory_ID() {
		return sysInventory_ID;
	}

	public void setSysInventory_ID(String sysInventory_ID) {
		this.sysInventory_ID = sysInventory_ID;
	}

	public String getInventory_ID() {
		return inventory_ID;
	}

	public void setInventory_ID(String inventory_ID) {
		this.inventory_ID = inventory_ID;
	}

	public String getInventory_name() {
		return inventory_name;
	}

	public void setInventory_name(String inventory_name) {
		this.inventory_name = inventory_name;
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

	public int getMovementCode() {
		return movementCode;
	}

	public void setMovementCode(int movementCode) {
		this.movementCode = movementCode;
	}

	public String getMovement_name() {
		return movement_name;
	}

	public void setMovement_name(String movement_name) {
		this.movement_name = movement_name;
	}

	public int getQty_before() {
		return qty_before;
	}

	public void setQty_before(int qty_before) {
		this.qty_before = qty_before;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

			
	public String getInvoice_number() {
		return invoice_number;
	}

	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
}
