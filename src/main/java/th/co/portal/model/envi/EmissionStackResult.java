package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class EmissionStackResult extends BaseDomain {
	private Integer id;
	private String companyCode;
	private String companyName;
	private String parameter_code;
	private String year;
	private String stackNo;

	private BigDecimal o2_1st;
	private BigDecimal o2_2nd;
	private BigDecimal emission_1st;
	private BigDecimal emission_2nd;
	
	private String yearFrom;
	private String yearTo;
	
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
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStackNo() {
		return stackNo;
	}
	public void setStackNo(String stackNo) {
		this.stackNo = stackNo;
	}
	public BigDecimal getO2_1st() {
		return o2_1st;
	}
	public void setO2_1st(BigDecimal o2_1st) {
		this.o2_1st = o2_1st;
	}
	public BigDecimal getO2_2nd() {
		return o2_2nd;
	}
	public void setO2_2nd(BigDecimal o2_2nd) {
		this.o2_2nd = o2_2nd;
	}
	public BigDecimal getEmission_1st() {
		return emission_1st;
	}
	public void setEmission_1st(BigDecimal emission_1st) {
		this.emission_1st = emission_1st;
	}
	public BigDecimal getEmission_2nd() {
		return emission_2nd;
	}
	public void setEmission_2nd(BigDecimal emission_2nd) {
		this.emission_2nd = emission_2nd;
	}
	public String getYearFrom() {
		return yearFrom;
	}
	public void setYearFrom(String yearFrom) {
		this.yearFrom = yearFrom;
	}
	public String getYearTo() {
		return yearTo;
	}
	public void setYearTo(String yearTo) {
		this.yearTo = yearTo;
	}
	
	
	

}
