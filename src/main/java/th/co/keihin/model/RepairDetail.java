package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class RepairDetail  extends BaseDomain{
	private String repairDetail_ID;
	private String request_ID;
	private String seq_ID;
	private String part_ID;
	private String part_qty;
	private String part_price;
	private String other_cost;
	private String total_cost;
	private String part_name;

	public String getRepairDetail_ID() {
		return repairDetail_ID;
	}

	public void setRepairDetail_ID(String repairDetail_ID) {
		this.repairDetail_ID = repairDetail_ID;
	}

	public String getRequest_ID() {
		return request_ID;
	}

	public void setRequest_ID(String request_ID) {
		this.request_ID = request_ID;
	}

	public String getSeq_ID() {
		return seq_ID;
	}

	public void setSeq_ID(String seq_ID) {
		this.seq_ID = seq_ID;
	}

	public String getPart_ID() {
		return part_ID;
	}

	public void setPart_ID(String part_ID) {
		this.part_ID = part_ID;
	}

	public String getPart_qty() {
		return part_qty;
	}

	public void setPart_qty(String part_qty) {
		this.part_qty = part_qty;
	}

	public String getPart_price() {
		return part_price;
	}

	public void setPart_price(String part_price) {
		this.part_price = part_price;
	}

	public String getOther_cost() {
		return other_cost;
	}

	public void setOther_cost(String other_cost) {
		this.other_cost = other_cost;
	}

	public String getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

}
