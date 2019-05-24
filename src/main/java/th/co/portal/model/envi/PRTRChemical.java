package th.co.portal.model.envi;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class PRTRChemical extends BaseDomain {

	private Integer id;
	private String nameOfChemical;
	private String moleculaFormular;
	private String casNo;
	private String tpccActive;
	private String tpacActive;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNameOfChemical() {
		return nameOfChemical;
	}
	public void setNameOfChemical(String nameOfChemical) {
		this.nameOfChemical = nameOfChemical;
	}

	public String getMoleculaFormular() {
		return moleculaFormular;
	}
	public void setMoleculaFormular(String moleculaFormular) {
		this.moleculaFormular = moleculaFormular;
	}
	public String getCasNo() {
		return casNo;
	}
	public void setCasNo(String casNo) {
		this.casNo = casNo;
	}
	public String getTpccActive() {
		return tpccActive;
	}
	public void setTpccActive(String tpccActive) {
		this.tpccActive = tpccActive;
	}
	public String getTpacActive() {
		return tpacActive;
	}
	public void setTpacActive(String tpacActive) {
		this.tpacActive = tpacActive;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "PRTRChemical [id=" + id + ", nameOfChemical=" + nameOfChemical + ", moleculaFormular="
				+ moleculaFormular + ", casNo=" + casNo + ", tpccActive=" + tpccActive + ", tpacActive=" + tpacActive
				+ "]";
	}



}
