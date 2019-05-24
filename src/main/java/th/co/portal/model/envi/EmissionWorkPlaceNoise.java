package th.co.portal.model.envi;

import java.math.BigDecimal;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class EmissionWorkPlaceNoise extends BaseDomain {
	private Integer id;
	private String period;
	private String companyCode;
	private String parameterCode;
	
	private BigDecimal sampling1Frist;
	private BigDecimal sampling1Second;
	private BigDecimal sampling1Third;
	private BigDecimal sampling1Fourth;
	private BigDecimal sampling2Frist;
	private BigDecimal sampling2Second;
	private BigDecimal sampling2Third;
	private BigDecimal sampling2Fourth;
	private BigDecimal sampling3Frist;
	private BigDecimal sampling3Second;
	private BigDecimal sampling3Third;
	private BigDecimal sampling3Fourth;
	
	private String samplingPoint;
	/* search */
	private String periodFrom;
	private String periodTo;

	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getParameterCode() {
		return parameterCode;
	}
	public void setParameterCode(String parameterCode) {
		this.parameterCode = parameterCode;
	}
	public String getSamplingPoint() {
		return samplingPoint;
	}
	public void setSamplingPoint(String samplingPoint) {
		this.samplingPoint = samplingPoint;
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
	public BigDecimal getSampling1Frist() {
		return sampling1Frist;
	}
	public void setSampling1Frist(BigDecimal sampling1Frist) {
		this.sampling1Frist = sampling1Frist;
	}
	public BigDecimal getSampling1Second() {
		return sampling1Second;
	}
	public void setSampling1Second(BigDecimal sampling1Second) {
		this.sampling1Second = sampling1Second;
	}
	public BigDecimal getSampling1Third() {
		return sampling1Third;
	}
	public void setSampling1Third(BigDecimal sampling1Third) {
		this.sampling1Third = sampling1Third;
	}
	public BigDecimal getSampling1Fourth() {
		return sampling1Fourth;
	}
	public void setSampling1Fourth(BigDecimal sampling1Fourth) {
		this.sampling1Fourth = sampling1Fourth;
	}
	public BigDecimal getSampling2Frist() {
		return sampling2Frist;
	}
	public void setSampling2Frist(BigDecimal sampling2Frist) {
		this.sampling2Frist = sampling2Frist;
	}
	public BigDecimal getSampling2Second() {
		return sampling2Second;
	}
	public void setSampling2Second(BigDecimal sampling2Second) {
		this.sampling2Second = sampling2Second;
	}
	public BigDecimal getSampling2Third() {
		return sampling2Third;
	}
	public void setSampling2Third(BigDecimal sampling2Third) {
		this.sampling2Third = sampling2Third;
	}
	public BigDecimal getSampling2Fourth() {
		return sampling2Fourth;
	}
	public void setSampling2Fourth(BigDecimal sampling2Fourth) {
		this.sampling2Fourth = sampling2Fourth;
	}
	public BigDecimal getSampling3Frist() {
		return sampling3Frist;
	}
	public void setSampling3Frist(BigDecimal sampling3Frist) {
		this.sampling3Frist = sampling3Frist;
	}
	public BigDecimal getSampling3Second() {
		return sampling3Second;
	}
	public void setSampling3Second(BigDecimal sampling3Second) {
		this.sampling3Second = sampling3Second;
	}
	public BigDecimal getSampling3Third() {
		return sampling3Third;
	}
	public void setSampling3Third(BigDecimal sampling3Third) {
		this.sampling3Third = sampling3Third;
	}
	public BigDecimal getSampling3Fourth() {
		return sampling3Fourth;
	}
	public void setSampling3Fourth(BigDecimal sampling3Fourth) {
		this.sampling3Fourth = sampling3Fourth;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
