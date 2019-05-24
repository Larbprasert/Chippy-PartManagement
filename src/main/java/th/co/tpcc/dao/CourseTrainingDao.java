
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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.model.Owner;

@Repository("courseTrainingDao")
public class CourseTrainingDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.*,CONVERT(VARCHAR,a.COURSE_DATE, 103 ) COURSE_DATE_STR ");
		 sql.append(" ,CONVERT(VARCHAR,a.COURSE_DATE_END , 103 ) COURSE_DATE_END_STR ");
        sql.append(" , dbo.GetParamDesc(a.COURSE_TYPE,'COURSE_TYPE','TH') COURSE_TYPE_DESC ");
        sql.append(" , dbo.GetParamDesc(A.STATUS,'ACTIVE_TYPE','TH') ACTIVE");
        sql.append(", b.course_NAME_EN ,b.course_NAME_TH ");
        sql.append(" FROM she_course_training a left join she_course b "
				+ "  on B.COURSE_CODE= A.COURSE_CODE ");
        
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_course_training ( ");
//        sql.append(" COURSE_ID        ");
        sql.append(" COURSE_CODE      ");
        sql.append(",COURSE_TYPE      ");
        sql.append(",COURSE_OWNER      ");
        sql.append(",COURSE_GEN_NO   ");
//        sql.append(",COURSE_NAME_EN   ");
        sql.append(",COURSE_DATE      ");
        sql.append(",COURSE_DATE_END      ");
        sql.append(",COURSE_PLACE     ");
        sql.append(",COURSE_PRICE     ");
        sql.append(",CREATE_DATE      ");
        sql.append(",CREATE_BY        ");
        sql.append(",STATUS        ");
        sql.append(" ) ");
        sql.append(" VALUES (?,(SELECT COURSE_TYPE FROM SHE_COURSE WHERE COURSE_CODE = ? ) ,?,?,convert(datetime, ? ,103),  convert(datetime, ? ,103),?,?,GETDATE(),?,?) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_course_training ");
        sql.append(" SET ");
        sql.append(" COURSE_CODE    =?  ");   
        sql.append(" ,COURSE_TYPE    = (SELECT COURSE_TYPE FROM SHE_COURSE WHERE COURSE_CODE = ? ) ");   
        sql.append(" ,COURSE_OWNER    =? ");   
        sql.append(" ,COURSE_GEN_NO =? ");   
//        sql.append(" ,COURSE_NAME_EN =? ");   
        sql.append(" ,COURSE_DATE    =  convert(datetime, ? ,103) ");   
        sql.append(" ,COURSE_DATE_END    =  convert(datetime, ? ,103) ");   
        sql.append(" ,COURSE_PLACE   =? ");   
        sql.append(" ,COURSE_PRICE   =? ");   
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,STATUS = ? ");
        sql.append(" WHERE ");
        sql.append("   COURSE_TRAIN_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM she_course_training ");
        sql.append(" WHERE ");
        sql.append("   COURSE_TRAIN_ID = ? ");
        return sql.toString();
    }

    
    public List<CourseTraining> selectAll() {
        List<CourseTraining> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(CourseTraining.class));
        return resultList;
    }

    
    public CourseTraining selectById(String Id) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   COURSE_TRAIN_ID = ? ");
        List<CourseTraining> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(CourseTraining.class), new Object[] {Id });
        return  list!=null&& list.size()>0? list.get(0):new CourseTraining() ;
    }
    
    
    public String findNextGroupNo(String courseCode) {
        StringBuilder sql = new StringBuilder();
        sql.append("   SELECT ISNULL(MAX(cast(COURSE_GEN_NO as int)),0)+1 GEN_NO FROM she_course_training WHERE COURSE_CODE = '"+courseCode+"'");
        Map<String, Object> map = jdbcTemplate.queryForMap(sql.toString());
        Integer max =  (Integer) map.get("GEN_NO") ;
        return  max!=null? max.intValue() + "" : "xx" ;
    }
    
    
    public CourseTraining selectByCode(String code) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   COURSE_CODE = ? ");
        List<CourseTraining> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(CourseTraining.class), new Object[] {code });
        return  list!=null&& list.size()>0? list.get(0):new CourseTraining() ;
    }

    
    public int insert(CourseTraining invCourse) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { invCourse.getCourseCode(),
						invCourse.getCourseCode    (),
						invCourse.getCourseOwner    (),
						invCourse.getCourseGenNo    (),
						invCourse.getCourseDateStr    (),
						invCourse.getCourseDateEndStr    (),
						invCourse.getCoursePlace   (),
						invCourse.getCoursePrice   (),
						invCourse.getCreateBy      (),
						invCourse.getActive() 
						});
        return insertRecord.intValue();
    }
    
    public int update(CourseTraining invCourse) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { invCourse.getCourseCode(),
						invCourse.getCourseCode    (),
						invCourse.getCourseOwner    (),
						invCourse.getCourseGenNo    (),
						invCourse.getCourseDateStr    (),
						invCourse.getCourseDateEndStr    (),
						invCourse.getCoursePlace   (),
						invCourse.getCoursePrice   (),
						invCourse.getUpdateBy      (),
						invCourse.getActive(),
						invCourse.getCourseTrainId() });
        return updateRecord;
    }
    
    private RowMapper INV_COURSE_TRAIN_RM = new RowMapper(){
		@Override
		public CourseTraining mapRow(ResultSet rs, int rowNum) throws SQLException {
			CourseTraining m = new CourseTraining();
			m.setCourseTrainId (rs.getInt("COURSE_TRAIN_ID"));
			m.setCourseGenNo(rs.getInt("COURSE_GEN_NO"));
			m.setCourseCode(rs.getString("COURSE_CODE"));
			m.setCourseType(rs.getString("COURSE_TYPE_DESC"));
			m.setCourseOwner(rs.getString("COURSE_OWNER"));
			m.setCourseNameTh(rs.getString("COURSE_NAME_TH"));
			m.setCourseNameEn(rs.getString("COURSE_NAME_EN"));
			m.setCourseDate(rs.getDate("COURSE_DATE"));
			m.setCourseDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("COURSE_DATE"))); 
			m.setCourseDateEnd(rs.getDate("COURSE_DATE_END"));
			m.setCourseDateEndStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("COURSE_DATE_END"))); 
			m.setCoursePlace(rs.getString("COURSE_PLACE"));
			m.setCoursePrice(rs.getBigDecimal("COURSE_PRICE"));
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
    
    public DataTableAjax<CourseTraining> getDataTable(CourseTraining param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
//		sql.append(" SELECT * FROM she_course_training ");
		 sql.append(" SELECT a.*,CONVERT(VARCHAR,a.COURSE_DATE, 103 ) COURSE_DATE_STR ");
		 sql.append(" ,CONVERT(VARCHAR,a.COURSE_DATE_END , 103 ) COURSE_DATE_END_STR ");
	        sql.append(" , dbo.GetParamDesc(a.COURSE_TYPE,'COURSE_TYPE','TH') COURSE_TYPE_DESC ");
	        sql.append(" , dbo.GetParamDesc(A.STATUS,'ACTIVE_TYPE','TH') ACTIVE ");
	        sql.append(", b.course_NAME_EN ,b.course_NAME_TH ");

		sql.append(" FROM she_course_training a , she_course b "
				+ "  WHERE B.COURSE_CODE= A.COURSE_CODE ");
		
		List wh = new ArrayList<>();
		
		if(StringUtils.isNotEmpty(param.getCourseCode())){
			wh.add("%"+param.getCourseCode()+"%");
			sql.append(" AND a.COURSE_CODE like ?  ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseType())){
			wh.add("%"+param.getCourseType()+"%");
			sql.append(" AND a.COURSE_TYPE like ?  ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseNameTh())){
			wh.add("%"+param.getCourseNameTh()+"%");
			wh.add("%"+param.getCourseNameTh()+"%");
			sql.append(" AND ( b.COURSE_NAME_TH like ? ");
			sql.append(" OR b.COURSE_NAME_EN like ? ) ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseOwner())){
			wh.add("%"+param.getCourseOwner()+"%");
			sql.append(" AND a.COURSE_OWNER like ? ");
		}
		
		
		if(StringUtils.isNotEmpty(param.getCoursePlace())){
			wh.add("%"+param.getCoursePlace()+"%");
			sql.append(" AND a.COURSE_PLACE like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseDateStr())){
			wh.add( param.getCourseDateStr() );
			sql.append(" AND a.COURSE_DATE = convert(datetime, ? ,103) ");
		}
		
		if(StringUtils.isNotEmpty(param.getCourseDateEndStr())){
			wh.add( param.getCourseDateEndStr() );
			sql.append(" AND a.COURSE_DATE_END = convert(datetime, ? ,103) ");
		}
		
		if(StringUtils.isNotEmpty(param.getActiveFlg())){
			wh.add( param.getActiveFlg() );
			sql.append(" AND A.STATUS=  ? ");
		}
		
		if(null!=param.getOwnerId()){
			wh.add( param.getOwnerId() );
			sql.append("  AND a.COURSE_TRAIN_ID IN (SELECT COURSE_TRAIN_ID FROM SHE_COURSE_TRAINING_OWNER  WHERE OWNER_ID = ?) ");
		}
		
		
		if(StringUtils.isNotEmpty(param.getCompanyCode())){
			wh.add( param.getCompanyCode() );
			sql.append("  and EXISTS (                                                                                            ");
			sql.append(" 		   SELECT od.course_train_ID , od.OWNER_id , so.COMPANY_CODE  FROM   she_course_training_owner od ");
			sql.append(" 			LEFT JOIN SHE_OWNER so on od.OWNER_ID = so.OWNER_ID                                           ");
			sql.append(" 			where od.course_train_ID =    a.course_train_ID                                               ");
			sql.append(" 			and so.COMPANY_CODE = ?                                                                   ");
			sql.append(" 		 ) ");
		}
		sql.append(" ORDER BY a.COURSE_CODE ,a.COURSE_GEN_NO, a.COURSE_DATE");
		
//		System.out.println(sql.toString()); 
		
		List<CourseTraining> list = (List<CourseTraining>) executeQuery(sql.toString(), wh.toArray(), INV_COURSE_TRAIN_RM);
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

	public DataTableAjax<Owner> getTrainList(Integer trainid) {
			logger.info("### getTrainList :xxxxxx ");
			
			DataTableAjax result = new DataTableAjax<>();
		
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT a.* ,dbo.GetParamDesc(a.STATUS ,'ACTIVE_TYPE','TH') OWNER_STATUS   "
					+ ", b.DESC_TH DEPT_NAME_TH , b.DESC_EN DEPT_NAME_EN "
					+ ", d.DESC_TH TITLE_NAME , f.DESC_TH POSITION_NAME, "
					+ " c.DESC_TH OWNER_TYPE_TH , e.DESC_TH COMPANY_NAME ");
			sql.append("  FROM SHE_COURSE_TRAINING_OWNER t ");
			sql.append("  LEFT JOIN SHE_OWNER a on t.OWNER_ID = a.OWNER_ID ");
			sql.append(" LEFT JOIN   sys_param b   ON b.PARAM_TYPE = 'SECTION_MASTER' AND b.PARAM_CODE = a.DEPT_CODE ");
			sql.append("  left join  sys_param c   ON c.PARAM_TYPE = 'OWNER_TYPE'  AND c.PARAM_CODE = a.OWNER_TYPE ");
			sql.append("  LEFT JOIN  sys_param d  ON d.PARAM_TYPE = 'TITLE'   AND d.PARAM_CODE = a.TITLE ");
			sql.append("  LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = a.COMPANY_CODE ");
			sql.append("  LEFT JOIN  sys_param f  ON f.PARAM_TYPE = 'POSITION_MASTER'   AND f.PARAM_CODE = a.POSITION ");
			sql.append(" WHERE 1=1 ");
			
			List wh = new ArrayList<>();
			if(null!=trainid){
				wh.add(trainid);
				sql.append(" AND t.COURSE_TRAIN_ID = ?  ");
			}else{
				return result;
			}
			
			sql.append(" ORDER BY t.create_date, a.OWNER_CODE , a.FIRST_NAME ");
			
			System.out.println(sql.toString()); 
			
			List<Owner> list = (List<Owner>) executeQuery(sql.toString(), wh.toArray(), she_owner_RM);
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		} 

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
				m.setDeptName(rs.getString("DEPT_NAME_TH"));
				m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
//				m.setCreateDate(rs.getDate("CREATE_DATE"));
				m.setUpdateBy(rs.getString("UPDATE_BY"));
				m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
//				m.setUpdateDate(rs.getDate("UPDATE_DATE"));
				m.setActiveFlg(rs.getString("OWNER_STATUS"));
				m.setPosition(rs.getString("POSITION_NAME"));
//				m.setOwnerImage(rs.getBytes("IMAGE"));
				m.setCompanyCode(rs.getString("COMPANY_CODE"));
				m.setCompanyName(rs.getString("COMPANY_NAME"));
//				m.setBirthDate(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("BIRTH_DATE")));
//				m.setWorkStartDate(DateUtils.get_current_ddMMMyyyy__from_date(rs.getTimestamp("WORK_START_DATE")));
//			    if(null!=m.getOwnerImage())
//				m.setOwnerImage64(Base64.getEncoder().encodeToString(m.getOwnerImage()));
				return m;
			}
		
	};

	public DataTableAjax<CourseTraining> getTrainNeed(CourseTraining param) {
			logger.info("### getTrainNeed :xxxxxx ");
			DataTableAjax result = new DataTableAjax<>();
			
			StringBuilder sql = new StringBuilder();
			
			 sql.append("  SELECT POSITION_CODE, b.*,                                                                         ");
			 sql.append("    dbo.GetParamDesc(b.COURSE_TYPE,'COURSE_TYPE','TH')    COURSE_TYPE_DESC,                              ");
			 sql.append("    dbo.GetParamDesc(b.STATUS,'ACTIVE_TYPE','TH')    ACTIVE                                              ");
			 sql.append("   ,( SELECT COUNT(tt.COURSE_CODE) FROM she_course_training tt , she_course_training_owner tb        ");
			 sql.append("   WHERE tt.course_train_ID =tb.course_train_ID                                                      ");
			 sql.append("   AND tb.OWNER_ID = ? AND tt.COURSE_CODE = b.COURSE_CODE GROUP BY tt.COURSE_CODE  ) IS_COMPLETE       ");
			 sql.append("  FROM she_position_course a,                                                                        ");
			 sql.append("    she_course b                                                                                     ");
			 sql.append("  WHERE B.COURSE_CODE = A.COURSE_CODE                                                                ");
			 sql.append("  AND POSITION_CODE IN (SELECT POSITION FROM she_owner WHERE OWNER_ID = ? )   ");

			
			if(null==param.getOwnerId()){
				return result;
			}
			
			
			sql.append(" ORDER BY B.COURSE_CODE ");
			
			
//			List list =executeQueryForList(sql.toString(), wh.toArray());
//			List<CourseTraining> list = (List<CourseTraining>) executeQuery(sql.toString(), wh.toArray(), INV_COURSE_TRAIN_RM);
	        List<CourseTraining> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(CourseTraining.class), new Object[] {param.getOwnerId(),param.getOwnerId()});

			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		}

	public DataTableAjax<Owner> getTrainAddList(CourseTraining course) {
			logger.info("### getTrainAddList  ");
			
			DataTableAjax result = new DataTableAjax<>();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT  a.* ,dbo.GetParamDesc(a.STATUS ,'ACTIVE_TYPE','TH') OWNER_STATUS   "
					+ ", b.DESC_TH DEPT_NAME_TH , b.DESC_EN DEPT_NAME_EN "
					+ ", d.DESC_TH TITLE_NAME , f.DESC_TH POSITION_NAME, "
					+ " c.DESC_TH OWNER_TYPE_TH , e.DESC_TH COMPANY_NAME ");
			sql.append("  FROM SHE_OWNER a   ");
//			sql.append("  LEFT JOIN SHE_COURSE_TRAINING_OWNER t on t.OWNER_ID = a.OWNER_ID ");
			sql.append(" LEFT JOIN   sys_param b   ON b.PARAM_TYPE = 'SECTION_MASTER' AND b.PARAM_CODE = a.DEPT_CODE ");
			sql.append("  left join  sys_param c   ON c.PARAM_TYPE = 'OWNER_TYPE'  AND c.PARAM_CODE = a.OWNER_TYPE ");
			sql.append("  LEFT JOIN  sys_param d  ON d.PARAM_TYPE = 'TITLE'   AND d.PARAM_CODE = a.TITLE ");
			sql.append("  LEFT JOIN  sys_param e  ON e.PARAM_TYPE = 'COMPANY'   AND e.PARAM_CODE = a.COMPANY_CODE ");
			sql.append("  LEFT JOIN  sys_param f  ON f.PARAM_TYPE = 'POSITION_MASTER'   AND f.PARAM_CODE = a.POSITION ");
			sql.append(" WHERE 1=1 ");
			List wh = new ArrayList<>();
			if(null!=course.getCourseTrainId()){
				sql.append(" and NOT EXISTS (SELECT od.OWNER_id ");
				sql.append("            FROM   she_course_training_owner od ");
				sql.append("            WHERE od.OWNER_ID =  a.OWNER_ID ");
				sql.append("           and  od.course_train_ID = ? )  ");
				wh.add(course.getCourseTrainId());
			}
			
			if(StringUtils.isNotEmpty(course.getCompanyCode())){
				sql.append(" AND a.COMPANY_CODE = ?  ");
				wh.add(course.getCompanyCode());
			}
			
			if(StringUtils.isNotEmpty(course.getDeptCode())){
				sql.append(" AND a.DEPT_CODE = ?  ");
				wh.add(course.getDeptCode());
			}
			
			
			sql.append(" ORDER BY  a.OWNER_CODE , a.FIRST_NAME ");
			
			System.out.println(sql.toString()); 
			
			List<Owner> list = (List<Owner>) executeQuery(sql.toString(), wh.toArray(), she_owner_RM);
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void addContractSave(String courseTrainId, String[] ownerId) {
		  StringBuilder sql = new StringBuilder();
	        sql.append(" INSERT INTO she_course_training_owner ( ");
	        sql.append(" COURSE_TRAIN_ID     ");
	        sql.append(",OWNER_ID      ");
	        sql.append(",CREATE_DATE      ");
	        sql.append(",CREATE_BY        ");
	        sql.append(" ) ");
	        sql.append(" VALUES (?,?,GETDATE(),?) ");
	        Owner owner = new Owner();
	        
	        for (String ownId : ownerId) {
//	        	jdbcTemplate.update(sql, args)
	        	jdbcTemplate.update(sql.toString(), new Object[] { courseTrainId, ownId, owner.getCreateBy () });
			}
	        
	}

	public int deleteTrainOwner(String courseTrainId, String ownerId) {
		   StringBuilder sql = new StringBuilder();
	        sql.append(" DELETE FROM SHE_COURSE_TRAINING_OWNER ");
	        sql.append(" WHERE ");
	        sql.append("   COURSE_TRAIN_ID = ? ");
	        sql.append("   and OWNER_ID = ? ");
	    int deleteRecord = jdbcTemplate.update(sql.toString(), new Object[] {courseTrainId ,ownerId});
        return deleteRecord;
	} 
		


}

