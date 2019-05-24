package th.co.portal.model.gas;

import java.util.Date;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class ApproveReq extends BaseDomain{

	  private Integer id;
	  private String remark ;							/* หมายเหตุ */
	  private String statusApprove  ;					/* สถานะ Approve */
	  private String approveBy ;						/* Approve โดย*/
	  private Date   approveDate ;
	  
	  
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatusApprove() {
		return statusApprove;
	}
	public void setStatusApprove(String statusApprove) {
		this.statusApprove = statusApprove;
	}
	public String getApproveBy() {
		return approveBy;
	}
	public void setApproveBy(String approveBy) {
		this.approveBy = approveBy;
	}
	public Date getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}
	  
	  
	  
}
