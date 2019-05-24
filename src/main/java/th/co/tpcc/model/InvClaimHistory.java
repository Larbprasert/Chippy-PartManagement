
package th.co.tpcc.model;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class InvClaimHistory extends BaseDomain{

	private Integer claimId;
	private String claimNo; // Case No.
	private String claimCode; // Ticket No
	private String claimStatus; // claim status
	private String claimDetail;
	private String hostId;
	private String startDate;
	private String finishDate;
	private String remark;
	private String ownerCode;
	private String assignTo;
	private String status;
	private String sn;
	
	private InvAsset invAsset;
	private Owner owner;
	private List<InvDocument> documents;

	public InvAsset getInvAsset() {
		return invAsset;
	}

	public void setInvAsset(InvAsset invAsset) {
		this.invAsset = invAsset;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}
	
	public Integer getClaimId() {
		return claimId;
	}

	public void setClaimId(Integer claimId) {
		this.claimId = claimId;
	}

	public String getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(String claimNo) {
		this.claimNo = claimNo;
	}

	public String getClaimCode() {
		return claimCode;
	}

	public void setClaimCode(String claimCode) {
		this.claimCode = claimCode;
	}

	public String getClaimDetail() {
		return claimDetail;
	}

	public void setClaimDetail(String claimDetail) {
		this.claimDetail = claimDetail;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String string) {
		this.startDate = string;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String string) {
		this.finishDate = string;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getOwnerCode() {
		return ownerCode;
	}

	public void setOwnerCode(String ownerCode) {
		this.ownerCode = ownerCode;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getClaimStatus() {
		return claimStatus;
	}

	public void setClaimStatus(String claimStatus) {
		this.claimStatus = claimStatus;
	}
	
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public List<InvDocument> getDocuments() {
		return documents;
	}

	public void setDocuments(List<InvDocument> documents) {
		this.documents = documents;
	}

	public String getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
	}

}
