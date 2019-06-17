
package th.co.baiwa.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;

@Repository("userProfileDao")
public class UserProfileDao extends AbstractCommonJdbcDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   PROFILE_ID ");
        sql.append("   ,USER_ID ");
        sql.append("   ,TITLE ");
        sql.append("   ,FIRST_NAME_TH ");
        sql.append("   ,LAST_NAME_TH ");
        sql.append("   ,FIRST_NAME_EN ");
        sql.append("   ,LAST_NAME_EN ");
        sql.append("   ,GENDER ");
        sql.append("   ,MOBILE ");
        sql.append("   ,EMAIL ");
        sql.append("   ,ACTIVE_FLG ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append("   ,THEME_CODE ");
        sql.append("   ,COMPANY_CODE ");
        sql.append("   ,DEPT_CODE ");
        sql.append(" FROM adm_user_profile");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO adm_user_profile ( ");
        sql.append("   USER_ID ");
        sql.append("   ,TITLE ");
        sql.append("   ,FIRST_NAME_TH ");
        sql.append("   ,LAST_NAME_TH ");
        sql.append("   ,GENDER ");
        sql.append("   ,MOBILE ");
        sql.append("   ,EMAIL ");
        sql.append("   ,COMPANY_CODE ");
        sql.append("   ,DEPT_CODE ");
        sql.append("   ,ACTIVE_FLG ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,GETDATE()) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE adm_user_profile ");
        sql.append(" SET ");
        sql.append("   TITLE = ? ");
        sql.append("   ,FIRST_NAME_TH = ? ");
        sql.append("   ,LAST_NAME_TH = ? ");
        sql.append("   ,GENDER = ? ");
        sql.append("   ,MOBILE = ? ");
        sql.append("   ,EMAIL = ? ");
        sql.append("   ,COMPANY_CODE = ? ");
        sql.append("   ,DEPT_CODE = ? ");
        sql.append("   ,ACTIVE_FLG = ? ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append(" WHERE ");
        sql.append("   USER_ID = ? ");
        return sql.toString();
    }

//    private final static String buildSelectStatement() {
//        StringBuilder sql = new StringBuilder();
//        sql.append(" SELECT ");
//        sql.append("   PROFILE_ID ");
//        sql.append("   ,USER_ID ");
//        sql.append("   ,TITLE ");
//        sql.append("   ,FIRST_NAME_TH ");
//        sql.append("   ,LAST_NAME_TH ");
//        sql.append("   ,FIRST_NAME_EN ");
//        sql.append("   ,LAST_NAME_EN ");
//        sql.append("   ,GENDER ");
//        sql.append("   ,MOBILE ");
//        sql.append("   ,EMAIL ");
//        sql.append("   ,ACTIVE_FLG ");
//        sql.append("   ,CREATE_BY ");
//        sql.append("   ,CREATE_DATE ");
//        sql.append("   ,UPDATE_BY ");
//        sql.append("   ,UPDATE_DATE ");
//        sql.append("   ,FACTORY_ID ");
//        sql.append("   ,SECTION_ID ");
//        sql.append(" FROM tb_user_profile");
//        return sql.toString();
//    }
//
//    private final static String buildInsertStatement() {
//        StringBuilder sql = new StringBuilder();
//        sql.append(" INSERT INTO tb_user_profile ( ");
//        sql.append("   USER_ID ");
//        sql.append("   ,TITLE ");
//        sql.append("   ,FIRST_NAME_TH ");
//        sql.append("   ,LAST_NAME_TH ");
//        sql.append("   ,GENDER ");
//        sql.append("   ,MOBILE ");
//        sql.append("   ,EMAIL ");
//        sql.append("   ,FACTORY_ID ");
//        sql.append("   ,SECTION_ID ");
//        sql.append("   ,ACTIVE_FLG ");
//        sql.append("   ,CREATE_BY ");
//        sql.append("   ,CREATE_DATE ");
//        sql.append(" ) ");
//        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,GETDATE()) ");
//        return sql.toString();
//    }
//
//    private final static String buildUpdateStatement() {
//        StringBuilder sql = new StringBuilder();
//        sql.append(" UPDATE tb_user_profile ");
//        sql.append(" SET ");
//        sql.append("   TITLE = ? ");
//        sql.append("   ,FIRST_NAME_TH = ? ");
//        sql.append("   ,LAST_NAME_TH = ? ");
//        sql.append("   ,GENDER = ? ");
//        sql.append("   ,MOBILE = ? ");
//        sql.append("   ,EMAIL = ? ");
//        sql.append("   ,FACTORY_ID = ? ");
//        sql.append("   ,SECTION_ID = ? ");
//        sql.append("   ,ACTIVE_FLG = ? ");
//        sql.append("   ,UPDATE_BY = ? ");
//        sql.append("   ,UPDATE_DATE = GETDATE() ");
//        sql.append(" WHERE ");
//        sql.append("   USER_ID = ? ");
//        return sql.toString();
//    }
    
    
    

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM adm_user_profile ");
        sql.append(" WHERE ");
        sql.append("   PROFILE_ID = ? ");
        return sql.toString();
    }

    public List<UserProfile> selectAll() {
        List<UserProfile> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(UserProfile.class));
        return resultList;
    }

    public UserProfile selectById(Integer profileId) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   PROFILE_ID = ? ");
        UserProfile result = jdbcTemplate.queryForObject(sql.toString(), BeanPropertyRowMapper.newInstance(UserProfile.class), new Object[] {profileId });
        return result;
    }

	public int insert(UserProfile UserProfile) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { 
						UserProfile.getUserId(), 
						UserProfile.getTitle(), 
						UserProfile.getFirstNameTh(),
						UserProfile.getLastNameTh(), 
//						UserProfile.getFirstNameEn(), 
//						UserProfile.getLastNameEn(),
						UserProfile.getGender(), 
						UserProfile.getMobile(), 
						UserProfile.getEmail(),
						UserProfile.getCompanyCode(),
						UserProfile.getDeptCode(),
						UserProfile.getActiveFlg(), 
						UserProfile.getCreateBy()
						});
		return insertRecord.intValue();
	}

	public int update(UserProfile UserProfile) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { 
						UserProfile.getTitle(), 
						UserProfile.getFirstNameTh(),
						UserProfile.getLastNameTh(), 
//						UserProfile.getFirstNameEn(), 
//						UserProfile.getLastNameEn(),
						UserProfile.getGender(), 
						UserProfile.getMobile(), 
						UserProfile.getEmail(),
						UserProfile.getCompanyCode(),
						UserProfile.getDeptCode(),
						UserProfile.getActiveFlg(),
						UserProfile.getUpdateBy(),
						UserProfile.getUserId()
						});
		return updateRecord;
	}

    public int delete(Integer profileId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {profileId });
        return deleteRecord;
    }

}
