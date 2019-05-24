
package th.co.portal.dao.gas;

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
import th.co.portal.model.gas.Equipment;

@Repository("FFERegisteredDao")
public class FFERegisteredDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
//    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    
    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM she_equipment ");
        sql.append(" WHERE ");
        sql.append("   COURSE_ID = ? ");
        return sql.toString();
    }

    
//    public List<Equipment> selectAll() {
//        List<Equipment> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(Equipment.class));
//        return resultList;
//    }

    
//    public Equipment selectById(String deptId) {
//        StringBuilder sql = new StringBuilder();
//        sql.append(SQL_SELECT);
//        sql.append(" WHERE ");
//        sql.append("   COURSE_ID = ? ");
//        List<Equipment> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(Equipment.class), new Object[ {deptId });
//        return  list!=null&& list.size()>0? list.get(0):new Equipment() ;
//    }
    
//    public Equipment selectByCode(String code) {
//        StringBuilder sql = new StringBuilder();
//        sql.append(SQL_SELECT);
//        sql.append(" WHERE ");
//        sql.append("   COURSE_CODE = ? ");
//        List<Equipment> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(Equipment.class), new Object[ {code });
//        return  list!=null&& list.size()>0? list.get(0):new Equipment() ;
//    }

    
    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_equipment ( ");
        sql.append(" DEPT_CODE  	      ");
        sql.append(", EQ_CODE  	      ");
        sql.append(", EQ_TYPE  	      ");
        sql.append(", AREA_REP  	      ");
        sql.append(", AREA_SUP  	      ");
        sql.append(", AREA_SEC  	      ");
        sql.append(", EMAIL_CC          ");     
        sql.append(", SERIAL_NO  	      ");
        sql.append(", MODEL 		      ");
        sql.append(", BRAND  		      ");
        sql.append(", MEASURE_RANGE     ");
        sql.append(", CAL_STANDARD      ");
        sql.append(", SERVICED_BY       ");
        sql.append(", CAL_TIME  	      ");
        sql.append(", CAL_UNIT  	      ");
        sql.append(", CAL_CRITERIA      ");
        sql.append(",CREATE_BY        ");
        sql.append(",CREATE_DATE      ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, GETDATE() ) ");
        return sql.toString();
    }

    public int insert(Equipment inv) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { 
						inv.getDeptCode() ,
						inv.getEqCode() ,
						inv.getEqTypeCode(),
						inv.getAreaRep(),
						inv.getAreaSup(),
						inv.getAreaSec(),
						inv.getEmailCC(),
						inv.getSerialNo(),
						inv.getModel(),
						inv.getBrand(),
						inv.getMeasureRange(),
						inv.getCalStandard(),
						inv.getServicedBy(),
						inv.getCalTime(),
						inv.getCalUnit(),
						inv.getCalCriteria(),
						inv.getCreateBy()
						});
        return insertRecord.intValue();
    }
    
    
    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_equipment ");
        sql.append(" SET ");
        sql.append(" DEPT_CODE  	=?     ");
//        sql.append(", EQ_CODE  	    =? ");
        sql.append(", EQ_TYPE  	    =? ");
        sql.append(", AREA_REP  	=?     ");
        sql.append(", AREA_SUP  	=?     ");
        sql.append(", AREA_SEC  	=?     ");
        sql.append(", EMAIL_CC      =?   ");     
        sql.append(", SERIAL_NO  	=?     ");
        sql.append(", MODEL 		=?     ");
        sql.append(", BRAND  		=?     ");
        sql.append(", MEASURE_RANGE =?   ");
        sql.append(", CAL_STANDARD  =?   ");
        sql.append(", SERVICED_BY   =?   ");
        sql.append(", CAL_TIME  	=?     ");
        sql.append(", CAL_UNIT  	=?     ");
        sql.append(", CAL_CRITERIA  =?   ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append(" WHERE ");
        sql.append("   ID = ? ");
        return sql.toString();
    }
    public int update(Equipment inv) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] {  
						inv.getDeptCode() ,
//						inv.getEqCode() ,
						inv.getEqTypeCode(),
						inv.getAreaRep(),
						inv.getAreaSup(),
						inv.getAreaSec(),
						inv.getEmailCC(),
						inv.getSerialNo(),
						inv.getModel(),
						inv.getBrand(),
						inv.getMeasureRange(),
						inv.getCalStandard(),
						inv.getServicedBy(),
						inv.getCalTime(),
						inv.getCalUnit(),
						inv.getCalCriteria(),
						inv.getUpdateBy   (),
						inv.getId() });
        return updateRecord;
    }
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public Equipment mapRow(ResultSet rs, int rowNum) throws SQLException {
			Equipment m = new Equipment();
			m.setId (rs.getInt("ID"));
			

			m.setDeptCode(rs.getString("DEPT_CODE"));
			m.setDeptName(rs.getString("DEPT_NAME"));
			m.setEqCode(rs.getString("EQ_CODE"));
			m.setEqTypeCode(rs.getString("EQ_TYPE"));
			m.setEqTypeName(rs.getString("EQ_TYPE_NAME"));
			m.setAreaRep(rs.getString("AREA_REP"));
			m.setAreaSup(rs.getString("AREA_SUP"));
			m.setAreaSec(rs.getString("AREA_SEC"));
			m.setEmailCC(rs.getString("EMAIL_CC"));
			m.setSerialNo(rs.getString("SERIAL_NO"));
			m.setModel(rs.getString("MODEL"));
			m.setBrand(rs.getString("BRAND"));
			m.setMeasureRange(rs.getString("MEASURE_RANGE"));
			m.setCalStandard(rs.getString("CAL_STANDARD"));
			m.setServicedBy(rs.getString("SERVICED_BY"));
			m.setCalTime(rs.getString("CAL_TIME"));
			m.setCalUnit(rs.getString("CAL_UNIT"));
			m.setCalCriteria(rs.getString("CAL_CRITERIA"));
			
//			m.setServicedByName(rs.getString("SERVICED_BY"));
//			m.setCalTimeStd(rs.getString("CAL_TIME_STD"));
			
			m.setLastCalDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("LAST_CAL_DATE"))); 

			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setActiveFlg(rs.getString("STATUS")); 
//			m.setActive(rs.getString("ACTIVE")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			
			return m;
		}
    };
    
    public DataTableAjax<Equipment> getDataTable(Equipment param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  ");
		 sql.append(" , dbo.GetParamDesc(a.DEPT_CODE,'DEPARTMENT','TH')  DEPT_NAME  ");
		 sql.append(" , dbo.GetParamDesc(a.EQ_TYPE,'EQUIPMENT_TYPE','TH')  EQ_TYPE_NAME  ");
		 sql.append(" , a.CAL_TIME +' ' + dbo.GetParamDesc(a.CAL_UNIT,'CAL_TIME_UNIT','TH')  CAL_TIME_STD  ");
		 sql.append("   FROM she_equipment a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getDeptCode())){
			wh.add( param.getDeptCode() );
			sql.append(" AND a.DEPT_CODE =  ? ");
		}
		if(StringUtils.isNotEmpty(param.getEqCode())){
			wh.add( param.getEqCode() );
			sql.append(" AND a.EQ_CODE =  ? ");
		}
		if(StringUtils.isNotEmpty(param.getEqTypeCode())){
			wh.add( param.getEqTypeCode() );
			sql.append(" AND a.EQ_TYPE =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getActiveFlg())){
			wh.add( param.getActiveFlg() );
			sql.append(" AND ACTIVE =  ? ");
		}
		
		sql.append(" ORDER BY DEPT_CODE, EQ_CODE desc ");
		
//		System.out.println(sql.toString()); 
		
		List<Equipment> list = (List<Equipment>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
    
    
    public int delete(Integer id) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {id});
        return deleteRecord;
    }


	public Equipment verify(Equipment util) {
		  StringBuilder sql = new StringBuilder();
		  sql.append(" SELECT a.*  FROM she_equipment a  WHERE 1=1 ");
	      sql.append(" AND  a.EQ_CODE = ?  ");
	      List<Equipment> list = jdbcTemplate.query(sql.toString(),
	    		  BeanPropertyRowMapper.newInstance(Equipment.class), new Object[] {util.getEqCode()});
	      return  list!=null&& list.size()>0? list.get(0):new Equipment() ;
	}

	

}

