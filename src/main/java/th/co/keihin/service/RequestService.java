package th.co.keihin.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.CallableStatementCreator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.keihin.constant.RequestConstants;
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.RepairDetail;
import th.co.keihin.model.RequestBean;
import th.co.keihin.model.RequestTypeBean;
import th.co.keihin.model.SectionBean;
import th.co.portal.model.gas.ResponseResult;

@Repository("requestService")
public class RequestService extends AbstractCommonJdbcDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper REQUEST_MAPPER = new RowMapper(){
		
		@Override
		public RequestBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			RequestBean request = new RequestBean();
			LocationBean location = new LocationBean();
			SectionBean section = new SectionBean();
			DepartmentBean department = new DepartmentBean();
			RequestTypeBean requestType = new RequestTypeBean();
			
			request.setRequest_ID(rs.getString("request_ID"));
			
			requestType.setRequestType_ID(rs.getString("requestType_ID"));
			requestType.setRequestType_name(rs.getString("requestType_name"));
			request.setRequestType(requestType);
			
			request.setRequestStatus(rs.getString("requestStatus"));
			request.setRequestBy(rs.getString("CreateBy"));
			request.setStatus_name(rs.getString("status_name"));
		    request.setCreateDate(rs.getDate("createDate"));
		    request.setCreateDateStr(DateUtils.get_yyyymmdd_hhmmss_en_from_date(rs.getTimestamp("createDate")));
		    request.setInformDate(DateUtils.get_yyyyMMdd_from_date(rs.getTimestamp("createDate")));
		    request.setInformTime(DateUtils.get_hhmmss_from_date(rs.getTimestamp("createDate")));
			
		    return request;
		}
	};
	
	private RowMapper REQUEST_MAPPER_DETAIL = new RowMapper(){
		
		@Override
		public RequestBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			RequestBean request = new RequestBean();
			SectionBean section = new SectionBean();
			LocationBean location = new LocationBean();
			RequestTypeBean requestType = new RequestTypeBean();
			
			request.setRequest_ID(rs.getString("request_ID"));
			
			requestType.setRequestType_ID(rs.getString("requestType_ID"));
			requestType.setRequestType_name(rs.getString("requestType_name"));
			request.setRequestType(requestType);
			
			request.setRequestStatus(rs.getString("requestStatus"));
			request.setRequestBy(rs.getString("CreateBy"));
			request.setStatus_name(rs.getString("status_name"));
			
			section.setSection_ID(rs.getString("section_ID"));
			section.setSection_name(rs.getString("section_name"));
			request.setSection(section);
			
			location.setLocation_ID(rs.getString("location_id"));
			location.setLocation_name(rs.getString("location_name"));
			request.setLocation(location);
			
			request.setBeforeDetail(rs.getString("beforeDetail"));

			request.setCheckToolBefore_ID(rs.getString("checkToolBefore_ID"));
			request.setCheckToolAfter_ID(rs.getString("checkToolAfter_ID"));
			request.setAttachFile(rs.getString("attachFile"));
			request.setAfterComment(rs.getString("afterComment"));
			request.setAfterDescription(rs.getString("afterDescription"));
			request.setStartTime(rs.getString("startTime"));
			request.setFinishTime(rs.getString("finishTime"));
			request.setConfirmJudment(rs.getString("confirmJudment"));
			request.setConcernQA(rs.getString("concernQA"));
			request.setMaintenanceType(rs.getString("maintenanceType"));

			request.setRequestApproveBy(rs.getString("requestApproveBy"));
			request.setRequestSectionBy(rs.getString("requestSectionBy"));
			request.setRepairSectionBy(rs.getString("repairSectionBy"));
			request.setRepairPersonBy(rs.getString("repairPersonBy"));
			request.setConfirmRepairBy(rs.getString("confirmRepairBy"));
			request.setQaApproveBy(rs.getString("qaApproveBy"));
			request.setAchApproveBy(rs.getString("achApproveBy"));
			
			
			request.setCreateDate(rs.getDate("createDate"));
			request.setCreateDateStr(DateUtils.get_yyyymmdd_hhmmss_en_from_date(rs.getTimestamp("createDate")));
			request.setInformDate(DateUtils.get_yyyyMMdd_from_date(rs.getTimestamp("createDate")));
			request.setInformTime(DateUtils.get_hhmmss_from_date(rs.getTimestamp("createDate")));
			
			return request;
		}
	};
	
	 
	public String genNextReqNo() {
	      String jobNo = jdbcTemplate.queryForObject(" SELECT dbo.GetRequestNo() jobNo " , String.class);
	      return jobNo!=null? jobNo:"XXXX" ;
	}

		
	public void requestSave(RequestBean rqt) {
				
			String reqNo =genNextReqNo(); //  Get Req No from DB ;
			rqt.setRequest_ID(reqNo);
			
			jdbcTemplate.update(SQL_INSERT_REQ,
				new Object[] {
					rqt.getRequest_ID(), rqt.getRequestType().getRequestType_ID(), 
					rqt.getUserProfile().getUserId() , rqt.getUserProfile().getSection().getSection_ID(),
					rqt.getLocation().getLocation_ID(),rqt.getBeforeDetail(),
					RequestConstants.REQUEST_STATUS.CREATED,
					rqt.getCreateBy() ,
					rqt.getCreateBy() 
				});
			
			
			if(StringUtils.isNotEmpty(rqt.getFileId())){
				String updateFile = " UPDATE tb_document_upload SET req_id = '"+reqNo+"' Where id in ("+rqt.getFileId()+")";
				jdbcTemplate.update(updateFile);
			}
				
			
	}
	
	protected final static String SQL_INSERT_REQ = buildInsertREQ();
	private final static String buildInsertREQ() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO tb_RequestHeader ( ");
		
		sql.append(" request_ID         ");
		sql.append(", requestType_ID       "); 
		sql.append(", user_ID              "); 
		sql.append(", section_ID           "); 
		
		sql.append(", location_ID          "); 
		sql.append(", informDate           "); 
		sql.append(", informTime           "); 
		sql.append(", beforeDetail         "); 
		
//		sql.append(", requestApproveBy     "); 
//		sql.append(", requestSectionBy     "); 
//		sql.append(", repairSectionBy      "); 
//		sql.append(", repairPersonBy       "); 
		
//		sql.append(", confirmRepairBy      "); 
//		sql.append(", qaApproveBy          "); 
//		sql.append(", achApproveBy         "); 
		
		sql.append(", status               "); 
		
//		sql.append(", checkToolBefore_ID   "); 
//		sql.append(", checkToolAfter_ID    "); 
//		sql.append(", attachFile           "); 
//		sql.append(", afterComment         "); 
		
//		sql.append(", afterDescription     "); 
//		sql.append(", startTime            "); 
//		sql.append(", finishTime           "); 
//		sql.append(", confirmJudment       ");
//		sql.append(", concernQA            "); 
		
		sql.append(", requestApproveBy        ");
		sql.append(", createBy        ");
		sql.append(", createDate      ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?, ?,GETDATE(),GETDATE(),?,?,?,?,GETDATE() ) ");
		return sql.toString();
	}
	

	public DataTableAjax<RequestBean> getAll(RequestBean req) {
		// TODO Auto-generated method stub
		
		DataTableAjax<RequestBean> listrequest = new DataTableAjax<RequestBean>();
		
		String query = "SELECT rqh.request_ID" + 
				"	,rqh.requestType_ID" + 
				"	,rt.requestType_Name" + 
				"	,rqh.status requestStatus ,misc.value1 as status_name" + 
				"	, CASE WHEN rqh.createBy <> 'System' THEN usr.FIRST_NAME_TH + ' ' + usr.LAST_NAME_TH ELSE 'System' END  CreateBy" + 
				"	,rqh.createDate" +
				"   FROM tb_RequestHeader rqh" + 
				"	LEFT JOIN tb_RequestType rt on rqh.requestType_ID = rt.requestType_ID" + 
				"	LEFT JOIN tbm_misc_data misc on rqh.status = misc.misc_code AND misc.misc_type = 'ApplicationStatus'" + 
				"	LEFT JOIN adm_user_profile usr on rqh.user_ID =   CONVERT(VARCHAR(50),usr.user_ID) " + 
				"   WHERE 1=1 " ;//+ 
				//"	AND rqh.status <> 7";
		
		StringBuilder sql = new StringBuilder(query);
		
		//-------------------------------
		//-- 7 = Complete
		//-- 1 = Create
		//-- 9 = all
		//-- 8 = From menu
		//-- <>1 and <>7 = on-process
		//-------------------------------
//		if (ReqStatus.equals("7")) {
//			query = query + "	AND rqh.status = 7";
//		}else if (ReqStatus.equals("1")) {
//			query = query + "	AND rqh.status = 1";
//		}else if (ReqStatus.equals("99")) {
//			query = query + "	AND (rqh.status <> 7 AND rqh.status <> 1)";
//		}else {
//			query = query + "	AND rqh.status <> 7";
//		}
		List wh = new ArrayList<>();
		if(StringUtils.isNotEmpty(req.getRequest_ID())){
			wh.add( "%"+req.getRequest_ID()+"%");
			sql.append(" AND rqh.request_ID like  ? ");
		}
		if(StringUtils.isNotEmpty(req.getRequestTypeSearch())){
			wh.add(req.getRequestTypeSearch() );
			sql.append(" AND rqh.requestType_ID =  ? ");
		}
		
		if(StringUtils.isNotEmpty(req.getSectionSearch())){
			wh.add( req.getSectionSearch() );
			sql.append(" AND usr.section_ID =  ? ");
		}
		
		if(StringUtils.isNotEmpty(req.getRequestStatus())){
			wh.add( req.getRequestStatus() );
			sql.append(" AND rqh.status =  ? ");
		}
		
		sql.append("	order by rqh.request_ID desc ");
		
//		System.out.println(sql.toString());
		
		List<RequestBean> list = jdbcTemplate.query(sql.toString(),wh.toArray(),REQUEST_MAPPER);
		
		int total = list!=null? list.size():0;
		
		listrequest.setRecordsTotal(total);
		listrequest.setRecordsFiltered(total);
		listrequest.setData(list);
		
		return listrequest;
	}
	
	public void delete(RequestBean request)  {
		// TODO Auto-generated method stub
		
	}

	
	public void edit(RequestBean request)  {
		// TODO Auto-generated method stub
		
	}

	
	public List<RequestBean> search(RequestBean request) {
		// TODO Auto-generated method stub
		return null;
	}
	
   public List<UserProfile> findUserByRoleSec(String role, String sec) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT   b.*                                         ");
		sql.append("  FROM adm_user a    LEFT JOIN adm_user_profile b                                     ");
		sql.append(" ON a.USER_ID = b.USER_ID     ");
		sql.append("  WHERE b.ACTIVE_FLG = 'Y'    ");
		
		if(StringUtils.isNotEmpty(role)){
			sql.append(" and exists                            ");
			sql.append(" (                                     ");
			sql.append("  SELECT xa.USER_ID                    ");
			sql.append("  FROM adm_user_role xa, adm_role xb   ");
			sql.append("  WHERE xa.ROLE_ID = xb.ROLE_ID        ");
			sql.append("  and xa.USER_ID = a.USER_ID           ");
			sql.append("  and xb.ROLE_code =  '"+role+"'    ");
			sql.append(" )                                     ");
			
		}
		
		if(StringUtils.isNotEmpty(sec)){
			sql.append(" and b.section_id ="+sec);
			
		}
		

		List<UserProfile> list =  jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(UserProfile.class));
		return list;
	}

	
//	public Object getRequestedDetail(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	public RequestBean getRequestedDetail(String reqId) {
		
		String query = "SELECT rqh.request_ID" + 
				"	,rqh.requestType_ID" + 
				"	,rt.requestType_Name" + 
				"	,rqh.checkToolBefore_ID " + 
				"	,rqh.checkToolAfter_ID  " + 
				"	,rqh.attachFile       " + 
				"	,rqh.afterComment       " + 
				"	,rqh.afterDescription   " + 
				"	,rqh.startTime          " + 
				"	,rqh.finishTime         " + 
				"	,rqh.confirmJudment     " + 
				"	,rqh.concernQA ,  rqh.maintenanceType" + 
				"	,rqh.requestApproveBy " +
				"	,rqh.requestSectionBy " +
				"	,rqh.repairSectionBy  " +
				"	,rqh.repairPersonBy   " +
				"	,rqh.confirmRepairBy  " +
				"	,rqh.qaApproveBy      " +
				"	,rqh.achApproveBy     " +
				"	,rqh.status requestStatus ,misc.value1 as status_name" + 
				"	, CASE WHEN rqh.createBy <> 'System' THEN usr.FIRST_NAME_TH + ' ' + usr.LAST_NAME_TH ELSE 'System' END  CreateBy" + 
				"	,rqh.createDate , sec.section_ID,  sec.section_name " +
				"	,loc.location_ID , loc.location_name , rqh.beforeDetail " +
				"   FROM tb_RequestHeader rqh" + 
				"	LEFT JOIN tb_RequestType rt on rqh.requestType_ID = rt.requestType_ID" + 
				"	LEFT JOIN tbm_misc_data misc on rqh.status = misc.misc_code AND misc.misc_type = 'ApplicationStatus'" + 
				"	LEFT JOIN tb_Section sec on sec.section_ID = rqh.section_ID " + 
				"	LEFT JOIN tb_location loc on loc.location_ID = rqh.location_ID " + 
				"	LEFT JOIN adm_user_profile usr on rqh.user_ID =   CONVERT(VARCHAR(50),usr.user_ID) " + 
				"   WHERE  rqh.request_ID =  ? ";
		
		List<RequestBean> list = jdbcTemplate.query(query,new Object[] { reqId }, REQUEST_MAPPER_DETAIL );
		return (list!=null&&list.size()>0)? list.get(0): new RequestBean();
	}


	
	public ResponseResult requestUpdate(HttpServletRequest httpRequest, RequestBean requested) {
		
		ResponseResult responseResult = new ResponseResult();
		
		System.out.println(" Update request : "+requested);

		try {
			
			/**-- Send Email ---*/
			/*String mailStatus = RequestConstants.MAIL_STATUS.NO_SENT;
			if(RequestConstants.REQUEST_STATUS.WAIT_APPROVE.equals(requested.getRequestStatus())
				|| RequestConstants.REQUEST_STATUS.APPROVE.equals(requested.getRequestStatus())
				|| RequestConstants.REQUEST_STATUS.CANCEL.equals(requested.getRequestStatus())
				|| RequestConstants.REQUEST_STATUS.WAIT_SEND_TO_USER.equals(requested.getRequestStatus())){
				
				boolean isSendmail  = sendEmail(requested);
				if(isSendmail){
					mailStatus = RequestConstants.MAIL_STATUS.SUCCESS;
				}else{
					mailStatus = RequestConstants.MAIL_STATUS.FAIL;
				}
			}*/
			
			
			/**-- Update Request  ---*/
//			requested.setMailStatus(mailStatus);
			
			this.requestUpdate(requested);
			
			/**-- Insert History records ---*/
//			RequestedHistory history = new RequestedHistory(requested);
//			historyDao.insertHistory(history);
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		responseResult.setCode(RequestConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(RequestConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(requested);
		
		return responseResult;
	}
 
	
	public int requestUpdate(RequestBean rqt) {
		List param = new ArrayList();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE tb_RequestHeader ");
		sql.append(" SET ");
		sql.append("  status  = ?	 ");
		sql.append(" ,updateBy = ? ");
		sql.append(" ,updateDate = GETDATE() ");
		
		param.add(rqt.getRequestStatus());
		param.add(rqt.getUpdateBy());
		
		// Section Approve (LD Up)
		if(RequestConstants.REQUEST_STATUS.APPROVE_LV1.equals(rqt.getRequestStatus())){
			sql.append(", requestSectionBy  = ?  ");
			param.add(rqt.getUpdateBy());
		}
		
		//Repair Section Approve (ACH Up)
		if(RequestConstants.REQUEST_STATUS.APPROVE_LV2.equals(rqt.getRequestStatus())){
			sql.append(", repairSectionBy  = ?  ");
			param.add(rqt.getUpdateBy());
		}

		// Repair Person  
		if(RequestConstants.REQUEST_STATUS.APPROVE_LV3.equals(rqt.getRequestStatus())){
			
			sql.append(", repairPersonBy  = ?  ");
			sql.append(", checkToolBefore_ID    = ?  ");     
			sql.append(", checkToolAfter_ID     = ?  ");     
			sql.append(", attachFile          = ?  ");     
			sql.append(", afterComment          = ?  ");     
			sql.append(", afterDescription      = ?  ");     
			sql.append(", startTime             = ?  ");     
			sql.append(", finishTime            = ?  ");     
			sql.append(", concernQA             = ?  ");     
//			sql.append(", confirmJudment        = ?  ");     
			sql.append(", maintenanceType             = ?  ");     
			
			param.add(rqt.getUpdateBy());
			param.add(rqt.getCheckToolBefore_ID());
			param.add(rqt.getCheckToolAfter_ID());
			param.add(rqt.getAttachFile());
			param.add(rqt.getAfterComment());
			param.add(rqt.getAfterDescription());
			param.add(rqt.getStartTime());
			param.add(rqt.getFinishTime());
//			param.add(rqt.getConfirmJudment());
			param.add(rqt.getConcernQA());
			param.add(rqt.getMaintenanceType());

		}
		
		 // Request Section (LD up)
		if(RequestConstants.REQUEST_STATUS.APPROVE_LV4.equals(rqt.getRequestStatus())){
			sql.append(", confirmRepairBy  = ?  ");
			param.add(rqt.getUpdateBy());
		}
		// QA Approve
		if(RequestConstants.REQUEST_STATUS.APPROVE_LV5.equals(rqt.getRequestStatus())){
			sql.append(", qaApproveBy  = ?  ");
			param.add(rqt.getUpdateBy());
			
			sql.append(", confirmJudment   = ?  "); 
			param.add(rqt.getConfirmJudment());
		}
		// Repair Section (ACH up)
		if(RequestConstants.REQUEST_STATUS.COMPLETE.equals(rqt.getRequestStatus())){
			sql.append(", achApproveBy  = ?  ");
			param.add(rqt.getUpdateBy());
			
			
		}    
		
		
		sql.append(" WHERE ");
		sql.append("   request_ID = ? ");
		
		param.add(rqt.getRequest_ID());
		
		int updateRecord = jdbcTemplate.update(sql.toString(), param.toArray() );
		return updateRecord;
	}
	
	public ResponseResult repairSave(RepairDetail repairDetail) {
		/*List paramList = new ArrayList();
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	    paramList.add(new SqlParameter(Types.VARCHAR));
	   jdbcTemplate.call(new CallableStatementCreator() {
	        @Override
	        public CallableStatement createCallableStatement(Connection con) throws SQLException {
	            CallableStatement cstmt = con.prepareCall("{call sp_Request_Insert(?,?,?,?,?,?,?,?,?,?)}");
	            cstmt.setString(1, repairDetail.getRequest_ID());
                cstmt.setString(2, repairDetail.getPart_ID());
                cstmt.setString(3, repairDetail.getPart_qty());
                cstmt.setString(4, repairDetail.getPart_price());
                cstmt.setString(5, repairDetail.getOther_cost());
                cstmt.setString(6, repairDetail.getTotal_cost());
                if (repairDetail.getUpdateBy() == null) {
                        repairDetail.setUpdateBy("System");
                }
                cstmt.setString(7,repairDetail.getUpdateBy());
	            return cstmt;
	        }
	    }, paramList);*/
		
		List param = new ArrayList();
		param.add(repairDetail.getRequest_ID());
        param.add(repairDetail.getPart_ID());
        param.add(repairDetail.getPart_qty());
        param.add(repairDetail.getPart_price());
        param.add(repairDetail.getOther_cost());
        param.add(repairDetail.getTotal_cost());
        param.add(repairDetail.getUpdateBy());
		int updateRecord = jdbcTemplate.update("{call sp_RepairDetail_Insert(?,?,?,?,?,?,?)}", param.toArray() );

		
		ResponseResult responseResult = new ResponseResult();
			
		responseResult.setCode(RequestConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(RequestConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(repairDetail);
		
		return responseResult;
			
	}


	public DataTableAjax<RepairDetail> getRepairPart(RepairDetail bean) {
		String query = " select rd.* , pm.part_Name from tb_RepairDetail rd"
				+ " left join tb_PartMaster pm on pm.part_ID = rd.part_ID"
				+ " where rd.request_ID = ? ";
		List list = jdbcTemplate.queryForList(query,new Object[] { bean.getRequest_ID() } );
		
		DataTableAjax<RepairDetail> listrequest = new DataTableAjax<RepairDetail>();
		int total = list!=null? list.size():0;
		listrequest.setRecordsTotal(total);
		listrequest.setRecordsFiltered(total);
		listrequest.setData(list);
		
		return listrequest;
	}
 

}
