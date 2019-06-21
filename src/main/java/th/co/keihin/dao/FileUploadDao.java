
package th.co.keihin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.keihin.model.FileUploadBean;

@Repository("fileUploadDao")
public class FileUploadDao extends AbstractCommonJdbcDao {
	
	static String TABLE_NAME = " tb_document_upload ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildSelectStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT *  FROM "+TABLE_NAME);
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO    "+TABLE_NAME);
		sql.append(" ( FILE_ID        ");
		sql.append(" , REQ_ID          ");
		sql.append(" , TYPE          ");
		sql.append(" , FILE_NAME      ");
		sql.append(" , FILE_TYPE      ");
		sql.append(" , FILE_SIZE      ");
		sql.append(" , FILE_DESC      ");
		sql.append(",CREATE_BY        ");
		sql.append(",CREATE_DATE      ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,?,?, GETDATE() ) ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM   "+TABLE_NAME);
		sql.append(" WHERE ");
		sql.append("   ID = ? ");
		return sql.toString();
	}

	public List<FileUploadBean> selectAll() {
		List<FileUploadBean> resultList = jdbcTemplate.query(SQL_SELECT,
				BeanPropertyRowMapper.newInstance(FileUploadBean.class));
		return resultList;
	}

	public FileUploadBean selectById(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   id = ? ");
	   List<FileUploadBean> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(FileUploadBean.class), new Object[] {id });
       return  list!=null&& list.size()>0? list.get(0):new FileUploadBean() ;
	}
	
	public List<FileUploadBean> select( String eqId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE 1=1 ");
		List obj = new ArrayList();
		if(null!=eqId){
			sql.append("  and id = ? ");
			obj.add(eqId);
		}else{
			return new ArrayList<FileUploadBean>();
		}
		List<FileUploadBean> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(FileUploadBean.class), obj.toArray()) ;
		return  list ;
	}
	
	 public void insert(FileUploadBean bean) {
		 jdbcTemplate.update(SQL_INSERT,
					new Object[] { 
							bean.getFileId(),
							bean.getReqId(),
							bean.getType(),
							bean.getFileName(),
							bean.getFileType(),
							bean.getFileSize(),
							bean.getFileDesc(),
							bean.getCreateBy()
							});
//			bean.setId(insertRecord.intValue());
//	        return insertRecord.intValue();
	    }


	public int delete(String id) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { id });
		return deleteRecord;
	}
	
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public FileUploadBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			FileUploadBean m = new FileUploadBean();
			m.setId (rs.getString("ID"));
			m.setReqId (rs.getString("REQ_ID"));
			m.setType(rs.getString("TYPE"));
			m.setFileId (rs.getString("FILE_ID"));
			m.setFileName(rs.getString("FILE_NAME"));
			m.setFileType(rs.getString("FILE_TYPE"));
			m.setFileSize(rs.getString("FILE_SIZE"));
			m.setFileDesc(rs.getString("FILE_DESC"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			
			return m;
		}
    };
    
    public DataTableAjax<FileUploadBean> getFileList(FileUploadBean param) {
		logger.info("### getDataTable getFileList :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  ");
		 sql.append("   FROM  "+TABLE_NAME);
		 sql.append("   WHERE 1=1 ");
		
		List wh = new ArrayList<>();
//		 
//		if(StringUtils.isNotEmpty(param.getDeptCode())){
//			wh.add( param.getDeptCode() );
//			sql.append(" AND a.DEPT_CODE =  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getEqCode())){
//			sql.append(" AND a.EQ_CODE like  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getSerialNo())){
//			wh.add( "%"+param.getSerialNo()+"%");
//			sql.append(" AND a.SERIAL_NO like  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getEqTypeCode())){
//			wh.add( param.getEqTypeCode() );
//			sql.append(" AND a.EQ_TYPE =  ? ");
//		}
//		
		if(null!=param.getReqId()){
			wh.add( param.getReqId() );
			sql.append(" AND a.REQ_ID =  ? ");
		}
		
		sql.append(" ORDER BY CREATE_DATE DESC ");
		
//		System.out.println(sql.toString()); 
		
		List<FileUploadBean> list = (List<FileUploadBean>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
    

}
