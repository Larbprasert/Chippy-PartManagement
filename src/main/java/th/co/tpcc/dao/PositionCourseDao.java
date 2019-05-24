
package th.co.tpcc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.PositionCourse;

@Repository("positionCourseDao")
public class PositionCourseDao extends AbstractCommonJdbcDao {

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

}
