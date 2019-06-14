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

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.RequestBean;
import th.co.keihin.model.RequestTypeBean;
import th.co.keihin.model.SectionBean;

@Repository("requestService")
public class RequestService {

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
			
			request.setstatus_name(rs.getString("status"));
			request.setCreateBy(rs.getString("tmpCreateBy"));
			
		    java.util.Date utilDate = new java.util.Date();
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		    System.out.println("utilDate:" + utilDate);
		    System.out.println("sqlDate:" + sqlDate);

		
		    request.setCreateDate(rs.getDate("createDate"));
			
		    return request;
		}
	};
	
	public void requestSave(RequestBean request) {
		// TODO Auto-generated method stub
				
	
			System.out.println("RequestType ID : " + request.getRequestType().getRequestType_ID());
			System.out.println("Status : " + request.getStatus() );
			
			System.out.println("Section : " + request.getLocation().getLocation_ID());
			System.out.println("Before Detail : " + request.getbeforeDetail());
			System.out.println("Before Picture : " + request.getbeforePicture());
			
	
//			CallableStatement cstmt = con.prepareCall("{call sp_Request_Insert(?,?,?,?,?,?,?,?,?,?)}");
			
	}
	
	public void repairSave(RequestBean request) {
		// TODO Auto-generated method stub
				
	
			System.out.println("RequestType ID : " + request.getRequestType().getRequestType_ID());
			System.out.println("Status : " + request.getStatus() );
			
			System.out.println("Section : " + request.getLocation().getLocation_ID());
			System.out.println("Before Detail : " + request.getbeforeDetail());
			System.out.println("Before Picture : " + request.getbeforePicture());
			
	
//			CallableStatement cstmt = con.prepareCall("{call sp_Request_Insert(?,?,?,?,?,?,?,?,?,?)}");
			
	}

	public DataTableAjax<RequestBean> getAll() {
		// TODO Auto-generated method stub
		
		DataTableAjax<RequestBean> listrequest = new DataTableAjax<RequestBean>();
		
		String query = "SELECT rqh.request_ID" + 
				"	,rqh.requestType_ID" + 
				"	,rt.requestType_Name" + 
				"	,misc.value1 as status" + 
				"	,CASE WHEN rqh.createBy <> 'System' THEN usr.name + ' ' + usr.surname ELSE 'System' END tmpCreateBy" + 
				"	,rqh.createDate" +
				"   FROM tb_RequestHeader rqh" + 
				"	LEFT JOIN tb_RequestType rt on rqh.requestType_ID = rt.requestType_ID" + 
				"	LEFT JOIN tbm_misc_data misc on rqh.status = misc.misc_code AND misc.misc_type = 'ApplicationStatus'" + 
				"	LEFT JOIN tb_User usr on rqh.user_ID = usr.user_ID AND usr.activeFlag = 1" + 
				"   WHERE 1=1 " ;//+ 
				//"	AND rqh.status <> 7";
		
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
		
		System.out.println(query);
		
		List<RequestBean> list = jdbcTemplate.query(query,REQUEST_MAPPER);
		
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

}
