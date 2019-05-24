
package th.co.tpcc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.tpcc.model.SheDept;
import th.co.tpcc.model.InvDocument;

@Repository("invDocumentDao")
public class InvDocumentDao extends AbstractCommonJdbcDao {
	
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
		sql.append("   ,claim_id ");
		sql.append("   ,file_name ");
		sql.append("   ,description ");
		sql.append("   ,type ");
		sql.append("   ,content ");
		sql.append(" FROM inv_document");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO inv_document ( ");
		sql.append("   claim_id ");
		sql.append("   ,file_name ");
		sql.append("   ,description ");
		sql.append("   ,type ");
//		sql.append("   ,content ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE inv_document ");
		sql.append(" SET ");
		sql.append("   claim_id = ? ");
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
		sql.append(" DELETE FROM inv_document ");
		sql.append(" WHERE ");
		sql.append("   id = ? ");
		return sql.toString();
	}

	public List<InvDocument> selectAll() {
		List<InvDocument> resultList = jdbcTemplate.query(SQL_SELECT,
				BeanPropertyRowMapper.newInstance(InvDocument.class));
		return resultList;
	}

	public InvDocument selectById(Long id) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   id = ? ");
	   List<InvDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(InvDocument.class), new Object[] {id });
       return  list!=null&& list.size()>0? list.get(0):new InvDocument() ;
	}
	
	public List<InvDocument>  selectByClaimId(Integer claimId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   CLAIM_ID = ? ");
		List<InvDocument> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(InvDocument.class), new Object[] {claimId });
		return  list;
	}

	public int insert(InvDocument invDocument) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { invDocument.getClaimId(), invDocument.getFileName(), 
						invDocument.getDescription(),
						invDocument.getType()
						// , invDocument.getContent() 
						});
		invDocument.setId(insertRecord);
		return insertRecord.intValue();
	}

	public int update(InvDocument invDocument) {
		int updateRecord = jdbcTemplate
				.update(SQL_UPDATE,
						new Object[] { invDocument.getClaimId(), invDocument.getFileName(),
								invDocument.getDescription(), invDocument.getType(), invDocument.getContent(),
								invDocument.getId() });
		return updateRecord;
	}

	public int delete(Long id) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { id });
		return deleteRecord;
	}

}
