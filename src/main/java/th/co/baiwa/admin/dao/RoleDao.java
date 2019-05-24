package th.co.baiwa.admin.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.Role;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;

@Repository("roleDao")
public class RoleDao extends AbstractCommonJdbcDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildSelectStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   ROLE_ID ");
		sql.append("   ,ROLE_CODE ");
		sql.append("   ,ROLE_DESC ");
		sql.append("   ,ACTIVE_FLG ");
		sql.append("   ,CREATE_BY ");
		sql.append("   ,CREATE_DATE ");
		sql.append("   ,UPDATE_BY ");
		sql.append("   ,UPDATE_DATE ");
		sql.append(" FROM adm_role where ACTIVE_FLG = 'Y' order by ROLE_ID, ROLE_CODE ");
		return sql.toString();
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO adm_role ( ");
		sql.append("   ROLE_CODE ");
		sql.append("   ,ROLE_DESC ");
		sql.append("   ,ACTIVE_FLG ");
		sql.append("   ,CREATE_BY ");
		sql.append("   ,CREATE_DATE ");
		sql.append("   ,UPDATE_BY ");
		sql.append("   ,UPDATE_DATE ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,?) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE adm_role ");
		sql.append(" SET ");
		sql.append("   ROLE_CODE = ? ");
		sql.append("   ,ROLE_DESC = ? ");
		sql.append("   ,ACTIVE_FLG = ? ");
		sql.append("   ,CREATE_BY = ? ");
		sql.append("   ,CREATE_DATE = ? ");
		sql.append("   ,UPDATE_BY = ? ");
		sql.append("   ,UPDATE_DATE = ? ");
		sql.append(" WHERE ");
		sql.append("   ROLE_ID = ? ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM adm_role ");
		sql.append(" WHERE ");
		sql.append("   ROLE_ID = ? ");
		return sql.toString();
	}

	public List<Role> selectAll() {
		List<Role> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(Role.class));
		return resultList;
	}

	public Role selectById(Integer roleId) {
		StringBuilder sql = new StringBuilder();
		sql.append(SQL_SELECT);
		sql.append(" WHERE ");
		sql.append("   ROLE_ID = ? ");
		Role result = jdbcTemplate.queryForObject(sql.toString(), BeanPropertyRowMapper.newInstance(Role.class),
				new Object[] { roleId });
		return result;
	}

	public int insert(Role role) {
		int insertRecord = jdbcTemplate.update(SQL_INSERT,
				new Object[] { role.getRoleCode(), role.getRoleDesc(), role.getActiveFlg(),
						role.getCreateBy(), role.getCreateDate(), role.getUpdateBy(),
						role.getUpdateDate() });
		return insertRecord;
	}

	public int update(Role role) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { role.getRoleCode(), role.getRoleDesc(), role.getActiveFlg(),
						role.getCreateBy(), role.getCreateDate(), role.getUpdateBy(), role.getUpdateDate(),
						role.getRoleId() });
		return updateRecord;
	}

	public int delete(Integer roleId) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { roleId });
		return deleteRecord;
	}
}
