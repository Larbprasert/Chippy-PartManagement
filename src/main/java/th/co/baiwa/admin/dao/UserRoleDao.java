
package th.co.baiwa.admin.dao;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.AdmUserRole;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;

@Repository("userRoleDao")
public class UserRoleDao extends AbstractCommonJdbcDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO adm_user_role ( ");
		sql.append("    USER_ID ");
		sql.append("   ,ROLE_ID ");
		sql.append("   ,CREATE_BY ");
		sql.append("   ,CREATE_DATE ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,GETDATE()) ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM adm_user_role ");
		sql.append(" WHERE  USER_ID = ? ");
		return sql.toString();
	}

	public int insert(AdmUserRole admUserRole) {
		int insertRecord = jdbcTemplate.update(SQL_INSERT,
				new Object[] { admUserRole.getUserId(), 
						admUserRole.getRoleId(), 
						admUserRole.getCreateBy()
				});
		return insertRecord;
	}
	
	public void insert(UserProfile userProfile) {
		String roles = userProfile.getRoleCode();
		if(StringUtils.isNoneEmpty(roles)){
			String[] roleArr = roles.split(",");
			for (int i = 0; i < roleArr.length; i++) {
				insert(new AdmUserRole(Integer.parseInt(userProfile.getUserId()), Integer.parseInt(roleArr[i])));
			}
		}
	}

	public int delete(String userId) {
		int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] { userId });
		return deleteRecord;
	}

	public void update(UserProfile userProfile) {
		delete(userProfile.getUserId());
		String roles = userProfile.getRoleCode();
		if(StringUtils.isNoneEmpty(roles)){
			String[] roleArr = roles.split(",");
			for (int i = 0; i < roleArr.length; i++) {
				insert(new AdmUserRole(Integer.parseInt(userProfile.getUserId()), Integer.parseInt(roleArr[i])));
			}
		}
		
	}

}
