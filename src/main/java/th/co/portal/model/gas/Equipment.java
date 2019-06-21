
package th.co.portal.model.gas;

import java.util.List;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class Equipment extends BaseDomain {

	private Integer id;

	// private String compCode;
	// private String compName;
	private String deptCode;
	private String deptName;
	private String eqCode;
	private String eqTypeCode;
	private String eqTypeName;
	private String areaRep;
	private String areaSup;
	private String areaSec;
	private String emailCC;

	private String serialNo;
	private String model;
	private String brand;
	private String measureRange;
	private String calStandard;
	private String servicedBy;
	private String calTime;
	private String calUnit;
	private String calCriteria;
	private String alarm1;
	private String alarm2;

	private String servicedByName;
	private String servicedByEmail;
	private String calTimeStd;
	private String lastCalDate;

	private String lastCalDateTxt;
	private String statusTxt;
	private String areaRepTxt;
	private String areaSupTxt;
	private String areaSecTxt;
	private String emailCCTxt;
	private String calUnitTxt;

	private List<UploadFile> certList;

	public String getServicedByName() {
		return servicedByName;
	}

	public void setServicedByName(String servicedByName) {
		this.servicedByName = servicedByName;
	}

	public String getCalTimeStd() {
		return calTimeStd;
	}

	public void setCalTimeStd(String calTimeStd) {
		this.calTimeStd = calTimeStd;
	}

	public String getLastCalDate() {
		return lastCalDate;
	}

	public void setLastCalDate(String lastCalDate) {
		this.lastCalDate = lastCalDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEqTypeCode() {
		return eqTypeCode;
	}

	public void setEqTypeCode(String eqTypeCode) {
		this.eqTypeCode = eqTypeCode;
	}

	public String getEqTypeName() {
		return eqTypeName;
	}

	public void setEqTypeName(String eqTypeName) {
		this.eqTypeName = eqTypeName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEqCode() {
		return eqCode;
	}

	public void setEqCode(String eqCode) {
		this.eqCode = eqCode;
	}

	public String getAreaRep() {
		return areaRep;
	}

	public void setAreaRep(String areaRep) {
		this.areaRep = areaRep;
	}

	public String getAreaSup() {
		return areaSup;
	}

	public void setAreaSup(String areaSup) {
		this.areaSup = areaSup;
	}

	public String getAreaSec() {
		return areaSec;
	}

	public void setAreaSec(String areaSec) {
		this.areaSec = areaSec;
	}

	public String getEmailCC() {
		return emailCC;
	}

	public void setEmailCC(String emailCC) {
		this.emailCC = emailCC;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getCalStandard() {
		return calStandard;
	}

	public void setCalStandard(String calStandard) {
		this.calStandard = calStandard;
	}

	public String getServicedBy() {
		return servicedBy;
	}

	public void setServicedBy(String servicedBy) {
		this.servicedBy = servicedBy;
	}

	public String getCalTime() {
		return calTime;
	}

	public void setCalTime(String calTime) {
		this.calTime = calTime;
	}

	public String getCalUnit() {
		return calUnit;
	}

	public void setCalUnit(String calUnit) {
		this.calUnit = calUnit;
	}

	public String getCalCriteria() {
		return calCriteria;
	}

	public void setCalCriteria(String calCriteria) {
		this.calCriteria = calCriteria;
	}

	public String getAlarm1() {
		return alarm1;
	}

	public void setAlarm1(String alarm1) {
		this.alarm1 = alarm1;
	}

	public String getAlarm2() {
		return alarm2;
	}

	public void setAlarm2(String alarm2) {
		this.alarm2 = alarm2;
	}

	public String getServicedByEmail() {
		return servicedByEmail;
	}

	public void setServicedByEmail(String servicedByEmail) {
		this.servicedByEmail = servicedByEmail;
	}

	public String getStatusTxt() {
		return statusTxt;
	}

	public void setStatusTxt(String statusTxt) {
		this.statusTxt = statusTxt;
	}

	public String getAreaRepTxt() {
		return areaRepTxt;
	}

	public void setAreaRepTxt(String areaRepTxt) {
		this.areaRepTxt = areaRepTxt;
	}

	public String getAreaSupTxt() {
		return areaSupTxt;
	}

	public void setAreaSupTxt(String areaSupTxt) {
		this.areaSupTxt = areaSupTxt;
	}

	public String getAreaSecTxt() {
		return areaSecTxt;
	}

	public void setAreaSecTxt(String areaSecTxt) {
		this.areaSecTxt = areaSecTxt;
	}

	public String getEmailCCTxt() {
		return emailCCTxt;
	}

	public void setEmailCCTxt(String emailCCTxt) {
		this.emailCCTxt = emailCCTxt;
	}

	public String getCalUnitTxt() {
		return calUnitTxt;
	}

	public void setCalUnitTxt(String calUnitTxt) {
		this.calUnitTxt = calUnitTxt;
	}

	public String getLastCalDateTxt() {
		return lastCalDateTxt;
	}

	public void setLastCalDateTxt(String lastCalDateTxt) {
		this.lastCalDateTxt = lastCalDateTxt;
	}

	public List<UploadFile> getCertList() {
		return certList;
	}

	public void setCertList(List<UploadFile> certList) {
		this.certList = certList;
	}

}
