package th.co.portal.model.envi;

import java.math.BigDecimal;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.JsonNumberSerializer;
import th.co.baiwa.common.constant.CommonConstants;
import th.co.baiwa.common.persistence.entity.BaseDomain;
import th.co.portal.constant.EnviConstants;
import th.co.tpcc.model.SysParam;


//@JsonDeserialize(using = JsonNumberSerializer.class)
public class UtilityEnergyInv extends BaseDomain {

	private Integer id;
	private String companyCode;
	private String companyName;
	private String year;

	private String fromYear;
	private String toYear;

//	@JsonSerialize(using = JsonNumberSerializer.class)
	private BigDecimal productVal;

	private BigDecimal elecConVal;

	private BigDecimal elecCo2Val;

	private BigDecimal elecCo2TonVal;

	private BigDecimal waterConVal;

	private BigDecimal waterCo2Val;

	private BigDecimal waterCo2TonVal;

	private BigDecimal steamConVal;

	private BigDecimal steamCo2Val;

	private BigDecimal steamCo2TonVal;

	private BigDecimal elecFactor;

	private BigDecimal waterFactor;

	private BigDecimal steamFactor;

	private BigDecimal total;

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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getFromYear() {
		return fromYear;
	}

	public void setFromYear(String fromYear) {
		this.fromYear = fromYear;
	}

	public String getToYear() {
		return toYear;
	}

	public void setToYear(String toYear) {
		this.toYear = toYear;
	}

	public BigDecimal getProductVal() {
		return productVal;
	}

	public void setProductVal(BigDecimal productVal) {
		this.productVal = productVal;
	}

	public void setElecConVal(BigDecimal elecConVal) {
		this.elecConVal = elecConVal;
	}

	public void setWaterConVal(BigDecimal waterConVal) {
		this.waterConVal = waterConVal;
	}

	public void setSteamConVal(BigDecimal steamConVal) {
		this.steamConVal = steamConVal;
	}

	public void setElecFactor(BigDecimal elecFactor) {
		this.elecFactor = elecFactor;
	}

	public void setWaterFactor(BigDecimal waterFactor) {
		this.waterFactor = waterFactor;
	}

	public void setSteamFactor(BigDecimal steamFactor) {
		this.steamFactor = steamFactor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getElecConVal() {
		return elecConVal;
	}

	public BigDecimal getWaterConVal() {
		return waterConVal;
	}

	public BigDecimal getSteamConVal() {
		return steamConVal;
	}

	public BigDecimal calElecCo2Val() {
		elecCo2Val = getElecConVal().multiply(getElecFactor());
		return elecCo2Val;
	}

	public BigDecimal calWaterCo2Val() {
		waterCo2Val = getWaterConVal().multiply(getWaterFactor());
		return waterCo2Val;
	}

	public BigDecimal calSteamCo2Val() {
		steamCo2Val = getSteamConVal().multiply(getSteamFactor());
		return steamCo2Val;
	}

	public BigDecimal calElecCo2TonVal() {
		try {
			elecCo2TonVal = calElecCo2Val().divide(getProductVal(), CommonConstants.NUMBER_SCALE.ROUNDING_MODE);
		} catch (Exception e) {
			elecCo2TonVal = BigDecimal.ZERO;
		}
		return elecCo2TonVal;
	}

	public BigDecimal calWaterCo2TonVal() {
		try {
			waterCo2TonVal = calWaterCo2Val().divide(getProductVal(), CommonConstants.NUMBER_SCALE.ROUNDING_MODE);
		} catch (Exception e) {
			waterCo2TonVal = BigDecimal.ZERO;
		}
		return waterCo2TonVal;
	}

	public BigDecimal calSteamCo2TonVal() {
		try {
			steamCo2TonVal = calSteamCo2Val().divide(getProductVal(), CommonConstants.NUMBER_SCALE.ROUNDING_MODE);
		} catch (Exception e) {
			steamCo2TonVal = BigDecimal.ZERO;
		}
		return steamCo2TonVal; 
	}

	public BigDecimal getElecFactor() {
		SysParam param = ApplicationCache.getParamGroupValue(
				EnviConstants.EMISSION_FACTOR.TYPE, 
				EnviConstants.EMISSION_FACTOR.ELECTRICAL);
		return elecFactor =  StringUtils.isEmpty(param.getValue_1())?  BigDecimal.ZERO : new BigDecimal(param.getValue_1()); 
	}

	public BigDecimal getWaterFactor() {
		SysParam param = ApplicationCache.getParamGroupValue(
				EnviConstants.EMISSION_FACTOR.TYPE, 
				EnviConstants.EMISSION_FACTOR.WATER);
		return waterFactor =  StringUtils.isEmpty(param.getValue_1())?  BigDecimal.ZERO : new BigDecimal(param.getValue_1()); 
	}

	public BigDecimal getSteamFactor() {
		SysParam param = ApplicationCache.getParamGroupValue(
				EnviConstants.EMISSION_FACTOR.TYPE, 
				EnviConstants.EMISSION_FACTOR.STEAM);
		return steamFactor =  StringUtils.isEmpty(param.getValue_1())?  BigDecimal.ZERO : new BigDecimal(param.getValue_1()); 
	}

	public BigDecimal calTotal() {
		return total = calElecCo2TonVal().add(calWaterCo2TonVal()).add(calSteamCo2TonVal());
	}

}
