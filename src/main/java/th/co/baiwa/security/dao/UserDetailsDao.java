package th.co.baiwa.security.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.User;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.SectionBean;

@Repository("userDetailsDao")
public class UserDetailsDao extends AbstractCommonJdbcDao {
	
	// --------------------------------------------------
	// User
	// --------------------------------------------------
	public User findByUsername(String username) {
		logger.info("findByUsername username={}", username);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   user_id, username, password, enabled, account_non_expired, ");
		sql.append("   credentials_non_expired, account_non_locked ");
		sql.append(" FROM adm_user ");
		sql.append(" WHERE active_flg = 'Y' ");
		sql.append("   AND username = ? ");
		
		User user = executeQueryForObject(sql.toString(),
			new Object[] {
				username
			},
			new RowMapper<User>() {
				@Override
				public User mapRow(ResultSet rs, int rowNum) throws SQLException {
					User user = new User();
					user.setUserId(rs.getLong("user_id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setEnabled(rs.getString("enabled"));
					user.setAccountNonExpired(rs.getString("account_non_expired"));
					user.setCredentialsNonExpired(rs.getString("credentials_non_expired"));
					user.setAccountNonLocked(rs.getString("account_non_locked"));
					return user;
				}
			}
		);
		
		if (user == null) {
			logger.warn("Can not find data in ADM_USER with username: " + username);
		}else{
			user.setProfile(findProfile(user.getUserId().toString())); // Set Profile Here!!
		}
		
		return user;
	}
	
	public UserProfile findProfile(String userId) {
		logger.info("findProfile userId={}", userId);
		
		StringBuilder sql = new StringBuilder();
//		sql.append(" SELECT p.*  ");
//		sql.append("  , dbo.GetParamDesc(p.COMPANY_CODE,'COMPANY','TH')    COMPANY_NAME   ");
//		sql.append("  , dbo.GetParamDesc(p.DEPT_CODE,'DEPARTMENT','TH')    DEPT_NAME   ");
//		sql.append(" FROM adm_user_profile p ");
//		sql.append(" WHERE  p.user_id = ? ");

		sql.append(" SELECT p.*  ");
		sql.append("  ,b.section_name   ");
		sql.append("  ,c.dept_ID,c.dept_name ");
		sql.append(" FROM adm_user_profile p ");
		sql.append(" LEFT JOIN tb_Section b ON p.section_ID = b.section_ID COLLATE database_default ");
		sql.append(" LEFT JOIN tb_department c ON b.dept_ID = c.dept_ID COLLATE database_default ");
		sql.append(" WHERE  p.user_id = ? ");
		
		
		UserProfile profile = executeQueryForObject(sql.toString(),
			new Object[] {
					userId
			},
			new RowMapper<UserProfile>() {
				@Override
				public UserProfile mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserProfile user = new UserProfile();
					
					SectionBean section = new SectionBean();
					DepartmentBean department = new DepartmentBean();
					
					user.setUserId(rs.getString("user_id"));
					user.setTitle(rs.getString("title"));
					user.setFirstNameTh(rs.getString("first_name_th"));
					user.setLastNameTh(rs.getString("last_name_th"));
					user.setFirstNameEn(rs.getString("first_name_en"));
					user.setLastNameEn(rs.getString("last_name_en"));
					user.setGender(rs.getString("gender"));
					user.setMobile(rs.getString("mobile"));
					user.setEmail(rs.getString("email"));
					user.setActiveFlg(rs.getString("active_flg"));
					user.setThemeCode(rs.getString("theme_code"));
					
//					user.setCompanyCode(rs.getString("COMPANY_CODE"));
//					user.setCompanyName(rs.getString("COMPANY_NAME"));
//					user.setDeptCode(rs.getString("DEPT_CODE"));
//					user.setDeptName(rs.getString("DEPT_NAME"));
					
					section.setSection_ID(rs.getString("section_ID"));
					section.setSection_name(rs.getString("section_name"));
					user.setSection(section);

					department.setDept_ID(rs.getString("dept_ID"));
					department.setDept_name(rs.getString("dept_name"));
					user.setDepartment(department);
										
					return user;
				}
			}
		);
		
		if (profile == null) {
			profile = new UserProfile();
		}
		
		return profile;
	}
	
	
	// --------------------------------------------------
	// GrantedAuthority
	// --------------------------------------------------
	public List<GrantedAuthority> findGrantedRoleByUserId(Long userId) {
		logger.info("findGrantedRoleByUserId userId={}", userId);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ar.role_code ");
		sql.append(" FROM adm_user_role aur ");
		sql.append(" INNER JOIN adm_role ar ON ar.role_id = aur.role_id ");
		sql.append("   AND ar.active_flg = 'Y' ");
		sql.append(" WHERE   aur.user_id = ? ");
		
		List<GrantedAuthority> grantedRoleList = executeQuery(sql.toString(),
			new Object[] {
				userId
			},
			new RowMapper<GrantedAuthority>() {
				@Override
				public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
					return new SimpleGrantedAuthority(rs.getString("role_code"));
				}
			}
		);
		
		return grantedRoleList;
	}
	
	public List<GrantedAuthority> findGrantedOperationByUserId(Long userId) {
		logger.info("findGrantedOperationByUserId userId={}", userId);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ao.operation_code ");
		sql.append(" FROM adm_user_operation auo ");
		sql.append(" INNER JOIN adm_operation ao ON AO.OPERATION_ID = AUO.OPERATION_ID ");
		sql.append("   AND AO.active_flg = 'Y' ");
		sql.append(" WHERE AUO.active_flg = 'Y' ");
		sql.append("   AND AUO.USER_ID = ? ");
		
		List<GrantedAuthority> grantedOperationList = executeQuery(sql.toString(),
			new Object[] {
				userId
			},
			new RowMapper<GrantedAuthority>() {
				@Override
				public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
					return new SimpleGrantedAuthority(rs.getString("operation_code"));
				}
			}
		);
		
		return grantedOperationList;
	}
	
}
