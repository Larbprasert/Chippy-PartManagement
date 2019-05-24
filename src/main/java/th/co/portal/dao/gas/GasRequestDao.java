
package th.co.portal.dao.gas;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.portal.constant.GasConstants;
import th.co.portal.model.gas.Equipment;
import th.co.portal.model.gas.RequestList;
import th.co.portal.model.gas.Requested;

@Repository("GasRequesDao")
public class GasRequestDao extends AbstractCommonJdbcDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM she_equipment ");
		sql.append(" WHERE ");
		sql.append("   COURSE_ID = ? ");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO she_request ( ");
		sql.append(" EQUIPMENT_ID  	      ");
		sql.append(", JOB_NO  	      ");
		
		sql.append(", REQUEST_STATUS  	      ");
		sql.append(", COMPANY_CODE  	      ");
		sql.append(", DEPARTMENT_CODE          ");
		sql.append(", REQUESTER_ID  	      ");
		
		sql.append(", AGENT_NAME 		      ");
		sql.append(", OBJECTIVE_CODE     ");
		sql.append(", EQ_CODE      ");
//		sql.append(", SERIAL_NO       ");
		sql.append(", EQ_TYPE       ");
		sql.append(", PHONE       ");
		sql.append(", OBJECTIVE_OTHER       ");
		
//		sql.append(", OBJECTIVE_NAME  ");
//		sql.append(", COMPANY_NAME         ");
//		sql.append(", DEPARTMENT_NAME       ");
//		sql.append(", REQUESTEDNAME_NAME         ");
//		sql.append(", STATUS  	      ");
		
		sql.append(",CREATE_BY        ");
		sql.append(",CREATE_DATE      ");
		sql.append(" ) ");
		sql.append(" VALUES (?, dbo.GetJobNo() ,"
				+ " ?,?,?,?,"
				+ " ?,?,?,?,?,?,  "
				+ " ?,GETDATE() ) ");
		return sql.toString();
	}

	public int insertRequest(Requested rqt) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] {
					rqt.getEquipmentId(), rqt.getRequestStatus(), rqt.getCompanyCode(), rqt.getDepartmentCode(), rqt.getRequesterId(),
					rqt.getAgentName(), rqt.getObjectiveCode(), rqt.getEqCode(),  rqt.getEqType(),  rqt.getPhone(), rqt.getObjectiveName(),
					rqt.getCreateBy() 
				});
		return insertRecord.intValue();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE she_request ");
		sql.append(" SET ");
		sql.append("  REQUEST_STATUS  = ?	 ");
		sql.append(" ,UPDATE_DATE = GETDATE() ");
		sql.append(" ,UPDATE_BY = ? ");
		sql.append(" WHERE ");
		sql.append("   ID = ? ");
		return sql.toString();
	} 
	
	public int updateRequest(Requested rqt) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE, new Object[] {  rqt.getRequestStatus(), rqt.getUpdateBy(), rqt.getId() });
		return updateRecord;
	}

	public List<Equipment> getDataPersonalEquipmentCreate(String userIds) {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT a.*  FROM she_equipment a  WHERE 1=1 ");
		sql.append(" AND  a.AREA_REP+',' LIKE ?  ");
		sql.append(" AND  a.STATUS =  '"+GasConstants.FLAG.Y_FLAG+"' ");
		sql.append(" AND  a.EQ_TYPE = '"+GasConstants.EQUIPMENT_TYPE.GAS_DETECTOR+"' ");
		sql.append(" AND  dbo.GetEquipStatus(a.ID) =  '"+GasConstants.REQUEST_STATUS.COMPLETE+"' ");
		
//		Select MAX(ID) FROM she_request sr where  sr.REQUEST_STATUS IN ('CP','CN') ;
		
		List<Equipment> list = jdbcTemplate.query(sql.toString(),new Object[] { "%"+userIds+",%" },DB_ROW_MAPPER );
		return list!=null? list:new  ArrayList<Equipment>();
	}

	
	public List<RequestList> getRequestList(RequestList req) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select se.*   ");
		sql.append(" , se.id EQ_ID  , sr.id REQ_ID ");
		sql.append(" , sr.JOB_NO  , sr.OBJECTIVE_CODE, sr.REQUEST_STATUS ");
		sql.append(" , sr.CREATE_BY CREATE_BY_SR  , sr.CREATE_DATE CREATE_DATE_SR  ");
		sql.append(" , sr.UPDATE_BY UPDATE_BY_SR  , sr.UPDATE_DATE UPDATE_DATE_SR  ");
		 sql.append(" , dbo.GetParamDesc(se.DEPT_CODE,'DEPARTMENT','TH')  DEPT_NAME  ");
		 sql.append(" , dbo.GetParamDesc(se.EQ_TYPE,'EQUIPMENT_TYPE','TH')  EQ_TYPE_NAME  ");
		 sql.append(" , dbo.GetParamDesc(sr.REQUEST_STATUS,'REQUEST_STATUS','TH') REQUEST_STATUS_NAME    ");
		 sql.append(" , dbo.GetParamDesc(sr.OBJECTIVE_CODE,'REQUEST_PURPOSE','TH') OBJECTIVE_NAME    ");
		sql.append("  From she_request sr");
		sql.append(" left join she_equipment se on se.EQ_CODE = sr.EQ_CODE  ");
		sql.append("  where 1=1   ");
		
		
//		sql.append(" AND  a.AREA_REP LIKE ?  ");
		
//		List<Equipment> list = jdbcTemplate.query(sql.toString(),new Object[] { util },DB_ROW_MAPPER );
		List<RequestList> list = jdbcTemplate.query(sql.toString(),DB_ROW_MAPPER_REQUESTLIST );
		return list!=null? list:new  ArrayList();
	}
	
	
	
	
	/*public List<RequestList> getJobLastNo() {
		StringBuilder sql = new StringBuilder();

		sql.append(" SELECT MAX(JOB_NO) as JOB_NO FROM she_request  ");
	
		List<RequestList> list = jdbcTemplate.query(sql.toString(),DB_ROW_MAPPER_GET_JOBNO );
		
		return list;
	}*/
	

	
	private RowMapper<RequestList> DB_ROW_MAPPER_GET_JOBNO = new RowMapper<RequestList>() {
		@Override
		public RequestList mapRow(ResultSet rs, int rowNum) throws SQLException {
			RequestList m = new RequestList();
			
			m.setJobNo(rs.getString("JOB_NO"));

			return m;
		}
	};

	
	public Requested getRequestedDetail(String id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select se.* , sr.*   ");
		sql.append(" , se.id EQ_ID  , sr.id REQ_ID ");
//		sql.append(" , sr.JOB_NO  , sr.OBJECTIVE_CODE, sr.REQUEST_STATUS ");
		sql.append(" , sr.CREATE_BY CREATE_BY_SR  , sr.CREATE_DATE CREATE_DATE_SR  ");
		sql.append(" , sr.UPDATE_BY UPDATE_BY_SR  , sr.UPDATE_DATE UPDATE_DATE_SR  ");
		 sql.append(" , dbo.GetParamDesc(sr.COMPANY_CODE,'COMPANY','TH')  COMPANY_NAME  ");
		 sql.append(" , dbo.GetParamDesc(se.DEPT_CODE,'DEPARTMENT','TH')  DEPT_NAME  ");
		 sql.append(" , dbo.GetParamDesc(se.EQ_TYPE,'EQUIPMENT_TYPE','TH')  EQ_TYPE_NAME  ");
		 sql.append(" , dbo.GetParamDesc(sr.REQUEST_STATUS,'REQUEST_STATUS','TH') REQUEST_STATUS_NAME    ");
//		 sql.append(" , dbo.GetParamDesc(sr.OBJECTIVE_CODE,'REQUEST_PURPOSE','TH') OBJECTIVE_NAME    ");
		sql.append("  From she_request sr ");
		sql.append(" left join she_equipment se on se.EQ_CODE = sr.EQ_CODE  ");
		sql.append("  where   sr.id = ? ");
		
		
		List<Requested> list = jdbcTemplate.query(sql.toString(),new Object[] { id }, REQ_DETAIL_MAPPER );
		return (list!=null&&list.size()>0)? list.get(0): new Requested();
	}
	
	
	private RowMapper<Requested> REQ_DETAIL_MAPPER = new RowMapper<Requested>() {
		@Override
		public Requested mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			/** Requested */
			Requested m = new Requested();
			m.setRequesterId(rs.getString("REQ_ID"));
			m.setEquipmentId(rs.getInt("EQ_ID"));
			m.setJobNo(rs.getString("JOB_NO"));
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setCompanyName(rs.getString("COMPANY_NAME"));
			m.setDepartmentCode(rs.getString("DEPT_CODE"));
			m.setDepartmentName(rs.getString("DEPT_NAME"));
			
			/** Equipment */
			Equipment eq = new Equipment();
			eq.setEqCode(rs.getString("EQ_CODE"));
			eq.setEqTypeCode(rs.getString("EQ_TYPE"));
			eq.setEqTypeName(rs.getString("EQ_TYPE_NAME"));
			eq.setSerialNo(rs.getString("SERIAL_NO"));
			eq.setModel(rs.getString("MODEL"));
			eq.setBrand(rs.getString("BRAND"));
			m.setEquipment(eq);
			
			m.setObjectiveCode(rs.getString("OBJECTIVE_CODE"));
			m.setObjectiveName(rs.getString("OBJECTIVE_OTHER"));
			
			
			m.setRequesterName(rs.getString("REQUESTER_ID"));
			m.setAgentName(rs.getString("AGENT_NAME"));
			m.setPhone(rs.getString("PHONE"));
			
//			m.setPurposeDesc(rs.getString("OBJECTIVE_NAME"));
//			m.setRequestStatusCode(rs.getString("REQUEST_STATUS"));
//			m.setRequestStatusDesc(rs.getString("REQUEST_STATUS_NAME"));
			
			m.setApproveType(rs.getString("APPROVE_TYPE"));
			m.setRemark(rs.getString("REQ_REMARK"));
			
			m.setApprove_by(rs.getString("APPROVE_BY"));
			m.setApprove_date(rs.getString("APPROVE_DATE"));
			m.setAcknow_by(rs.getString("ACKNOW_BY"));
			m.setAcknow_date(rs.getString("ACKNOW_DATE"));
			m.setShe_receive_by(rs.getString("SHE_RECEIVE_BY"));
			m.setShe_receive_date(rs.getString("SHE_RECEIVE_DATE"));
			m.setShe_send_no(rs.getString("SHE_SEND_NO"));
			m.setShe_send_vendor(rs.getString("SHE_SEND_VENDOR"));
			m.setShe_send_name(rs.getString("SHE_SEND_NAME"));
			m.setShe_send_date(rs.getString("SHE_SEND_DATE"));
			m.setVendor_sign_by(rs.getString("VENDOR_SIGN_BY"));
			m.setVendor_sign_date(rs.getString("VENDOR_SIGN_DATE"));
			m.setShe_sign_by(rs.getString("SHE_SIGN_BY"));
			m.setShe_sign_date(rs.getString("SHE_SIGN_DATE"));
			m.setComplete_req_by(rs.getString("COMPLETE_REQ_BY"));
			m.setComplete_req_date(rs.getString("COMPLETE_REQ_DATE"));

			m.setCreateBy(rs.getString("CREATE_BY_SR"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE_SR")));
			m.setCreateDate(rs.getDate("CREATE_DATE_SR"));

			m.setUpdateBy(rs.getString("UPDATE_BY_SR"));
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE_SR")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE_SR"));

			return m;
		}
	};
	
	private RowMapper<RequestList> DB_ROW_MAPPER_REQUESTLIST = new RowMapper<RequestList>() {
		@Override
		public RequestList mapRow(ResultSet rs, int rowNum) throws SQLException {
			RequestList m = new RequestList();
			m.setReqId(rs.getInt("REQ_ID"));
			m.setEqId(rs.getInt("EQ_ID"));
			m.setJobNo(rs.getString("JOB_NO"));
			m.setDeptCode(rs.getString("DEPT_CODE"));
			m.setDeptName(rs.getString("DEPT_NAME"));
			m.setEqCode(rs.getString("EQ_CODE"));
			m.setEqTypeCode(rs.getString("EQ_TYPE"));
			m.setEqTypeName(rs.getString("EQ_TYPE_NAME"));
			m.setSerialNo(rs.getString("SERIAL_NO"));
			m.setModel(rs.getString("MODEL"));
			m.setBrand(rs.getString("BRAND"));
			m.setPurposeCode(rs.getString("OBJECTIVE_CODE"));
			m.setPurposeDesc(rs.getString("OBJECTIVE_NAME"));
			m.setRequestStatusCode(rs.getString("REQUEST_STATUS"));
			m.setRequestStatusDesc(rs.getString("REQUEST_STATUS_NAME"));
			m.setCreateBy(rs.getString("CREATE_BY_SR"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE_SR")));
			m.setCreateDate(rs.getDate("CREATE_DATE_SR"));
			m.setUpdateBy(rs.getString("UPDATE_BY_SR"));
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE_SR")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE_SR"));

			return m;
		}
	};
	
	
	
	private RowMapper<Equipment> DB_ROW_MAPPER = new RowMapper<Equipment>() {
		@Override
		public Equipment mapRow(ResultSet rs, int rowNum) throws SQLException {
			Equipment m = new Equipment();
			m.setId(rs.getInt("ID"));
			m.setEqCode(rs.getString("EQ_CODE"));
			m.setEqTypeName(rs.getString("EQ_TYPE"));
			m.setSerialNo(rs.getString("SERIAL_NO"));
			m.setBrand(rs.getString("BRAND"));
			m.setModel(rs.getString("MODEL"));
			m.setStatus(rs.getString("STATUS"));
			m.setCreateBy(rs.getString("CREATE_BY"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE")));
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY"));
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));

			return m;
		}
	};
	
	 
	public String genNextJobNo() {
	      String jobNo = jdbcTemplate.queryForObject(" SELECT dbo.GetJobNo() jobNo " , String.class);
	      return jobNo!=null? jobNo:"XXXX" ;
	}


	
	 
}
