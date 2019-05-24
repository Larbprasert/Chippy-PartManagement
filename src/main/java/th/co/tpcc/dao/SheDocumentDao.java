
package th.co.tpcc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.tpcc.model.SheDocument;

@Repository("sheDocumentDao")
public class SheDocumentDao extends AbstractCommonJdbcDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildSelectStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   id ");
		sql.append("   ,file_real_name ");
		sql.append("   ,file_name ");
		sql.append("   ,description ");
		sql.append("   ,type ");
		sql.append("   ,content ");
		sql.append("   ,owner_id ");
		sql.append("   ,course_id ");
		sql.append(" FROM she_document");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO she_document ( ");
		sql.append("   file_real_name ");
		sql.append("   ,file_name ");
		sql.append("   ,description ");
		sql.append("   ,type ");
		sql.append("   ,content ");
		sql.append("   ,owner_id ");
		sql.append("   ,course_id ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,?) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE she_document ");
		sql.append(" SET ");
		sql.append("   file_real_name = ? ");
		sql.append("   ,file_name = ? ");
		sql.append("   ,description = ? ");
		sql.append("   ,type = ? ");
		sql.append("   ,content = ? ");
		sql.append(" WHERE ");
		sql.append("   id = ? ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM she_document ");
		sql.append(" WHERE ");
		sql.append("   id = ? ");
		return sql.toString();
	}

	public List<SheDocument> selectAll() {
		List<SheDocument> resultList = jdbcTemplate.query(SQL_SELECT,
				BeanPropertyRowMapper.newInstance(SheDocument.class));
		return resultList;
	}

	public SheDocument selectById(Long id) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   id = ? ");
	   List<SheDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(SheDocument.class), new Object[] {id });
       return  list!=null&& list.size()>0? list.get(0):new SheDocument() ;
	}
	
	public List<SheDocument> select(Long cid , Long ownId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE 1=1 ");
		List obj = new ArrayList();
		if(null!=cid){
			sql.append("  and course_id = ? ");
			obj.add(cid);
		}else if(null!=ownId){
			sql.append("  and owner_id = ? ");
			obj.add(ownId);
		}else{
			return new ArrayList<SheDocument>();
		}
		List<SheDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(SheDocument.class), obj.toArray()) ;
		return  list ;
	}
	
//	public List<SheDocument>  selectByClaimId(Integer claimId) {
//		StringBuilder sql = new StringBuilder();
//		sql.append(SQL_SELECT);
//		sql.append(" WHERE ");
//		sql.append("   CLAIM_ID = ? ");
//		List<SheDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(SheDocument.class), new Object[] {claimId });
//		return  list;
//	}

	public int insert(SheDocument SheDocument) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { SheDocument.getFileRealName(), SheDocument.getFileName(), 
						SheDocument.getDescription(),
						SheDocument.getType()
						 , SheDocument.getContent() 
						 , SheDocument.getOwnerId()
						 , SheDocument.getCourseId()
						});
		SheDocument.setId(insertRecord);
		return insertRecord.intValue();
	}

	public int update(SheDocument SheDocument) {
		int updateRecord = jdbcTemplate
				.update(SQL_UPDATE,
						new Object[] { SheDocument.getFileRealName(), SheDocument.getFileName(),
								SheDocument.getDescription(), SheDocument.getType(), SheDocument.getContent(),
								SheDocument.getId() });
		return updateRecord;
	}

	public int delete(Long id) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { id });
		return deleteRecord;
	}

}
