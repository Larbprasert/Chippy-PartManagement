package th.co.keihin.model;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class PartMachineBean extends BaseDomain{
	
	private String part_ID;
    private String part_name;
    private int qty;
    private String machine_ID;
    private String machine_name;
    
    private PartMasterBean partMaster;
    private MachineBean machine;
    
   
    public PartMachineBean(){
		
	}
	
	public PartMachineBean(String partID, String machineID, int qty) {
		this.part_ID =partID;
		this.machine_ID =machineID;
		this.qty =qty;
	}
    
	public PartMasterBean getPartMaster() {
		return partMaster;
	}
	public void setPartMaster(PartMasterBean partMaster) {
		this.partMaster = partMaster;
	}
	public MachineBean getMachine() {
		return machine;
	}
	public void setMachine(MachineBean machine) {
		this.machine = machine;
	}
	
	
	public String getPart_ID() {
		return part_ID;
	}
	public void setPart_ID(String part_ID) {
		this.part_ID = part_ID;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getMachine_ID() {
		return machine_ID;
	}
	public void setMachine_ID(String machine_ID) {
		this.machine_ID = machine_ID;
	}
	public String getMachine_name() {
		return machine_name;
	}
	public void setMachine_name(String machine_name) {
		this.machine_name = machine_name;
	}   
    

}
