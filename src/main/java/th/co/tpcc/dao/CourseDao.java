
package th.co.tpcc.dao;

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

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.Course;

@Repository("courseDao")
public class CourseDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.*, CONVERT(VARCHAR, a.COURSE_DATE, 103 ) COURSE_DATE_STR ");
        sql.append(" , dbo.GetParamDesc(a.COURSE_TYPE,'COURSE_TYPE','TH') COURSE_TYPE_DESC ");
        sql.append(" , dbo.GetParamDesc(A.STATUS,'ACTIVE_TYPE','TH') ACTIVE");
        sql.append(" FROM she_course a ");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_course ( ");
//        sql.append(" COURSE_ID        ");
        sql.append(" COURSE_CODE      ");
        sql.append(",COURSE_TYPE      ");
//        sql.append(",COURSE_OWNER      ");
        sql.append(",COURSE_NAME_TH   ");
        sql.append(",COURSE_NAME_EN   ");
//        sql.append(",COURSE_DATE      ");
//        sql.append(",COURSE_PLACE     ");
//        sql.append(",COURSE_PRICE     ");
        sql.append(",CREATE_DATE      ");
        sql.append(",CREATE_BY        ");
        sql.append(",STATUS        ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,GETDATE(),?,?) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_course ");
        sql.append(" SET ");
        sql.append(" COURSE_CODE    =?  ");   
        sql.append(" ,COURSE_TYPE    =? ");   
//        sql.append(" ,COURSE_OWNER    =? ");   
        sql.append(" ,COURSE_NAME_TH =? ");   
        sql.append(" ,COURSE_NAME_EN =? ");   
//        sql.append(" ,COURSE_PLACE   =? ");   
//        sql.append(" ,COURSE_PRICE   =? ");   
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,STATUS = ? ");
        sql.append(" WHERE ");
        sql.append("   COURSE_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM SHE_COURSE ");
        sql.append(" WHERE ");
        sql.append("   COURSE_ID = ? ");
        return sql.toString();
    }

    
    public List<Course> selectAll() {
        List<Course> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(Course.class));
        return resultList;
    }

    
    public Course selectById(String deptId) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   COURSE_ID = ? ");
        List<Course> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(Course.class), new Object[] {deptId });
        return  list!=null&& list.size()>0? list.get(0):new Course() ;
    }
    
    public Course selectByCode(String code) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   COURSE_CODE = ? ");
        List<Course> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(Course.class), new Object[] {code });
        return  list!=null&& list.size()>0? list.get(0):new Course() ;
    }

    
    public int insert(Course invCourse) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { invCourse.getCourseCode(),
						invCourse.getCourseType    (),
//						invCourse.getCourseOwner    (),
						invCourse.getCourseNameTh (),
						invCourse.getCourseNameEn (),
//						invCourse.getCourseDateStr    (),
//						invCourse.getCoursePlace   (),
//						invCourse.getCoursePrice   (),
						invCourse.getCreateBy      (),
						invCourse.getActive() 
						});
        return insertRecord.intValue();
    }
    
    public int update(Course invCourse) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { invCourse.getCourseCode(),
						invCourse.getCourseType    (),
//						invCourse.getCourseOwner    (),
						invCourse.getCourseNameTh (),
						invCourse.getCourseNameEn (),
//						invCourse.getCourseDateStr    (),
//						invCourse.getCoursePlace   (),
//						invCourse.getCoursePrice   (),
						invCourse.getUpdateBy      (),
						invCourse.getActive(),
						invCourse.getCourseId() });
        return updateRecord;
    }
    
    private RowMapper INV_COURSE_RM = new RowMapper(){
		@Override
		public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
			Course m = new Course();
			m.setCourseId (rs.getInt("COURSE_ID"));
			m.setCourseCode(rs.getString("COURSE_CODE"));
			m.setCourseType(rs.getString("COURSE_TYPE_DESC"));
//			m.setCourseOwner(rs.getString("COURSE_OWNER"));
			m.setCourseNameTh(rs.getString("COURSE_NAME_TH"));
			m.setCourseNameEn(rs.getString("COURSE_NAME_EN"));
//			m.setCourseDate(rs.getDate("COURSE_DATE"));
//			m.setCourseDateStr(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("COURSE_DATE"))); 
//			m.setCoursePlace(rs.getString("COURSE_PLACE"));
//			m.setCoursePrice(rs.getBigDecimal("COURSE_PRICE"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setActiveFlg(rs.getString("STATUS")); 
			m.setActive(rs.getString("ACTIVE")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			return m;
		}
    };
    
    public DataTableAjax<Course> getDataTable(Course param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
//		sql.append(" SELECT * FROM she_course ");
		 sql.append(" SELECT a.*,CONVERT(VARCHAR,a.COURSE_DATE, 103 ) COURSE_DATE_STR ");
	        sql.append(" , dbo.GetParamDesc(a.COURSE_TYPE,'COURSE_TYPE','TH') COURSE_TYPE_DESC ");
	        sql.append(" , dbo.GetParamDesc(A.STATUS,'ACTIVE_TYPE','TH') ACTIVE");

		sql.append(" FROM she_course a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		
		if(StringUtils.isNotEmpty(param.getCourseCode())){
			wh.add("%"+param.getCourseCode()+"%");
			sql.append(" AND COURSE_CODE like ?  ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseType())){
			wh.add("%"+param.getCourseType()+"%");
			sql.append(" AND COURSE_TYPE like ?  ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseNameTh())){
			wh.add("%"+param.getCourseNameTh()+"%");
			wh.add("%"+param.getCourseNameTh()+"%");
			sql.append(" AND ( COURSE_NAME_TH like ? ");
			sql.append(" OR COURSE_NAME_EN like ? ) ");
		}
		
		/*if(StringUtils.isNotEmpty(param.getCourseOwner())){
			wh.add("%"+param.getCourseOwner()+"%");
			sql.append(" AND COURSE_OWNER like ? ");
		}
		
		
		if(StringUtils.isNotEmpty(param.getCoursePlace())){
			wh.add("%"+param.getCoursePlace()+"%");
			sql.append(" AND COURSE_PLACE like ? ");
		}
		
		*/
		if(StringUtils.isNotEmpty(param.getActiveFlg())){
			wh.add( param.getActiveFlg() );
			sql.append(" AND ACTIVE =  ? ");
		}
		
		sql.append(" ORDER BY COURSE_CODE ");
		
//		System.out.println(sql.toString()); 
		
		List<Course> list = (List<Course>) executeQuery(sql.toString(), wh.toArray(), INV_COURSE_RM);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
    
    
    public int delete(Integer deptId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {deptId });
        return deleteRecord;
    }

	

}

