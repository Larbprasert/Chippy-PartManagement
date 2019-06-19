package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.RequestBean;
import th.co.keihin.model.RequestTypeBean;
import th.co.keihin.model.SectionBean;

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
			
			request.setrequest_ID(rs.getString("request_ID"));
			
			requestType.setRequestType_ID(rs.getString("requestType_ID"));
			requestType.setRequestType_name(rs.getString("requestType_name"));
			request.setRequestType(requestType);
			
//			request.setrequestType_ID(rs.getString("requestType_ID"));
//			request.setrequestType_name(rs.getString("requestType_name"));
			
			request.setRequestStatus(rs.getString("requestStatus"));
			request.setstatus_name(rs.getString("status_name"));
			request.setCreateBy(rs.getString("tmpCreateBy"));
			
		    java.util.Date utilDate = new java.util.Date();
//		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		    System.out.println("utilDate:" + utilDate);
//		    System.out.println("sqlDate:" + sqlDate);

		
		    request.setCreateDate(rs.getDate("createDate"));
		    request.setCreateDateStr(DateUtils.get_ddmmyyyyhhmmss_from_date(rs.getTimestamp("createDate")));

			
		    return request;
		}
	};
	
	 
	public String genNextReqNo() {
	      String jobNo = jdbcTemplate.queryForObject(" SELECT dbo.GetRequestNo() jobNo " , String.class);
	      return jobNo!=null? jobNo:"XXXX" ;
	}

		
	public void requestSave(RequestBean rqt) {
				
			String reqNo =genNextReqNo(); //  Get Req No from DB ;
			rqt.setrequest_ID(reqNo);
			
			jdbcTemplate.update(SQL_INSERT_REQ,
				new Object[] {
					rqt.getrequest_ID(), rqt.getRequestType().getRequestType_ID(), 
					rqt.getUserProfile().getUserId() , rqt.getUserProfile().getSection().getSection_ID(),
					rqt.getLocation().getLocation_ID(),rqt.getbeforeDetail(),
					"1",
					rqt.getCreateBy() 
				});
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
		
		sql.append(", createBy        ");
		sql.append(", createDate      ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?, ?,GETDATE(),GETDATE(),?,?, ?,GETDATE() ) ");
		return sql.toString();
	}
	
	
	public void repairSave(RequestBean rqt) {
		
			
//			CallableStatement cstmt = con.prepareCall("{call sp_Request_Insert(?,?,?,?,?,?,?,?,?,?)}");
			
	}

	public DataTableAjax<RequestBean> getAll(RequestBean req) {
		// TODO Auto-generated method stub
		
		DataTableAjax<RequestBean> listrequest = new DataTableAjax<RequestBean>();
		
		String query = "SELECT rqh.request_ID" + 
				"	,rqh.requestType_ID" + 
				"	,rt.requestType_Name" + 
				"	,rqh.status requestStatus ,misc.value1 as status_name" + 
				"	, CASE WHEN rqh.createBy <> 'System' THEN usr.FIRST_NAME_TH + ' ' + usr.LAST_NAME_TH ELSE 'System' END  tmpCreateBy" + 
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
		if(StringUtils.isNotEmpty(req.getrequest_ID())){
			wh.add( "%"+req.getrequest_ID()+"%");
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
		
		System.out.println(sql.toString());
		
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
}
