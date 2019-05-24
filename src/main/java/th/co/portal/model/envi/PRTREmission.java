package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class PRTREmission extends BaseDomain {

	private Integer id;
	private Integer prtrChemicalId;
	private String cunsumpitonQuantity;
	private BigDecimal airCombustion;
	private BigDecimal airProcess;
	private BigDecimal airFugitive;
	private BigDecimal airTank;
	private BigDecimal airLoading;
	private BigDecimal airWwt;
	private BigDecimal airSpill;
	private BigDecimal waterWwt;
	private BigDecimal waterSpill;
	private BigDecimal solidLand;
	private BigDecimal TransportWaste;
	private BigDecimal TransportRecycle;
	private String remark;
	private String year;
	private String companyCode;
	
	private BigDecimal emissionVolumTotal	;
	private BigDecimal transpotVolumTotal;
	private BigDecimal airTotal;
	private BigDecimal waterTotal;
	private BigDecimal solidTotal	;

	
	private String nameOfChemical;
	

	
	public String getNameOfChemical() {
		return nameOfChemical;
	}

	public void setNameOfChemical(String nameOfChemical) {
		this.nameOfChemical = nameOfChemical;
	}

	public BigDecimal getEmissionVolumTotal() {
		return emissionVolumTotal;
	}

	public void setEmissionVolumTotal(BigDecimal emissionVolumTotal) {
		this.emissionVolumTotal = emissionVolumTotal;
	}

	public BigDecimal getTranspotVolumTotal() {
		return transpotVolumTotal;
	}

	public void setTranspotVolumTotal(BigDecimal transpotVolumTotal) {
		this.transpotVolumTotal = transpotVolumTotal;
	}

	public BigDecimal getAirTotal() {
		return airTotal;
	}

	public void setAirTotal(BigDecimal airTotal) {
		this.airTotal = airTotal;
	}

	public BigDecimal getWaterTotal() {
		return waterTotal;
	}

	public void setWaterTotal(BigDecimal waterTotal) {
		this.waterTotal = waterTotal;
	}

	public BigDecimal getSolidTotal() {
		return solidTotal;
	}

	public void setSolidTotal(BigDecimal solidTotal) {
		this.solidTotal = solidTotal;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPrtrChemicalId() {
		return prtrChemicalId;
	}

	public void setPrtrChemicalId(Integer prtrChemicalId) {
		this.prtrChemicalId = prtrChemicalId;
	}

	public String getCunsumpitonQuantity() {
		return cunsumpitonQuantity;
	}

	public void setCunsumpitonQuantity(String cunsumpitonQuantity) {
		this.cunsumpitonQuantity = cunsumpitonQuantity;
	}

	public BigDecimal getAirCombustion() {
		return airCombustion;
	}

	public void setAirCombustion(BigDecimal airCombustion) {
		this.airCombustion = airCombustion;
	}

	public BigDecimal getAirProcess() {
		return airProcess;
	}

	public void setAirProcess(BigDecimal airProcess) {
		this.airProcess = airProcess;
	}

	public BigDecimal getAirFugitive() {
		return airFugitive;
	}

	public void setAirFugitive(BigDecimal airFugitive) {
		this.airFugitive = airFugitive;
	}

	public BigDecimal getAirTank() {
		return airTank;
	}

	public void setAirTank(BigDecimal airTank) {
		this.airTank = airTank;
	}

	public BigDecimal getAirLoading() {
		return airLoading;
	}

	public void setAirLoading(BigDecimal airLoading) {
		this.airLoading = airLoading;
	}

	public BigDecimal getAirWwt() {
		return airWwt;
	}

	public void setAirWwt(BigDecimal airWwt) {
		this.airWwt = airWwt;
	}

	public BigDecimal getAirSpill() {
		return airSpill;
	}

	public void setAirSpill(BigDecimal airSpill) {
		this.airSpill = airSpill;
	}

	public BigDecimal getWaterWwt() {
		return waterWwt;
	}

	public void setWaterWwt(BigDecimal waterWwt) {
		this.waterWwt = waterWwt;
	}

	public BigDecimal getWaterSpill() {
		return waterSpill;
	}

	public void setWaterSpill(BigDecimal waterSpill) {
		this.waterSpill = waterSpill;
	}

	public BigDecimal getSolidLand() {
		return solidLand;
	}

	public void setSolidLand(BigDecimal solidLand) {
		this.solidLand = solidLand;
	}

	public BigDecimal getTransportWaste() {
		return TransportWaste;
	}

	public void setTransportWaste(BigDecimal transportWaste) {
		TransportWaste = transportWaste;
	}

	public BigDecimal getTransportRecycle() {
		return TransportRecycle;
	}

	public void setTransportRecycle(BigDecimal transportRecycle) {
		TransportRecycle = transportRecycle;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

}
