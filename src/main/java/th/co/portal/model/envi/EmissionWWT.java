package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class EmissionWWT extends BaseDomain {
	private Integer id;
	private String period;
	private String plantCode;
	private String parameterCode;
	
	private BigDecimal jan;
	private BigDecimal feb;
	private BigDecimal mar;
	private BigDecimal apr;
	private BigDecimal may;
	private BigDecimal jun;
	private BigDecimal jul;
	private BigDecimal aug;
	private BigDecimal sep;
	private BigDecimal oct;
	private BigDecimal nov;
	private BigDecimal dec;
	
	/* search */
	private String periodFrom;
	private String periodTo;
	private String parameterReq;
	private String plantReq;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPlantCode() {
		return plantCode;
	}
	public void setPlantCode(String plantCode) {
		this.plantCode = plantCode;
	}
	public String getParameterCode() {
		return parameterCode;
	}
	public void setParameterCode(String parameterCode) {
		this.parameterCode = parameterCode;
	}
	public BigDecimal getJan() {
		return jan;
	}
	public void setJan(BigDecimal jan) {
		this.jan = jan;
	}
	public BigDecimal getFeb() {
		return feb;
	}
	public void setFeb(BigDecimal feb) {
		this.feb = feb;
	}
	public BigDecimal getMar() {
		return mar;
	}
	public void setMar(BigDecimal mar) {
		this.mar = mar;
	}
	public BigDecimal getApr() {
		return apr;
	}
	public void setApr(BigDecimal apr) {
		this.apr = apr;
	}
	public BigDecimal getMay() {
		return may;
	}
	public void setMay(BigDecimal may) {
		this.may = may;
	}
	public BigDecimal getJun() {
		return jun;
	}
	public void setJun(BigDecimal jun) {
		this.jun = jun;
	}
	public BigDecimal getJul() {
		return jul;
	}
	public void setJul(BigDecimal jul) {
		this.jul = jul;
	}
	public BigDecimal getAug() {
		return aug;
	}
	public void setAug(BigDecimal aug) {
		this.aug = aug;
	}
	public BigDecimal getSep() {
		return sep;
	}
	public void setSep(BigDecimal sep) {
		this.sep = sep;
	}
	public BigDecimal getOct() {
		return oct;
	}
	public void setOct(BigDecimal oct) {
		this.oct = oct;
	}
	public BigDecimal getNov() {
		return nov;
	}
	public void setNov(BigDecimal nov) {
		this.nov = nov;
	}
	public BigDecimal getDec() {
		return dec;
	}
	public void setDec(BigDecimal dec) {
		this.dec = dec;
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
	public String getParameterReq() {
		return parameterReq;
	}
	public void setParameterReq(String parameterReq) {
		this.parameterReq = parameterReq;
	}
	public String getPlantReq() {
		return plantReq;
	}
	public void setPlantReq(String plantReq) {
		this.plantReq = plantReq;
	}
}
