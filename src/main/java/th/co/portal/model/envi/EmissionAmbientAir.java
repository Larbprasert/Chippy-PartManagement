package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class EmissionAmbientAir extends BaseDomain {
	
	private Integer id;
	private String companyCode;
	private String companyName;
	private String parameter_code;
	private String period;
	
	private BigDecimal plant_max;
	private BigDecimal plant_min;
	private BigDecimal nongfab_max;
	private BigDecimal nongfab_min;
	private BigDecimal chkl_max;
	private BigDecimal chkl_min;
	
	private String periodFrom;
	private String periodTo;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getParameter_code() {
		return parameter_code;
	}
	public void setParameter_code(String parameter_code) {
		this.parameter_code = parameter_code;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public BigDecimal getPlant_max() {
		return plant_max;
	}
	public void setPlant_max(BigDecimal plant_max) {
		this.plant_max = plant_max;
	}
	public BigDecimal getPlant_min() {
		return plant_min;
	}
	public void setPlant_min(BigDecimal plant_min) {
		this.plant_min = plant_min;
	}
	public BigDecimal getNongfab_max() {
		return nongfab_max;
	}
	public void setNongfab_max(BigDecimal nongfab_max) {
		this.nongfab_max = nongfab_max;
	}
	public BigDecimal getNongfab_min() {
		return nongfab_min;
	}
	public void setNongfab_min(BigDecimal nongfab_min) {
		this.nongfab_min = nongfab_min;
	}
	public BigDecimal getChkl_max() {
		return chkl_max;
	}
	public void setChkl_max(BigDecimal chkl_max) {
		this.chkl_max = chkl_max;
	}
	public BigDecimal getChkl_min() {
		return chkl_min;
	}
	public void setChkl_min(BigDecimal chkl_min) {
		this.chkl_min = chkl_min;
	}
	public String getPeriodFrom() {
		return periodFrom;
	}
	public void setPeriodFrom(String periodFrom) {
		this.periodFrom = periodFrom;
	}
	public String getPeriodTo() {
		return periodTo;
	}
	public void setPeriodTo(String periodTo) {
		this.periodTo = periodTo;
	}
	
	
	

	

	
}
