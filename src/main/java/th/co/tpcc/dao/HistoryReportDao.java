
package th.co.tpcc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.admin.entity.AdmUserRole;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.model.PositionCourse;

@Repository("historyReportDao")
public class HistoryReportDao extends AbstractCommonJdbcDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SysParamDao sysParamDao;
	
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO SHE_POSITION_COURSE ( ");
		sql.append("   POSITION_CODE ");
		sql.append("   ,COURSE_CODE ");
		sql.append("   ,CREATE_BY ");
		sql.append("   ,CREATE_DATE ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,GETDATE()) ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM SHE_POSITION_COURSE ");
		sql.append(" WHERE  POSITION_CODE = ? ");
		return sql.toString();
	}

	public int insert(PositionCourse position) {
		int insertRecord = jdbcTemplate.update(SQL_INSERT,
				new Object[] { position.getPositionCode(), 
						position.getCourseCode(), 
						position.getCreateBy()
				});
		return insertRecord;
	}
	
	
	  public DataTableAjax<PositionCourse> getDataTable(PositionCourse param) {
			logger.info("### getDataTable :xxxxxx ");
			DataTableAjax result = new DataTableAjax<>();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT a.PARAM_ID positionId , a.PARAM_CODE positionCode,  pc.courseCode ,  ");
			sql.append(" a.DESC_TH positionNameTh, a.DESC_EN positionNameEn , a.SORT_NO orderNo ");
			sql.append("  FROM sys_param a");
			 sql.append("   LEFT JOIN                                                              ");
//		     sql.append("  	( SELECT  a.POSITION_CODE,  GROUP_CONCAT(a.course_CODE ORDER BY a.course_CODE ASC) courseCode     ");
//		     sql.append("  	FROM she_position_course a                                             ");
//		     sql.append("  	LEFT JOIN SHE_COURSE b                                                 ");
//		     sql.append("  	ON b.COURSE_CODE = a.course_CODE                                       ");
//		     sql.append("  	GROUP BY a.POSITION_CODE   ) pc                                          ");
			 
			sql.append(" ( SELECT  distinct a.POSITION_CODE                        "); 
			sql.append("  ,courseCode = STUFF((                                   "); 
			sql.append("     SELECT ',' + Convert(Varchar, x.course_CODE )        "); 
			sql.append("     FROM she_position_course x                           "); 
			sql.append(" 	 where  x.POSITION_CODE = a.POSITION_CODE             "); 
			sql.append("     FOR XML PATH('')                                     "); 
			sql.append("     ), 1, 1, '')                                         "); 
			sql.append(" FROM she_position_course a  ) pc     "); 

			
		     sql.append("  ON a.PARAM_CODE = pc.POSITION_CODE                                      ");
		     sql.append("  WHERE a.PARAM_type = 'POSITION_MASTER'        ");
			
			List wh = new ArrayList<>();
			
			if(StringUtils.isNotEmpty(param.getPositionCode())){
				sql.append(" AND a.PARAM_CODE like ?  ");
				wh.add("%"+param.getPositionCode()+"%");
			}
			
			if(StringUtils.isNotEmpty(param.getPositionNameTh())){
				sql.append(" AND ( a.DESC_TH like ? ");
				sql.append(" OR a.DESC_EN like ? ) ");
				wh.add("%"+param.getPositionNameTh()+"%");
				wh.add("%"+param.getPositionNameTh()+"%");
			}
			sql.append(" ORDER BY  a.SORT_NO ");
			
//			System.out.println(sql.toString()); 
			
			List list =executeQueryForList(sql.toString(), wh.toArray());
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		}
	    
	  public PositionCourse selectById(String id) {
        StringBuilder sql = new StringBuilder();
	     sql.append("    SELECT  a.PARAM_ID positionId , a.PARAM_CODE positionCode,            ");
	     sql.append("    a.DESC_TH positionNameTh, a.DESC_EN positionNameEn ,                  ");
	     sql.append("     pc.courseCode ,                                                      ");
	     sql.append("     a.SORT_NO orderNo                                                    ");
	     sql.append("   FROM sys_param a                                                       ");
	     sql.append("   LEFT JOIN                                                              ");
//	     sql.append("  	( SELECT  a.POSITION_CODE,  GROUP_CONCAT(a.course_CODE ORDER BY a.course_CODE ASC) courseCode     ");
//	     sql.append("  	FROM she_position_course a                                             ");
//	     sql.append("  	LEFT JOIN SHE_COURSE b                                                 ");
//	     sql.append("  	ON b.COURSE_CODE = a.course_CODE                                       ");
//	     sql.append("  	GROUP BY a.POSITION_CODE order by a.course_CODE ) pc                                          ");
	 	sql.append(" ( SELECT  distinct a.POSITION_CODE                        "); 
		sql.append("  ,courseCode = STUFF((                                   "); 
		sql.append("     SELECT ',' + Convert(Varchar, x.course_CODE )        "); 
		sql.append("     FROM she_position_course x                           "); 
		sql.append(" 	 where  x.POSITION_CODE = a.POSITION_CODE             "); 
		sql.append("     FOR XML PATH('')                                     "); 
		sql.append("     ), 1, 1, '')                                         "); 
		sql.append(" FROM she_position_course a  ) pc     "); 
	     sql.append("  ON a.PARAM_CODE = pc.POSITION_CODE                                      ");
	     sql.append("  WHERE a.PARAM_type = 'POSITION_MASTER'  AND  a.PARAM_ID = ?             ");
        
        List<PositionCourse> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(PositionCourse.class), new Object[] {id});
        PositionCourse positionCourse = new PositionCourse();
        if(list!=null&& list.size()>0){
        	positionCourse = list.get(0);
//        	positionCourse.setCourseList(getCourseListByPositionCode(positionCourse.getPositionCode()));
        }
        return positionCourse;
    }
	  
	 /* public List<Course> getCourseListByPositionCode(String id) {
		  StringBuilder sql = new StringBuilder();
		  sql.append(" SELECT a.PARAM_ID positionId , a.PARAM_CODE positionCode, ");
		  sql.append(" a.DESC_TH positionNameTH, a.DESC_EN positionNameEN , a.SORT_NO orderNo ");
		  sql.append("  FROM sys_param a WHERE a.PARAM_type = 'POSITION_MASTER' ");
		  sql.append(" WHERE a.PARAM_ID = ? ");
		  List<Course> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(Course.class), new Object[] {id});
		  return list;
	  }*/
  
	public int delete(String code) {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM SHE_POSITION_COURSE ");
		sql.append(" WHERE  POSITION_CODE = ? ");
		int deleteRecord = jdbcTemplate.update(sql.toString(), new Object[] { code });
		return deleteRecord;
	}

	public List<Course> getCourseList() {
        List<Course> list = jdbcTemplate.query(" select * from SHE_COURSE where status = 'Y'  ", BeanPropertyRowMapper.newInstance(Course.class));
        return list;
	}

	public void update(PositionCourse position) {
		delete(position.getPositionCode());
		String course = position.getCourseCode();
		if(StringUtils.isNoneEmpty(course)){
			String[] courseArr = course.split(",");
			PositionCourse saveCourse = null;
			for (int i = 0; i < courseArr.length; i++) {
				saveCourse = new PositionCourse();
				saveCourse.setPositionCode(position.getPositionCode());
				saveCourse.setCourseCode(courseArr[i]);
				insert(saveCourse);
			}
		}
		
	}

	public List getReport01(CourseTraining param) {
		StringBuilder sql = new StringBuilder();
		 sql.append(" select COUNT(tow.OWNER_ID) COUNT_TRAIN , ct.course_CODE, so.COMPANY_CODE , COM_SUM.OWN_COMPANY_SUM       "); 
		 sql.append(" from she_course_training_owner tow                                                                       "); 
		 sql.append(" left join  she_course_training ct                                                                        "); 
		 sql.append(" on tow.course_train_ID = ct.course_train_ID                                                              "); 
		 sql.append(" left join  she_owner so                                                                                  "); 
		 sql.append(" on tow.OWNER_ID = so.OWNER_ID                                                                            "); 
		 sql.append(" join   ( select COUNT(cnt.OWNER_ID) OWN_COMPANY_SUM,  cnt.COMPANY_CODE from she_owner cnt                "); 
		 sql.append("   group by  cnt.COMPANY_CODE ) as COM_SUM                                                                "); 
		 sql.append("   on COM_SUM.COMPANY_CODE = so.COMPANY_CODE                                                                  "); 
		 
		 sql.append(" where 1=1        ");
		 List wh = new ArrayList<>();
		
//		if(StringUtils.isNotEmpty(year)){
//			sql.append(" and YEAR(tow.CREATE_DATE) =   ?  ");
//			wh.add(year);
//		}
		 
		 if(StringUtils.isNotEmpty(param.getCourseDateStr())){
				wh.add( param.getCourseDateStr() );
				sql.append(" AND ct.COURSE_DATE >= convert(datetime, ? ,103) ");
			}
			
			if(StringUtils.isNotEmpty(param.getCourseDateEndStr())){
				wh.add( param.getCourseDateEndStr() );
				sql.append(" AND ct.COURSE_DATE_END <= convert(datetime, ? ,103) ");
			}
			
			

			if(StringUtils.isNotEmpty(param.getCourseCode())){
				String coCode = "";
				String[] ccodeArr = param.getCourseCode().split(",");
				if(ccodeArr.length>0){
					for (int i = 0; i < ccodeArr.length; i++) {
						coCode += "'"+ccodeArr[i]+"',";
					}
					coCode = coCode.substring(0,coCode.length()-1);
					sql.append(" AND ct.COURSE_CODE IN ("+ coCode + ")");
				}
			}
			

			if(StringUtils.isNotEmpty(param.getCompanyCode())){
				String comCode = "";
				String[] ccodeArr = param.getCompanyCode().split(",");
				if(ccodeArr.length>0){
					for (int i = 0; i < ccodeArr.length; i++) {
						comCode += "'"+ccodeArr[i]+"',";
					}
					comCode = comCode.substring(0,comCode.length()-1);
					sql.append(" AND so.COMPANY_CODE IN ("+ comCode + ")");
				}
			}
			
		
		 sql.append(" group by   ct.course_CODE, so.COMPANY_CODE , COM_SUM.OWN_COMPANY_SUM      ");
		 sql.append(" ORDER BY so.COMPANY_CODE  ");
		
		System.out.println(sql.toString()); 
		
		List  result = executeQueryForList(sql.toString(), wh.toArray());
		return result;
	}

}
