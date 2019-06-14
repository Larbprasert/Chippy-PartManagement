package th.co.baiwa.admin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.User;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.constant.CommonConstants.FLAG;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.InvAsset;
import th.co.tpcc.model.SysParam;

@Repository("userDao")
public class UserDao extends AbstractCommonJdbcDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	protected final static String SQL_SELECT = buildSelectStatement();
	protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   USER_ID ");
        sql.append("   ,USERNAME ");
        sql.append("   ,PASSWORD ");
        sql.append("   ,ENABLED ");
        sql.append("   ,ACCOUNT_NON_EXPIRED ");
        sql.append("   ,CREDENTIALS_NON_EXPIRED ");
        sql.append("   ,ACCOUNT_NON_LOCKED ");
        sql.append("   ,ACTIVE_FLG ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append(" FROM adm_user");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO adm_user ( ");
        sql.append("   USERNAME ");
        sql.append("   ,PASSWORD ");
        sql.append("   ,ACTIVE_FLG ");
        sql.append("   ,CREATE_BY, CREATE_DATE");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,GETDATE()) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE adm_user ");
        sql.append(" SET ");
        sql.append("   ACTIVE_FLG = ? ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append(" WHERE ");
        sql.append("   USER_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM adm_user ");
        sql.append(" WHERE ");
        sql.append("   USER_ID = ? ");
        return sql.toString();
    }

    public int insert(UserProfile admUser) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { admUser.getUserName(),
						admUser.getPassword(),
						admUser.getActiveFlg(), 
						admUser.getCreateBy()
						});
        return insertRecord.intValue();
    }

    public int delete(Integer userId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {userId });
        return deleteRecord;
    }
	    
	public User findByUsername(String username) {
		logger.info("findByUsername username=" + username);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   user_id, username, password, enabled, account_non_expired, ");
		sql.append("   credentials_non_expired, account_non_locked, active_flg, version, create_by, ");
		sql.append("   create_date, update_by, update_date ");
		sql.append(" FROM adm_user ");
		sql.append(" WHERE username = ? ");
		sql.append("   AND active_flg = ? ");
		
		User user = executeQueryForObject(sql.toString(),
			new Object[] {
				username,
				FLAG.N_FLAG
			},
			User.class
		);

		return user;
	}
	
	public int update(User user) {
		logger.info("update user={}", user);
		
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE adm_user ");
        sql.append(" SET ");
        sql.append("   username = ? ");
        sql.append("   ,password = ? ");
        sql.append("   ,enabled = ? ");
        sql.append("   ,account_non_expired = ? ");
        sql.append("   ,credentials_non_expired = ? ");
        sql.append("   ,account_non_locked = ? ");
        sql.append("   ,active_flg = ? ");
        sql.append("   ,version = ? ");
        sql.append("   ,update_by = ? ");
        sql.append("   ,update_date = ? ");
        sql.append(" WHERE ");
        sql.append("   user_id = ? ");
        
        int numRowsAffected = executeUpdate(sql.toString(),
			new Object[] {
        		user.getUsername(),
        		user.getPassword(),
        		user.getEnabled(),
        		user.getAccountNonExpired(),
        		user.getCredentialsNonExpired(),
        		user.getAccountNonLocked(),
        		user.getIsDelete(),
        		user.getVersion(),
        		user.getUpdateBy(),
        		user.getUpdateDateStr(),
        		user.getUserId()
			}
		);
		
		logger.debug("Number of rows affected: {}", numRowsAffected);
		
		return numRowsAffected;
	}
	
	public int update(UserProfile user) {
		logger.info("update user={}", user);
		
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE adm_user ");
        sql.append(" SET active_flg = ? ");
        sql.append("   ,update_by = ? ");
        sql.append("   ,update_date = GETDATE() ");
        sql.append(" WHERE  user_id = ? ");
        
        int numRowsAffected = executeUpdate(sql.toString(),
			new Object[] {
        		user.getActiveFlg(),
        		user.getUpdateBy(),
        		user.getUserId()
			}
		);
		
		logger.debug("Number of rows affected: {}", numRowsAffected);
		
		return numRowsAffected;
	}
	
	public int updatePassword(UserProfile user) {
		logger.info("updatePassword user={}", user);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE adm_user ");
		sql.append(" SET  password = ?, update_by = ?, update_date = GETDATE() ");
		sql.append(" WHERE  user_id = ? ");
		
		int numRowsAffected = executeUpdate(sql.toString(),
				new Object[] {
						user.getPassword(),
						user.getUpdateBy(),
						user.getUserId()
		} );
		
		logger.debug("Number of rows affected: {}", numRowsAffected);
		
		return numRowsAffected;
	}

	public int updateUserTheme(Long userId, String theme) {
		logger.info("updateUserTheme user={}", theme);
		
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE adm_user_profile ");
        sql.append(" SET ");
        sql.append("   theme_code = ? ");
        sql.append(" WHERE ");
        sql.append("   user_id = ? ");
        
        int numRowsAffected = executeUpdate(sql.toString(),
			new Object[] { theme, userId }
		);
		
		logger.debug("Number of rows affected: {}", numRowsAffected);
		return numRowsAffected;
	}

	public DataTableAjax<UserProfile> queryUserList(UserProfile user) {
		DataTableAjax result = new DataTableAjax<>();
		logger.info("queryUserList");
	
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT   a.USERNAME,  b.*                                        ");
		sql.append("  , dbo.GetParamDesc(b.ACTIVE_FLG,'ACTIVE_TYPE','TH')    ACTIVE        ");
		sql.append("  , dbo.GetParamDesc(b.DEPT_CODE,'DEPARTMENT','TH')    DEPT_NAME        ");
		sql.append("   , ur.ROLES  , e.DESC_TH COMPANY_NAME FROM adm_user a                     ");
		sql.append(" LEFT JOIN adm_user_profile b                                     ");
		sql.append(" ON a.USER_ID = b.USER_ID                                         ");
		sql.append(" LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = b.COMPANY_CODE ");
//		sql.append(" JOIN  (SELECT a.USER_ID, GROUP_CONCAT(ROLE_DESC) ROLES  ");
//		sql.append(" 	FROM adm_user_role a, adm_role b                             ");
//		sql.append(" 	WHERE a.ROLE_ID = b.ROLE_ID GROUP BY a.USER_ID ORDER BY ROLE_CODE) ur           ");
		
		sql.append(" JOIN (   select a.USER_ID,                ");   
		sql.append("         ROLES = STUFF((                   ");   
		sql.append("            SELECT ', ' +  c.ROLE_DESC      ");   
		sql.append("            FROM adm_user_role b ,         ");   
		sql.append("             adm_role c                    ");   
		sql.append(" 			 WHERE c.ROLE_ID = b.ROLE_ID   ");   
		sql.append(" 			 and a.USER_ID = b.USER_ID     ");   
		sql.append("            FOR XML PATH('')               ");   
		sql.append("            ), 1, 1, '')                   ");   
		sql.append("             from adm_user a  ) ur         ");   
		
		sql.append(" ON a.USER_ID = ur.USER_ID           WHERE 1=1       ");
		
//		UserProfile profile = user.getProfile();
		List wh = new ArrayList<>();
		if(StringUtils.isNotEmpty(user.getUserName())){
			wh.add("%"+user.getUserName()+"%");
			sql.append(" AND a.USERNAME like ? ");
		}
		
		if(StringUtils.isNotEmpty(user.getFirstNameTh())){
			wh.add("%"+user.getFirstNameTh()+"%");
			wh.add("%"+user.getFirstNameTh()+"%");
			wh.add("%"+user.getFirstNameTh()+"%");
			wh.add("%"+user.getFirstNameTh()+"%");
			sql.append(" AND (  b.FIRST_NAME_TH like ? OR b.LAST_NAME_TH like ?  ");
			sql.append(" OR b.FIRST_NAME_EN like ? OR b.LAST_NAME_EN like ? ) ");
		} 
		
		if(StringUtils.isNotEmpty(user.getEmail())){
			wh.add("%"+user.getEmail()+"%");
			sql.append(" AND b.EMAIL like ? ");
		}
		
		if(StringUtils.isNotEmpty(user.getActiveFlg())){
			wh.add(user.getActiveFlg());
			sql.append(" AND b.ACTIVE_FLG = ? ");
		}
		
		if(StringUtils.isNotEmpty(user.getCompanyCode())){
			wh.add(user.getCompanyCode());
			sql.append(" AND b.COMPANY_CODE = ? ");
		}
		
		if(StringUtils.isNotEmpty(user.getDeptCode())){
			wh.add(user.getDeptCode());
			sql.append(" AND b.DEPT_CODE = ? ");
		}
		
		if(StringUtils.isNotEmpty(user.getRoleCode())){
			sql.append(" and exists                            ");
			sql.append(" (                                     ");
			sql.append("  SELECT xa.USER_ID                    ");
			sql.append("  FROM adm_user_role xa, adm_role xb   ");
			sql.append("  WHERE xa.ROLE_ID = xb.ROLE_ID        ");
			sql.append("  and xa.USER_ID = a.USER_ID           ");
			sql.append("  and xb.ROLE_ID =  '"+user.getRoleCode()+"'    ");
			sql.append(" )                                     ");
			
		}
		
		sql.append(" ORDER BY USER_ID, USERNAME DESC ");
		
//		System.out.println(sql.toString());
		 
		List<UserProfile> list = (List<UserProfile>) executeQuery(sql.toString(), wh.toArray(), SELECT_RM);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
	
	public List<UserProfile> queryUserAll() {
	
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT   a.USERNAME, b.*,                                        ");
//		sql.append("   dbo.GetParamDesc(b.ACTIVE_FLG,'ACTIVE_TYPE','TH')    ACTIVE        ");
		sql.append("   dbo.GetParamDesc(b.ACTIVE_FLG,'ACTIVE_TYPE','TH')    ACTIVE        ");  // SQLSVR
		sql.append("  , dbo.GetParamDesc(b.DEPT_CODE,'DEPARTMENT','TH')    DEPT_NAME        ");
		sql.append("   , ur.ROLES , e.DESC_TH COMPANY_NAME "
				+ " FROM adm_user a                  ");
		sql.append(" LEFT JOIN adm_user_profile b                                     ");
		sql.append(" ON a.USER_ID = b.USER_ID                                         ");
		sql.append(" LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = b.COMPANY_CODE ");
//		sql.append(" JOIN  (SELECT a.USER_ID, GROUP_CONCAT(ROLE_DESC) ROLES  ");
//		sql.append(" 	FROM adm_user_role a, adm_role b                             ");
//		sql.append(" 	WHERE a.ROLE_ID = b.ROLE_ID GROUP BY a.USER_ID ORDER BY ROLE_CODE) ur           ");
		
		sql.append(" JOIN (   select a.USER_ID,                ");   
		sql.append("         ROLES = STUFF((                   ");   
		sql.append("            SELECT ',' +  c.ROLE_DESC      ");   
		sql.append("            FROM adm_user_role b ,         ");   
		sql.append("             adm_role c                    ");   
		sql.append(" 			 WHERE c.ROLE_ID = b.ROLE_ID   ");   
		sql.append(" 			 and a.USER_ID = b.USER_ID     ");   
		sql.append("            FOR XML PATH('')               ");   
		sql.append("            ), 1, 1, '')                   ");   
		sql.append("             from adm_user a  ) ur         ");   
		 
		sql.append(" ON a.USER_ID = ur.USER_ID     WHERE b.ACTIVE_FLG = 'Y'    ");

		List<UserProfile> list = (List<UserProfile>) executeQuery(sql.toString(), SELECT_RM);
		return list;
	}
	
	private RowMapper SELECT_RM = new RowMapper(){
		@Override
		public UserProfile mapRow(ResultSet rs, int rowNum) throws SQLException {
//			
			UserProfile p = new UserProfile();
			p.setUserId(rs.getString("user_id"));
			p.setUserName(rs.getString("USERNAME"));
			p.setTitle(rs.getString("title"));
			p.setFirstNameTh(rs.getString("first_name_th"));
			p.setLastNameTh(rs.getString("last_name_th"));
			p.setFirstNameEn(rs.getString("first_name_en"));
			p.setLastNameEn(rs.getString("last_name_en"));
			p.setGender(rs.getString("gender"));
			p.setMobile(rs.getString("mobile"));
			p.setEmail(rs.getString("email"));
			p.setActiveFlg(rs.getString("ACTIVE"));
			p.setThemeCode(rs.getString("theme_code"));
			p.setCreateBy(rs.getString("CREATE_BY")); 
			p.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			p.setUpdateBy(rs.getString("UPDATE_BY")); 
			p.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE"))); 
			
			p.setRoleCode(rs.getString("ROLES"));
			p.setRoleName(rs.getString("ROLES"));
			
			p.setCompanyCode(rs.getString("COMPANY_CODE"));
			p.setCompanyName(rs.getString("COMPANY_NAME"));
			
			p.setDeptCode(rs.getString("DEPT_CODE"));
			p.setDeptName(rs.getString("DEPT_NAME"));
			
			return p;
		}
		
	};

	public boolean checkExist(String userName) {
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT USERNAME from adm_user WHERE USERNAME = '" + userName + "' ");
		List list = executeQueryForList(sql.toString());
		return list != null && list.size() > 0;
	}

	public UserProfile getById(String id) {
	        StringBuilder sql = new StringBuilder();
			sql.append(" SELECT   a.USERNAME, b.*,                                        ");
			sql.append("   dbo.GetParamDesc(b.ACTIVE_FLG,'ACTIVE_TYPE','TH')    ACTIVE        ");
			sql.append("  , dbo.GetParamDesc(b.DEPT_CODE,'DEPARTMENT','TH')    DEPT_NAME        ");
			sql.append("   , e.DESC_TH COMPANY_NAME                               ");
			sql.append("   , ur.ROLES FROM adm_user a                                 ");
			sql.append(" LEFT JOIN adm_user_profile b                                     ");
			sql.append(" ON a.USER_ID = b.USER_ID                                         ");
			sql.append(" LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = b.COMPANY_CODE ");
//			sql.append(" JOIN  (SELECT a.USER_ID, GROUP_CONCAT(a.ROLE_ID) ROLES  ");
//			sql.append(" 	FROM adm_user_role a, adm_role b                             ");
//			sql.append(" 	WHERE a.ROLE_ID = b.ROLE_ID GROUP BY a.USER_ID ORDER BY ROLE_CODE) ur           ");
			
			sql.append(" JOIN (   select a.USER_ID,                ");   
			sql.append("         ROLES = STUFF((                   ");   
			sql.append("            SELECT ',' + Convert(Varchar, c.ROLE_ID )    ");   
			sql.append("            FROM adm_user_role b ,         ");   
			sql.append("             adm_role c                    ");   
			sql.append(" 			 WHERE c.ROLE_ID = b.ROLE_ID   ");   
			sql.append(" 			 and a.USER_ID = b.USER_ID     ");   
			sql.append("            FOR XML PATH('')               ");   
			sql.append("            ), 1, 1, '')                   ");   
			sql.append("             from adm_user a  ) ur         ");   
			
			sql.append(" ON a.USER_ID = ur.USER_ID   WHERE a.USER_ID = ? ");
	        List<UserProfile> list = (List<UserProfile>) executeQuery(sql.toString(),new Object[] {id}, SELECT_RM);
	        return list!=null&&list.size()>0? list.get(0): new UserProfile();
	}
}
