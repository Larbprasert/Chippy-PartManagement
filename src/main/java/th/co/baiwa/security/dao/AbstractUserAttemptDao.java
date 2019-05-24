package th.co.baiwa.security.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.security.entity.UserAttempt;

abstract class AbstractUserAttemptDao extends AbstractCommonJdbcDao {

	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildSelectStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   user_attempt_id ");
		sql.append("   ,username ");
		sql.append("   ,attempts ");
		sql.append("   ,last_modified ");
		sql.append(" FROM adm_user_attempt");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO adm_user_attempt ( ");
		sql.append("   username ");
		sql.append("   ,attempts ");
		sql.append("   ,last_modified ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,GETDATE()) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE adm_user_attempt ");
		sql.append(" SET ");
		sql.append("   username = ? ");
		sql.append("   ,attempts = ? ");
		sql.append("   ,last_modified = GETDATE() ");
		sql.append(" WHERE ");
		sql.append("   user_attempt_id = ? ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM adm_user_attempt ");
		sql.append(" WHERE ");
		sql.append("   user_attempt_id = ? ");
		return sql.toString();
	}

	public List<UserAttempt> findAll() {
		List<UserAttempt> resultList = getJdbcTemplate().query(SQL_SELECT,
			BeanPropertyRowMapper.newInstance(UserAttempt.class)
		);
		return resultList;
	}

	public UserAttempt findById(Long userAttemptId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   user_attempt_id = ? ");
		UserAttempt result = getJdbcTemplate().queryForObject(sql.toString(),
			new Object[] {
				userAttemptId
			},
			BeanPropertyRowMapper.newInstance(UserAttempt.class)
		);
		return result;
	}

	public UserAttempt insert(UserAttempt userAttempt) {
		Long userAttemptId = executeInsert(SQL_INSERT,
			new Object[] {
				userAttempt.getUsername(),
				userAttempt.getAttempts()
//				userAttempt.getLastModified()
			}
		);
		userAttempt.setUserAttemptId(userAttemptId);
		return userAttempt;
	}

	public int update(UserAttempt userAttempt) {
		int updateRecord = getJdbcTemplate().update(SQL_UPDATE,
			new Object[] {
				userAttempt.getUsername(),
				userAttempt.getAttempts(),
//				userAttempt.getLastModified(),
				userAttempt.getUserAttemptId()
			}
		);
		return updateRecord;
	}

	public int delete(Long userAttemptId) {
		int deleteRecord = getJdbcTemplate().update(SQL_DELETE,
			new Object[] {
				userAttemptId
			}
		);
		return deleteRecord;
	}

}
