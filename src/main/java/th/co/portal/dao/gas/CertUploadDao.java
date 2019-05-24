
package th.co.portal.dao.gas;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.portal.model.gas.CertDocument;

@Repository("certUploadDao")
public class CertUploadDao extends AbstractCommonJdbcDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildSelectStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT *  FROM SHE_DOCUMENT_CERT ");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO SHE_DOCUMENT_CERT ( ");
		sql.append("  FILE_ID        ");
		sql.append(" , EQ_ID          ");
		sql.append(" , FILE_NAME      ");
		sql.append(" , FILE_TYPE      ");
		sql.append(" , FILE_SIZE      ");
		sql.append(" , FILE_DESC      ");
		sql.append(",CREATE_BY        ");
		sql.append(",CREATE_DATE      ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,?, GETDATE() ) ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM SHE_DOCUMENT_CERT ");
		sql.append(" WHERE ");
		sql.append("   ID = ? ");
		return sql.toString();
	}

	public List<CertDocument> selectAll() {
		List<CertDocument> resultList = jdbcTemplate.query(SQL_SELECT,
				BeanPropertyRowMapper.newInstance(CertDocument.class));
		return resultList;
	}

	public CertDocument selectById(Long id) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   id = ? ");
	   List<CertDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(CertDocument.class), new Object[] {id });
       return  list!=null&& list.size()>0? list.get(0):new CertDocument() ;
	}
	
	public List<CertDocument> select( Long eqId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE 1=1 ");
		List obj = new ArrayList();
		if(null!=eqId){
			sql.append("  and id = ? ");
			obj.add(eqId);
		}else{
			return new ArrayList<CertDocument>();
		}
		List<CertDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(CertDocument.class), obj.toArray()) ;
		return  list ;
	}
	
	 public int insert(CertDocument bean) {
			Long insertRecord = executeInsert(SQL_INSERT,
					new Object[] { 
							bean.getFileId(),
							bean.getEqId(),
							bean.getFileName(),
							bean.getFileType(),
							bean.getFileSize(),
							bean.getFileDesc(),
							bean.getCreateBy()
							});
			bean.setId(insertRecord.intValue());
	        return insertRecord.intValue();
	    }


	public int delete(Long id) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { id });
		return deleteRecord;
	}

}
