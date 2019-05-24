
package th.co.tpcc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.CourseOwner;
import th.co.tpcc.model.Owner;

@Repository("ownerDao")
public class OwnerDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   OWNER_ID ");
        sql.append("   ,OWNER_CODE ");
        sql.append("   ,OWNER_TYPE ");
        sql.append("   ,GENDER ");
        sql.append("   ,FIRST_NAME ");
        sql.append("   ,LAST_NAME ");
        sql.append("   ,MOBILE ");
        sql.append("   ,OFFICE_PHONE ");
        sql.append("   ,EMAIL ");
        sql.append("   ,DEPT_CODE ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append("   ,STATUS as OWNER_STATUS,IMAGE ");
        sql.append("   ,WORK_START_DATE ");
        sql.append("   ,BIRTH_DATE ");
        sql.append("   ,COMPANY_CODE ");
        sql.append("   ,IMAGE ");
        sql.append(" FROM she_owner");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_owner ( ");
        sql.append("   OWNER_CODE ");
        sql.append("   ,OWNER_TYPE ");
        sql.append("   ,TITLE ");
        sql.append("   ,GENDER ");
        sql.append("   ,FIRST_NAME ");
        sql.append("   ,LAST_NAME ");
        sql.append("   ,MOBILE ");
        sql.append("   ,OFFICE_PHONE ");
        sql.append("   ,EMAIL ");
        sql.append("   ,DEPT_CODE ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,STATUS ");
        sql.append("   ,POSITION ");
//        sql.append("   ,IMAGE ");
        sql.append("   ,COMPANY_CODE ");
        sql.append("   ,WORK_START_DATE ");
        sql.append("   ,BIRTH_DATE ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,GETDATE(),?,?,?,?, convert(datetime, ? ,103),convert(datetime, ? ,103)) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_owner ");
        sql.append(" SET ");
        sql.append("   OWNER_CODE = ? ");
        sql.append("   ,OWNER_TYPE = ? ");
        sql.append("   ,TITLE = ? ");
        sql.append("   ,GENDER = ? ");
        sql.append("   ,FIRST_NAME = ? ");
        sql.append("   ,LAST_NAME = ? ");
        sql.append("   ,MOBILE = ? ");
        sql.append("   ,OFFICE_PHONE = ? ");
        sql.append("   ,EMAIL = ? ");
        sql.append("   ,DEPT_CODE = ? ");
        sql.append("   ,STATUS = ? ");
        sql.append("   ,POSITION = ? ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
//        sql.append("   ,IMAGE = ? ");
        sql.append("   ,COMPANY_CODE = ? ");
        sql.append("   ,WORK_START_DATE= convert(datetime, ? ,103) ");
        sql.append("   ,BIRTH_DATE= convert(datetime, ? ,103) ");
        sql.append(" WHERE ");
        sql.append("   OWNER_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM she_owner ");
        sql.append(" WHERE ");
        sql.append("   OWNER_ID = ? ");
        return sql.toString();
    }

    
    public List<Owner> selectAll() {
        List<Owner> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(Owner.class));
        return resultList;
    }

    
    public Owner selectById(Integer ownerId) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   OWNER_ID = ? ");
        Owner result = jdbcTemplate.queryForObject(sql.toString(), BeanPropertyRowMapper.newInstance(Owner.class), new Object[] {ownerId });
        return result;
    }

    
    public int insert(Owner owner) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { owner.getOwnerCode(), owner.getOwnerType(), owner.getTitle(),owner.getGender(),
						owner.getFirstName(), owner.getLastName(), owner.getMobile(),
						owner.getOfficePhone(), owner.getEmail(), owner.getDeptCode(),
//						owner.getCreateDate(), ** SET ON SQL
						owner.getCreateBy(),owner.getActiveFlg(),owner.getPosition()
//						owner.getOwnerImage()
						,owner.getCompanyCode() , owner.getWorkStartDate(), owner.getBirthDate()
						
						});
        return insertRecord.intValue();
    }
    
    private RowMapper she_owner_dt = new RowMapper(){
		@Override
		public Owner mapRow(ResultSet rs, int rowNum) throws SQLException {
			Owner m = new Owner();
			m.setOwnerId(rs.getInt("OWNER_ID"));
			m.setOwnerCode(rs.getString("OWNER_CODE"));
			m.setOwnerType(rs.getString("OWNER_TYPE_TH")); // OWNER_TYPE
//			m.setGender(rs.getString("GENDER_NAME")); // GENDER
			m.setFirstName(rs.getString("FIRST_NAME"));
			m.setLastName(rs.getString("LAST_NAME"));
			m.setMobile(rs.getString("MOBILE"));
			m.setOfficePhone(rs.getString("OFFICE_PHONE"));
			m.setEmail(rs.getString("EMAIL"));
			m.setDeptCode(rs.getString("DEPT_CODE"));
			m.setTitle(rs.getString("TITLE_NAME"));
			m.setTitleDesc(rs.getString("TITLE_DESC"));
			m.setDeptName(rs.getString("DEPT_NAME_TH"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
//			m.setCreateDate(rs.getDate("CREATE_DATE"));
//			m.setUpdateBy(rs.getString("UPDATE_BY"));
//			m.setUpdateDateStr(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
//			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			m.setActiveFlg(rs.getString("OWNER_STATUS"));
			m.setPosition(rs.getString("POSITION"));
			m.setPositionName(rs.getString("POSITION_NAME"));
//			m.setOwnerImage(rs.getBytes("IMAGE"));
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setCompanyName(rs.getString("COMPANY_NAME"));
//			m.setBirthDate(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("BIRTH_DATE")));
//			m.setWorkStartDate(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("WORK_START_DATE")));
//		    if(null!=m.getOwnerImage())
//			m.setOwnerImage64(Base64.getEncoder().encodeToString(m.getOwnerImage()));
			return m;
		}
		
	};
    
    
    private RowMapper she_owner_RM = new RowMapper(){
		@Override
		public Owner mapRow(ResultSet rs, int rowNum) throws SQLException {
			Owner m = new Owner();
			m.setOwnerId(rs.getInt("OWNER_ID"));
			m.setOwnerCode(rs.getString("OWNER_CODE"));
			m.setOwnerType(rs.getString("OWNER_TYPE_TH")); // OWNER_TYPE
//			m.setGender(rs.getString("GENDER_NAME")); // GENDER
			m.setFirstName(rs.getString("FIRST_NAME"));
			m.setLastName(rs.getString("LAST_NAME"));
			m.setMobile(rs.getString("MOBILE"));
			m.setOfficePhone(rs.getString("OFFICE_PHONE"));
			m.setEmail(rs.getString("EMAIL"));
			m.setDeptCode(rs.getString("DEPT_CODE"));
			m.setTitle(rs.getString("TITLE_NAME"));
			m.setTitleDesc(rs.getString("TITLE_DESC"));
			m.setDeptName(rs.getString("DEPT_NAME_TH"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY"));
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			m.setActiveFlg(rs.getString("OWNER_STATUS"));
			m.setPosition(rs.getString("POSITION"));
			m.setPositionName(rs.getString("POSITION_NAME"));
			m.setOwnerImage(rs.getBytes("IMAGE"));
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setCompanyName(rs.getString("COMPANY_NAME"));
			m.setBirthDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("BIRTH_DATE")));
			m.setWorkStartDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("WORK_START_DATE")));
		    if(null!=m.getOwnerImage())
			m.setOwnerImage64(Base64.getEncoder().encodeToString(m.getOwnerImage()));
			return m;
		}
		
	};

	public Owner getOwnerById(String ownerId) {  
		logger.info("### getOwnerById : "+ownerId);
		
		StringBuilder sql = new StringBuilder();
		sql.append("  SELECT a.*, a.STATUS as OWNER_STATUS , b.DESC_TH DEPT_NAME_TH ,  e.DESC_TH COMPANY_NAME , a.TITLE TITLE_NAME, dbo.GetParamDesc(a.TITLE  ,'TITLE','TH') TITLE_DESC , "
				+ "   p.DESC_TH  POSITION_NAME, b.DESC_EN DEPT_NAME_EN, a.GENDER GENDER_NAME, a.OWNER_TYPE OWNER_TYPE_TH FROM she_owner a , sys_param b, sys_param e , sys_param p ");
		sql.append(" WHERE a.DEPT_CODE = b.PARAM_CODE  and b.PARAM_TYPE = 'SECTION_MASTER' "
				+ " and a.POSITION = p.PARAM_CODE  and p.PARAM_TYPE = 'POSITION_MASTER' "
				+ " and a.COMPANY_CODE = e.PARAM_CODE  and e.PARAM_TYPE = 'COMPANY' "
				+ " and a.OWNER_ID = ? ");
		List<Owner> list = (List<Owner>) executeQuery(sql.toString(), new String[]{ownerId}, she_owner_RM);
		return list!=null&& list.size()>0? list.get(0):new Owner() ;
	}

	public DataTableAjax<Owner> getDataTable(Owner param) {
		logger.info("### getDataTable :xxxxxx ");
		
		DataTableAjax result = new DataTableAjax<>();
	
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT a.* ,dbo.GetParamDesc(a.STATUS ,'ACTIVE_TYPE','TH') OWNER_STATUS   "
				+ ", b.DESC_TH DEPT_NAME_TH , b.DESC_EN DEPT_NAME_EN "
				+ ", d.DESC_TH TITLE_NAME ,d.DESC_TH TITLE_DESC , f.DESC_TH POSITION_NAME, "
				+ " c.DESC_TH OWNER_TYPE_TH , e.DESC_TH COMPANY_NAME ");
		sql.append("  FROM SHE_OWNER a ");
		sql.append(" LEFT JOIN   sys_param b   ON b.PARAM_TYPE = 'SECTION_MASTER' AND b.PARAM_CODE = a.DEPT_CODE ");
		sql.append("  left join  sys_param c   ON c.PARAM_TYPE = 'OWNER_TYPE'  AND c.PARAM_CODE = a.OWNER_TYPE ");
		sql.append("  LEFT JOIN  sys_param d  ON d.PARAM_TYPE = 'TITLE'   AND d.PARAM_CODE = a.TITLE ");
		sql.append("  LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = a.COMPANY_CODE ");
		sql.append("  LEFT JOIN  sys_param f  ON f.PARAM_TYPE = 'POSITION_MASTER'   AND f.PARAM_CODE = a.POSITION ");
		sql.append(" WHERE 1=1 ");
		
		
		List wh = new ArrayList<>();
		
		if(StringUtils.isNotEmpty(param.getOwnerCode())){
			wh.add("%"+param.getOwnerCode()+"%");
			sql.append(" AND a.OWNER_CODE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getOwnerType())){
			wh.add(param.getOwnerType());
			sql.append(" AND a.OWNER_TYPE = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getGender())){
			wh.add(param.getGender());
			sql.append(" AND GENDER like = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getFirstName())){
			wh.add("%"+param.getFirstName()+"%");
			sql.append(" AND FIRST_NAME like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getLastName())){
			wh.add("%"+param.getLastName()+"%");
			sql.append(" AND LAST_NAME like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getMobile())){
			wh.add("%"+param.getMobile()+"%");
			sql.append(" AND MOBILE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getOfficePhone())){
			wh.add("%"+param.getOfficePhone()+"%");
			sql.append(" AND OFFICE_PHONE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getEmail())){
			wh.add("%"+param.getEmail()+"%");
			sql.append(" AND a.EMAIL like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getDeptCode())){
			wh.add("%"+param.getDeptCode()+"%");
			sql.append(" AND a.DEPT_CODE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyCode())){
			wh.add("%"+param.getCompanyCode()+"%");
			sql.append(" AND a.COMPANY_CODE like ? ");
		}
		
//		if(StringUtils.isNotEmpty(param.toString())){
//			wh.add("%"+param.toString()+"%");
//			sql.append(" AND CREATE_DATE = TO_DATE(?, 'dd/mm/yyyy') ");
//		}
//		
		if(StringUtils.isNotEmpty(param.getActiveFlg())){
			wh.add(param.getActiveFlg());
			sql.append(" AND STATUS = ? ");
		}
		
//		if(StringUtils.isNotEmpty(param.getDeptName())){
//			wh.add(param.getDeptName());
//			sql.append(" AND TITLE = ? ");
//		}
		
		if(StringUtils.isNotEmpty(param.getTitle())){
			wh.add(param.getTitle());
			sql.append(" AND TITLE = ? ");
		}
		// not create CREATE_DATE CREATE_BY UPDATE_DATE  UPDATE_BY because don't know should to set?
//		
		sql.append(" ORDER BY OWNER_CODE , FIRST_NAME ");
		
		System.out.println(sql.toString()); 
		
		List<Owner> list = (List<Owner>) executeQuery(sql.toString(), wh.toArray(), she_owner_dt);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	} 

    
	public DataTableAjax<Owner> getDataTableOwnerTrain(Owner param) {
		logger.info("### getDataTableOwnerTrain  ");
		
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT  a.* ,dbo.GetParamDesc(a.STATUS ,'ACTIVE_TYPE','TH') OWNER_STATUS   "
				+ ", b.DESC_TH DEPT_NAME_TH , b.DESC_EN DEPT_NAME_EN "
				+ ", d.DESC_TH TITLE_NAME , d.DESC_TH TITLE_DESC , f.DESC_TH POSITION_NAME, "
				+ " c.DESC_TH OWNER_TYPE_TH , e.DESC_TH COMPANY_NAME ");
		sql.append("  FROM SHE_OWNER a   ");
//		sql.append("  LEFT JOIN SHE_COURSE_TRAINING_OWNER t on t.OWNER_ID = a.OWNER_ID ");
		sql.append(" LEFT JOIN   sys_param b   ON b.PARAM_TYPE = 'SECTION_MASTER' AND b.PARAM_CODE = a.DEPT_CODE ");
		sql.append("  left join  sys_param c   ON c.PARAM_TYPE = 'OWNER_TYPE'  AND c.PARAM_CODE = a.OWNER_TYPE ");
		sql.append("  LEFT JOIN  sys_param d  ON d.PARAM_TYPE = 'TITLE'   AND d.PARAM_CODE = a.TITLE ");
		sql.append("  LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = a.COMPANY_CODE ");
		sql.append("  LEFT JOIN  sys_param f  ON f.PARAM_TYPE = 'POSITION_MASTER'   AND f.PARAM_CODE = a.POSITION ");
		sql.append(" WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		if(StringUtils.isNotEmpty(param.getOwnerCode())){
			wh.add("%"+param.getOwnerCode()+"%");
			sql.append(" AND a.OWNER_CODE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getOwnerType())){
			wh.add(param.getOwnerType());
			sql.append(" AND a.OWNER_TYPE = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getGender())){
			wh.add(param.getGender());
			sql.append(" AND GENDER like = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getFirstName())){
			wh.add("%"+param.getFirstName()+"%");
			sql.append(" AND FIRST_NAME like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getLastName())){
			wh.add("%"+param.getLastName()+"%");
			sql.append(" AND LAST_NAME like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getMobile())){
			wh.add("%"+param.getMobile()+"%");
			sql.append(" AND MOBILE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getOfficePhone())){
			wh.add("%"+param.getOfficePhone()+"%");
			sql.append(" AND OFFICE_PHONE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getEmail())){
			wh.add("%"+param.getEmail()+"%");
			sql.append(" AND a.EMAIL like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getDeptCode())){
			wh.add("%"+param.getDeptCode()+"%");
			sql.append(" AND a.DEPT_CODE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyCode())){
			wh.add("%"+param.getCompanyCode()+"%");
			sql.append(" AND a.COMPANY_CODE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getActiveFlg())){
			wh.add(param.getActiveFlg());
			sql.append(" AND STATUS = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPosition())){
			wh.add(param.getPosition());
			sql.append(" AND POSITION = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getTitle())){
			wh.add(param.getTitle());
			sql.append(" AND TITLE = ? ");
		}
		
		sql.append(" ORDER BY  a.OWNER_CODE , a.FIRST_NAME ");
		
		System.out.println(sql.toString()); 
		
		List<Owner> list = (List<Owner>) executeQuery(sql.toString(), wh.toArray(), she_owner_dt);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	} 
	
	
    public int update(Owner owner) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { owner.getOwnerCode(), owner.getOwnerType(), owner.getTitle(),owner.getGender(),
						owner.getFirstName(), owner.getLastName(), owner.getMobile(),
						owner.getOfficePhone(), owner.getEmail(), owner.getDeptCode(),owner.getActiveFlg(),owner.getPosition(),
//						owner.getCreateDate(), owner.getCreateBy(), owner.getUpdateDate(), ** Set on sql 
						owner.getUpdateBy(),
//						owner.getOwnerImage(),
						owner.getCompanyCode(), owner.getWorkStartDate(), owner.getBirthDate()
						, owner.getOwnerId()   });
        return updateRecord;
    }

    
    public int updateOwnerImage(Owner owner) {
 		int updateRecord = jdbcTemplate.update("UPDATE SHE_OWNER SET IMAGE = ? WHERE OWNER_ID = ? ",
 				new Object[] {   owner.getOwnerImage(), owner.getOwnerId()   });
         return updateRecord;
     }

    
    
    public int delete(Integer ownerId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {ownerId });
        return deleteRecord;
    }

	public Owner verify(String ownerCode) {
		logger.info("### ownerCode : "+ownerCode);
		
		StringBuilder sql = new StringBuilder();
		sql.append("  SELECT a.*, '' COMPANY_NAME , a.STATUS as OWNER_STATUS , a.TITLE TITLE_NAME ,a.TITLE TITLE_DESC , "
				+ " a.POSITION  POSITION_NAME, b.DESC_TH DEPT_NAME_TH , b.DESC_EN DEPT_NAME_EN, a.GENDER GENDER_NAME, a.OWNER_TYPE OWNER_TYPE_TH FROM SHE_OWNER a , SYS_PARAM b ");
		sql.append(" WHERE a.DEPT_CODE = b.PARAM_CODE  and b.PARAM_TYPE = 'SECTION_MASTER' and a.OWNER_CODE = ? ");
		List<Owner> list = (List<Owner>) executeQuery(sql.toString(), new String[]{ownerCode}, she_owner_dt);
		return list!=null&& list.size()>0? list.get(0):new Owner() ;
	}

	public DataTableAjax getDataTablePersonCourse(CourseOwner param) {
			logger.info("### getDataTablePersonCourse  ");
			
			DataTableAjax result = new DataTableAjax<>();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" 	SELECT a.OWNER_ID,                                                                ");
			sql.append("        a.OWNER_CODE,                                                                 ");
			sql.append("        a.OWNER_TYPE,                                                                 ");
			sql.append("        a.GENDER,                                                                     ");
			sql.append("        a.FIRST_NAME,                                                                 ");
			sql.append("        a.LAST_NAME,                                                                  ");
			sql.append("        a.EMAIL,                                                                      ");
			sql.append("        a.DEPT_CODE,                                                                  ");
			sql.append("        a.TITLE,                                                                      ");
			sql.append("        a.SECTION_CODE,                                                               ");
			sql.append("        a.POSITION,                                                                   ");
			sql.append("        b.DESC_TH DEPT_NAME_TH,                                                       ");
			sql.append("        b.DESC_EN DEPT_NAME_EN,                                                       ");
			sql.append("        d.DESC_TH TITLE_NAME,                                                         ");
			sql.append("        f.DESC_TH POSITION_NAME,                                                      ");
			sql.append("        c.DESC_TH OWNER_TYPE_TH,                                                      ");
			sql.append("        e.DESC_TH COMPANY_NAME,                                                       ");
			sql.append("        cotr.course_CODE,                                                             ");
			sql.append("        cotr.course_gen_no course_group,                                              ");
			sql.append("        CONVERT(VARCHAR,cotr.COURSE_DATE, 103) COURSE_DATE_STR,                       ");
			sql.append("        CONVERT(VARCHAR,cotr.COURSE_DATE_END, 103) COURSE_DATE_END_STR,               ");
			sql.append("        dbo.GetParamDesc(cotr.course_Type, 'COURSE_TYPE', 'TH') course_Type,          ");
			sql.append("        co.course_NAME_EN,                                                            ");
			sql.append("        co.course_NAME_TH                                                             ");
			sql.append(" FROM she_course_training_owner cow                                                   ");
			sql.append(" LEFT JOIN SHE_OWNER a ON a.OWNER_ID = cow.OWNER_ID                                   ");
			sql.append(" LEFT JOIN dbo.she_course_training cotr ON cotr.course_train_ID = cow.course_train_ID ");
			sql.append(" LEFT JOIN dbo.she_course co ON cotr.course_CODE = co.course_CODE                     ");
			sql.append(" LEFT JOIN sys_param b ON b.PARAM_TYPE = 'SECTION_MASTER'                             ");
			sql.append(" AND b.PARAM_CODE = a.DEPT_CODE                                                       ");
			sql.append(" LEFT JOIN sys_param c ON c.PARAM_TYPE = 'OWNER_TYPE'                                 ");
			sql.append(" AND c.PARAM_CODE = a.OWNER_TYPE                                                      ");
			sql.append(" LEFT JOIN sys_param d ON d.PARAM_TYPE = 'TITLE'                                      ");
			sql.append(" AND d.PARAM_CODE = a.TITLE                                                           ");
			sql.append(" LEFT JOIN sys_param e ON e.PARAM_TYPE = 'COMPANY'                                    ");
			sql.append(" AND e.PARAM_CODE = a.COMPANY_CODE                                                    ");
			sql.append(" LEFT JOIN sys_param f ON f.PARAM_TYPE = 'POSITION_MASTER'                            ");
			sql.append(" AND f.PARAM_CODE = a.POSITION                                                        ");
			sql.append(" WHERE 1=1 ");
			
			
			List wh = new ArrayList<>();
			if(StringUtils.isNotEmpty(param.getOwnerCode())){
				wh.add("%"+param.getOwnerCode()+"%");
				sql.append(" AND a. OWNER_CODE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getOwnerType())){
				wh.add(param.getOwnerType());
				sql.append(" AND a.OWNER_TYPE = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getGender())){
				wh.add(param.getGender());
				sql.append(" AND a.GENDER like = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getFirstName())){
				wh.add("%"+param.getFirstName()+"%");
				sql.append(" AND a.FIRST_NAME like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getLastName())){
				wh.add("%"+param.getLastName()+"%");
				sql.append(" AND a.LAST_NAME like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getMobile())){
				wh.add("%"+param.getMobile()+"%");
				sql.append(" AND a.MOBILE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getOfficePhone())){
				wh.add("%"+param.getOfficePhone()+"%");
				sql.append(" AND a.OFFICE_PHONE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getEmail())){
				wh.add("%"+param.getEmail()+"%");
				sql.append(" AND a.EMAIL like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getDeptCode())){
				wh.add("%"+param.getDeptCode()+"%");
				sql.append(" AND a.DEPT_CODE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getCompanyCode())){
				wh.add("%"+param.getCompanyCode()+"%");
				sql.append(" AND a.COMPANY_CODE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getActiveFlg())){
				wh.add(param.getActiveFlg());
				sql.append(" AND STATUS = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getPosition())){
				wh.add(param.getPosition());
				sql.append(" AND POSITION = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getTitle())){
				wh.add(param.getTitle());
				sql.append(" AND TITLE = ? ");
			}
			
			
			/** COURSE */
			if(StringUtils.isNotEmpty(param.getCourseDateStr())){
				wh.add( param.getCourseDateStr() );
				sql.append(" AND cotr.COURSE_DATE >= convert(datetime, ? ,103) ");
			}
			
			if(StringUtils.isNotEmpty(param.getCourseDateEndStr())){
				wh.add( param.getCourseDateEndStr() );
				sql.append(" AND cotr.COURSE_DATE_END <= convert(datetime, ? ,103) ");
			}
			
			if(StringUtils.isNotEmpty(param.getCourseCode())){
				wh.add("%"+param.getCourseCode()+"%");
				sql.append(" AND cotr.COURSE_CODE like ?  ");
			}
			
			if(StringUtils.isNotEmpty(param.getCourseType())){
				wh.add("%"+param.getCourseType()+"%");
				sql.append(" AND cotr.COURSE_TYPE like ?  ");
			}
			
			sql.append(" ORDER BY  a.OWNER_CODE , cotr.course_CODE ,a.COMPANY_CODE ");
			
			System.out.println(sql.toString()); 
			
			List<Map<String, Object>> list =  executeQueryForList(sql.toString(), wh.toArray());
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		} 

}
