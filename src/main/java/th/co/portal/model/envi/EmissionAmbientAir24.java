package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class EmissionAmbientAir24 extends BaseDomain{
	
	private Integer id;
	private String companyCode;
	private String companyName;
	private String parameter_code;
	private String period;
	
	private BigDecimal plant_val;
	private BigDecimal nongfab_val;
	private BigDecimal chkl_val;

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
	public BigDecimal getPlant_val() {
		return plant_val;
	}
	public void setPlant_val(BigDecimal plant_val) {
		this.plant_val = plant_val;
	}
	public BigDecimal getNongfab_val() {
		return nongfab_val;
	}
	public void setNongfab_val(BigDecimal nongfab_val) {
		this.nongfab_val = nongfab_val;
	}
	public BigDecimal getChkl_val() {
		return chkl_val;
	}
	public void setChkl_val(BigDecimal chkl_val) {
		this.chkl_val = chkl_val;
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
