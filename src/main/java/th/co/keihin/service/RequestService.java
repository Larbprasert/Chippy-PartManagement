package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.dao.UserDao;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.UserBean;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.baiwa.common.util.EmailUtils;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.keihin.constant.RequestConstants;
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.MachineBean;
import th.co.keihin.model.RepairDetail;
import th.co.keihin.model.RequestBean;
import th.co.keihin.model.RequestTypeBean;
import th.co.keihin.model.SectionBean;
import th.co.portal.model.gas.ResponseResult;
import th.co.tpcc.model.SysParam;

@Repository("requestService")
public class RequestService extends AbstractCommonJdbcDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private UserDao userDao; 

	
	private RowMapper REQUEST_MAPPER = new RowMapper(){
		
		@Override
		public RequestBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			RequestBean request = new RequestBean();
			LocationBean location = new LocationBean();
			SectionBean section = new SectionBean();
			DepartmentBean department = new DepartmentBean();
			RequestTypeBean requestType = new RequestTypeBean();

			MachineBean machine = new MachineBean();

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
			
			MachineBean machine = new MachineBean();
			
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
			
//			location.setLocation_ID(rs.getString("location_id"));
//			location.setLocation_name(rs.getString("location_name"));
//			request.setLocation(location);
			
			machine.setMachine_ID(rs.getString("machine_id"));
			machine.setMachine_name(rs.getString("machine_name"));
			request.setMachine(machine);
			
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

			request.setRequestApprove(rs.getString("requestApprove"));
			request.setRequestSection(rs.getString("requestSection"));
			request.setRepairSection(rs.getString("repairSection"));
			request.setRepairPerson(rs.getString("repairPerson"));
			request.setConfirmRepair(rs.getString("confirmRepair"));
			request.setQaApprove(rs.getString("qaApprove"));
			request.setAchApprove(rs.getString("achApprove"));
			
			request.setUser_ID(rs.getString("user_ID"));
			request.setCreateDate(rs.getDate("createDate"));
			request.setCreateDateStr(DateUtils.get_yyyymmdd_hhmmss_en_from_date(rs.getTimestamp("createDate")));
			request.setInformDate(DateUtils.get_yyyyMMdd_from_date(rs.getTimestamp("createDate")));
			request.setInformTime(DateUtils.get_hhmmss_from_date(rs.getTimestamp("createDate")));

			request.setRepairDate(DateUtils.get_yyyyMMdd_from_date(rs.getDate("repairDate")));
			
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
			rqt.setRequestStatus(RequestConstants.REQUEST_STATUS.CREATED);
			
			jdbcTemplate.update(SQL_INSERT_REQ,
				new Object[] {
					rqt.getRequest_ID(), rqt.getRequestType().getRequestType_ID(), 
					rqt.getUserProfile().getUserId() , rqt.getUserProfile().getSection().getSection_ID(),
					
//					rqt.getLocation().getLocation_ID(),rqt.getBeforeDetail(),
					rqt.getMachine().getMachine_ID(),rqt.getBeforeDetail(),
					
					rqt.getRequestStatus(),
					rqt.getCreateBy() ,
					rqt.getCreateBy() 
				});
			
			
			if(StringUtils.isNotEmpty(rqt.getFileId())){
				String updateFile = " UPDATE tb_document_upload SET req_id = '"+reqNo+"' Where id in ("+rqt.getFileId()+")";
				jdbcTemplate.update(updateFile);
			}
				
			boolean isSendmail  = sendEmail(rqt);
	}
	
	protected final static String SQL_INSERT_REQ = buildInsertREQ();
	private final static String buildInsertREQ() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO tb_RequestHeader ( ");
		
		sql.append(" request_ID         ");
		sql.append(", requestType_ID       "); 
		sql.append(", user_ID              "); 
		sql.append(", section_ID           "); 
		
//		sql.append(", location_ID          ");
		sql.append(", machine_ID          ");
		
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
		
		UserBean user = UserLoginUtils.getCurrentUser();
//		Stream<GrantedAuthority> ustream = user.getAuthorities().stream();
        if(null!=user && !user.getAuthorities().stream().anyMatch(
        		ro -> ro.getAuthority().contains(RequestConstants.ROLE.ROLE_ADMIN))){
        	
        	if(user.getAuthorities().stream().anyMatch( ro -> ro.getAuthority().contains(RequestConstants.ROLE.ROLE_REQ_USER))){
        		sql.append(" AND rqh.user_id = ? ");
        		wh.add(String.valueOf(user.getUserId()));
        	}
        	else if( user.getAuthorities().stream().anyMatch( ro -> ro.getAuthority().contains(RequestConstants.ROLE.ROLE_REQ_MNG))||
        			user.getAuthorities().stream().anyMatch( ro -> ro.getAuthority().contains(RequestConstants.ROLE.ROLE_REQ_SUP))
        			){
        		sql.append(" AND rqh.section_ID = ?   ");
        		wh.add(user.getUserProfile().getUserProfile().getSection().getSection_ID());
        	}

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
				//**** New Query
				"   ,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.requestApproveBy COLLATE SQL_Latin1_General_CP1_CI_AS)) requestApprove " +
				"   ,rqh.requestSectionBy " +
				"   ,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.requestSectionBy COLLATE SQL_Latin1_General_CP1_CI_AS)) requestSection " +
				"	,rqh.repairSectionBy " +
				"	,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.repairSectionBy COLLATE SQL_Latin1_General_CP1_CI_AS)) repairSection " +
				"	,rqh.repairPersonBy  " +
				"	,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.repairPersonBy COLLATE SQL_Latin1_General_CP1_CI_AS)) repairPerson " +
				"	,rqh.confirmRepairBy " +
				"	,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.confirmRepairBy COLLATE SQL_Latin1_General_CP1_CI_AS)) confirmRepair " +
				"	,rqh.qaApproveBy " +      	
				"	,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.qaApproveBy COLLATE SQL_Latin1_General_CP1_CI_AS)) qaApprove " +
				"	,rqh.achApproveBy " +
				"	,(select title + ' ' + first_name_th + ' ' + last_name_th from adm_user_profile where 1=1 and user_id = (select user_id from adm_user where 1=1 and username = rqh.achApproveBy COLLATE SQL_Latin1_General_CP1_CI_AS)) achApprove " +				
				
//				"	,rqh.requestSectionBy " +
//				"	,rqh.repairSectionBy  " +
//				"	,rqh.repairPersonBy   " +
//				"	,rqh.confirmRepairBy  " +
//				"	,rqh.qaApproveBy      " +
//				"	,rqh.achApproveBy     " +
//**** New Query

				"   ,rqh.user_id   	  " +
				"	,rqh.status requestStatus ,misc.value1 as status_name" + 
				"	, CASE WHEN rqh.createBy <> 'System' THEN usr.FIRST_NAME_TH + ' ' + usr.LAST_NAME_TH ELSE 'System' END  CreateBy" + 
				"	,rqh.createDate , sec.section_ID,  sec.section_name " +
				
//				"	,loc.location_ID , loc.location_name , rqh.beforeDetail " +
				"	,mac.machine_ID , mac.machine_name , rqh.beforeDetail " +

				"	,rqh.repairDate " +

				"   FROM tb_RequestHeader rqh" + 
				"	LEFT JOIN tb_RequestType rt on rqh.requestType_ID = rt.requestType_ID" + 
				"	LEFT JOIN tbm_misc_data misc on rqh.status = misc.misc_code AND misc.misc_type = 'ApplicationStatus'" + 
				"	LEFT JOIN tb_Section sec on sec.section_ID = rqh.section_ID " + 
				
//				"	LEFT JOIN tb_location loc on loc.location_ID = rqh.location_ID " + 
				"	LEFT JOIN tb_machine mac on mac.machine_ID = rqh.machine_ID COLLATE SQL_Latin1_General_CP1_CI_AS " +

				"	LEFT JOIN adm_user_profile usr on rqh.user_ID =   CONVERT(VARCHAR(50),usr.user_ID) " + 
				"   WHERE  rqh.request_ID =  ? ";
		
		List<RequestBean> list = jdbcTemplate.query(query,new Object[] { reqId }, REQUEST_MAPPER_DETAIL );

//		System.out.println(query);
		
		return (list!=null&&list.size()>0)? list.get(0): new RequestBean();
	}

	
	
	public boolean sendEmail(RequestBean requested){
		
        try{
        	
//			buildEmail(requested);
			
			InternetAddress[] addressTo = requested.getAddressTo();
			InternetAddress[] addressCC = requested.getAddressCC();
			
//			System.out.println("addressTo : "+addressTo);
//			System.out.println("addressCC : "+addressCC);
			
			String templateSub = "[Approve] Request Number : {request_ID}";
			String templateBody  = ""
//					+ "<p><strong>Dear Users,</strong></p> "
//					+ "<p style=\"margin-left: 25px;\">"
					+ "<ul> "
					+ "<li><strong>Request No.</strong> : {request_ID}</li> "
					+ "<li><strong>Request Status</strong> : {requestStatus}</li> "
					+ "<li><strong>Request Type</strong> : {requestType}</li> "
//					+ "<li><strong>Description</strong> : {description}</li>"
					+ "</ul> "
					+ "<p style=\"margin-left: 30px;\"> Link URL : <a href=\"http://{url}\">  View Request  </a></p> "
					+ "</br>";
			
			
//			String reqUserEmail = requested.getUserProfile().getEmail();
			requested = getRequestedDetail(requested.getRequest_ID());
			UserProfile userCreate =  userDao.getById(requested.getUser_ID());
			String reqUserEmail = userCreate.getEmail();
			
			if(RequestConstants.REQUEST_STATUS.CANCEL.equals(requested.getRequestStatus())){
				templateSub = templateSub.replace("Approve", "Cancel");
				InternetAddress[] toMail = {  new InternetAddress(reqUserEmail)  };
				addressTo = toMail;
			}else if(RequestConstants.REQUEST_STATUS.CREATED.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_REQ_MNG , requested.getUserProfile().getSection().getSection_ID());
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.APPROVE_LV1.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_MT_MNG , null);
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.APPROVE_LV2.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_MT_STAFF , null);
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.APPROVE_LV3.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_REQ_MNG , requested.getUserProfile().getSection().getSection_ID());
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.APPROVE_LV4.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_QA , null);
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.APPROVE_LV5.equals(requested.getRequestStatus())){
				List<UserProfile> userList = findUserByRoleSec(RequestConstants.ROLE.ROLE_MT_MNG , null);
				addressTo = buildToEmail(userList);
				InternetAddress[] ccMail= {  new InternetAddress(reqUserEmail)  };
				addressCC  = ccMail;
			}else if(RequestConstants.REQUEST_STATUS.COMPLETE.equals(requested.getRequestStatus())){
				templateSub = templateSub.replace("Approve", "Complete");
				InternetAddress[] toMail = {  new InternetAddress(reqUserEmail)  };
				addressTo = toMail;
			}
			
			SysParam MAIL_HOST_URL = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","MAIL_HOST_URL");
			String url = MAIL_HOST_URL.getValue_2(); //  http://localhost:9000/KEIHINPortal/
			url +=  "/request/requested_edit/"+requested.getRequest_ID();
        	
//        	System.out.println("url : "+url);
        	
//			SysParam headerTemp = ApplicationCache.getParamGroupValue("EMAIL_CONFIG", templateSub);
//			SysParam bodyTemp = ApplicationCache.getParamGroupValue("EMAIL_CONFIG", templateBody);
	
//			Requested _requested = getRequestedDetail(requested.getId()+"");
//			
//			String subj = headerTemp.getValue_2();
//			String body = bodyTemp.getValue_2();
			
		
			
			String subj = templateSub.replaceAll("\\{request_ID\\}", requested.getRequest_ID());
			String body = templateBody;
			body = body.replaceAll("\\{request_ID\\}", requested.getRequest_ID())
			.replaceAll("\\{requestStatus\\}", requested.getStatus_name()!=null? requested.getStatus_name():"")
			.replaceAll("\\{requestType\\}", (requested.getRequestType()==null && requested.getRequestType().getRequestType_name()==null)? "": requested.getRequestType().getRequestType_name())
//			.replaceAll("\\{description\\}", _requested.getPurpose()==null? "":_requested.getPurpose())
			.replaceAll("\\{url\\}", url);
			 
//			System.out.println(body);

			
			boolean suc = EmailUtils.sendEmail(addressTo, addressCC, subj, body);
			return suc;
		
        } catch (Exception e) {
			e.printStackTrace();
			return false;
        }
	
	}
	
	private InternetAddress[] buildToEmail(List<UserProfile> users) throws AddressException{
		List<InternetAddress> toList = new ArrayList<InternetAddress>();
		for (UserProfile usr : users) {
			if(usr.getEmail()!=null){
				toList.add(new InternetAddress(usr.getEmail()));
			}
		}
		InternetAddress[] addressTo =  new InternetAddress[toList.size()];
		return toList.toArray(addressTo);
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
			
//			String mailStatus = RequestConstants.MAIL_STATUS.NO_SENT;
			
			/**-- Update Request  ---*/
//			requested.setMailStatus(mailStatus);
			
			this.requestUpdate(requested);
			
			boolean isSendmail  = sendEmail(requested);
			
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

			sql.append(", repairDate             = ?  ");     
			
			param.add(rqt.getUpdateBy());
			param.add(rqt.getCheckToolBefore_ID());
			param.add(rqt.getCheckToolAfter_ID());
			param.add(rqt.getAttachFile());
			param.add(rqt.getAfterComment());
			param.add(rqt.getAfterDescription());
			param.add(rqt.getStartTime());
			param.add(rqt.getFinishTime());
			param.add(rqt.getConcernQA());
			param.add(rqt.getMaintenanceType());

			param.add(rqt.getRepairDate());

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

	public ResponseResult repairDel(RepairDetail repairDetail) {
		List param = new ArrayList();
		param.add(repairDetail.getRequest_ID());
		param.add(repairDetail.getRepairDetail_ID());
        param.add(repairDetail.getUpdateBy());
		int updateRecord = jdbcTemplate.update("{call sp_RepairDetail_Delete(?,?,?)}", param.toArray() );

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


	public ResponseResult getDashBoard(RequestBean bean) {
		ResponseResult responseResult = new ResponseResult();
		
		String query = " select (select count(*) as rCount from tb_RequestHeader where 1=1 and status = 1) as 'Create' "+
		 "    ,(select count(*) as rCount from tb_RequestHeader where 1=1 and (status <> 1 and status <> 7 and status <> 99)) as 'On_Process'"+
		 "    ,(select count(*) as rCount from tb_RequestHeader where 1=1 and status in(7,99)) as 'Complete' "+
		 "    ,(select count(*) as rCount from tb_RequestHeader where 1=1) as 'Summary' ";
		 
		Map<String, Object> result =  jdbcTemplate.queryForMap(query);
		
//		String querytop ""                                                             ";
		
		String querytop =" SELECT TOP 5 rd.part_id , pm.part_name, SUM(rd.part_qty) total_use, rd.part_price, SUM(rd.other_cost) other_cost, SUM(rd.total_cost) total_cost "   +
		//"    ,MONTH(rd.createDate) AS [Month]"   +
		"    ,YEAR(rd.createDate) AS [Year]"   +
		" FROM tb_repairdetail rd"   +
		" LEFT JOIN tb_partmaster pm ON rd.part_id = pm.part_id"   +
		" WHERE 1=1"   +
		" AND YEAR(rd.createDate) = YEAR(GETDATE())"   +
		" GROUP BY"   +
		//"     MONTH(rd.createDate)" ,  +
		"     YEAR(rd.createDate)"   +
		"     ,rd.part_id , pm.part_name,rd.part_price"   +
		" ORDER BY rd.part_id"  ;
		
		List<Map<String, Object>> result_top =  jdbcTemplate.queryForList(querytop);
		
		String querytype = 
			" SELECT rh.requesttype_id, rt.requesttype_name , CAST((COUNT(rh.requesttype_id) * 100.0 / (SELECT COUNT(*) FROM tb_RequestHeader)) AS DECIMAL(18, 2)) AS Percentage  "+
			" FROM tb_RequestHeader rh"+
			" LEFT JOIN tb_requesttype rt ON rh.requesttype_id = rt.requesttype_id"+
			" WHERE 1=1"+
			" GROUP BY rh.requesttype_id, rt.requesttype_name";
			 
				
		List<Map<String, Object>> result_ty =  jdbcTemplate.queryForList(querytype);
		
		
		Map dsmap = new HashMap();
		
		dsmap.put("request_count", result);
		dsmap.put("part_top_5", result_top);
		dsmap.put("request_type",result_ty);
		
		
		responseResult.setCode(RequestConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(RequestConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(dsmap);
		return responseResult;
		
	}
 

}
