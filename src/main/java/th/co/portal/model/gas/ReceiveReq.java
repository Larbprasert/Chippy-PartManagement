package th.co.portal.model.gas;

import java.util.Date;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class ReceiveReq extends BaseDomain{
	
	  private Integer id;
	  private String remark;				/* หมายเหตุ */
	  private String statusReceive;
	  private String receiveBy;				/* สถานะ Receive */
	  private Date   receiveDate;
	  
	  
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
		public String getStatusReceive() {
			return statusReceive;
		}
		public void setStatusReceive(String statusReceive) {
			this.statusReceive = statusReceive;
		}
		public String getReceiveBy() {
			return receiveBy;
		}
		public void setReceiveBy(String receiveBy) {
			this.receiveBy = receiveBy;
		}
		public Date getReceiveDate() {
			return receiveDate;
		}
		public void setReceiveDate(Date receiveDate) {
			this.receiveDate = receiveDate;
		}
	  
	  
	  
}
