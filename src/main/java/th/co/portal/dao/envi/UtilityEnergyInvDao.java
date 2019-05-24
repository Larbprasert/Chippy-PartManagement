
package th.co.portal.dao.envi;

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
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.UtilityEnergyInv;

@Repository("UtilityEnergyInvDao")
public class UtilityEnergyInvDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
//    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();
//
//    private final static String buildSelectStatement() {
//        StringBuilder sql = new StringBuilder();
//        sql.append(" SELECT a.*, CONVERT(VARCHAR, a.COURSE_DATE, 103 ) COURSE_DATE_STR ");
//        sql.append(" , dbo.GetParamDesc(a.COURSE_TYPE,'COURSE_TYPE','TH') COURSE_TYPE_DESC ");
//        sql.append(" , dbo.GetParamDesc(A.STATUS,'ACTIVE_TYPE','TH') ACTIVE");
//        sql.append(" FROM she_util_energy_inv a ");
//        return sql.toString();
//    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM she_util_energy_inv ");
        sql.append(" WHERE ");
        sql.append("   COURSE_ID = ? ");
        return sql.toString();
    }

    
//    public List<UtilityEnergyInv> selectAll() {
//        List<UtilityEnergyInv> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(UtilityEnergyInv.class));
//        return resultList;
//    }

    
//    public UtilityEnergyInv selectById(String deptId) {
//        StringBuilder sql = new StringBuilder();
//        sql.append(SQL_SELECT);
//        sql.append(" WHERE ");
//        sql.append("   COURSE_ID = ? ");
//        List<UtilityEnergyInv> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(UtilityEnergyInv.class), new Object[ {deptId });
//        return  list!=null&& list.size()>0? list.get(0):new UtilityEnergyInv() ;
//    }
    
//    public UtilityEnergyInv selectByCode(String code) {
//        StringBuilder sql = new StringBuilder();
//        sql.append(SQL_SELECT);
//        sql.append(" WHERE ");
//        sql.append("   COURSE_CODE = ? ");
//        List<UtilityEnergyInv> list = jdbcTemplate.query(sql.toString(), BeanPropertyRowMapper.newInstance(UtilityEnergyInv.class), new Object[ {code });
//        return  list!=null&& list.size()>0? list.get(0):new UtilityEnergyInv() ;
//    }

    
    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_util_energy_inv ( ");
        sql.append(" YEAR              ");
        sql.append(",COMPANY_CODE      ");
        sql.append(",PRODUCT_VAL       ");
        sql.append(",ELEC_CON_VAL      ");
        sql.append(",ELEC_FACTOR 		 ");
        sql.append(",WATER_CON_VAL     ");
        sql.append(",WATER_FACTOR 		 ");
        sql.append(",STEAM_CON_VAL 	   ");
        sql.append(",STEAM_FACTOR 		 ");
        sql.append(",CREATE_DATE      ");
        sql.append(",CREATE_BY        ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,GETDATE(),?) ");
        return sql.toString();
    }

    public int insert(UtilityEnergyInv inv) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { inv.getYear(),
						inv.getCompanyCode() , 
						inv.getProductVal().doubleValue(),
						inv.getElecConVal().doubleValue(),
						inv.getElecFactor().doubleValue(),
						inv.getWaterConVal().doubleValue(),
						inv.getWaterFactor().doubleValue(),
						inv.getSteamConVal().doubleValue(),
						inv.getSteamFactor().doubleValue(),
						inv.getCreateBy()
						});
        return insertRecord.intValue();
    }
    
    
    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_util_energy_inv ");
        sql.append(" SET ");
        sql.append(" PRODUCT_VAL    =?  ");   
        sql.append(" ,ELEC_CON_VAL    =?   ");
        sql.append(" ,ELEC_FACTOR 	 =?	 ");
        sql.append(" ,WATER_CON_VAL =?     ");
        sql.append(" ,WATER_FACTOR =? 		 ");
        sql.append(" ,STEAM_CON_VAL 	 =?   ");
        sql.append(" ,STEAM_FACTOR  =?		 ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append(" WHERE ");
        sql.append("   ID = ? ");
        return sql.toString();
    }
    public int update(UtilityEnergyInv inv) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] {  
						inv.getProductVal().doubleValue() , 
						inv.getElecConVal().doubleValue(),
						inv.getElecFactor().doubleValue(),
						inv.getWaterConVal().doubleValue(),
						inv.getWaterFactor().doubleValue(),
						inv.getSteamConVal().doubleValue(),
						inv.getSteamFactor().doubleValue(),
						inv.getUpdateBy   (),
						inv.getId() });
        return updateRecord;
    }
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public UtilityEnergyInv mapRow(ResultSet rs, int rowNum) throws SQLException {
			UtilityEnergyInv m = new UtilityEnergyInv();
			m.setId (rs.getInt("ID"));
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setYear(rs.getString("YEAR"));
//			m.setFromYear(rs.getString("COURSE_NAME_TH"));			
//			m.setToYear(rs.getString("COURSE_NAME_TH"));
			m.setProductVal(rs.getBigDecimal("PRODUCT_VAL"));
			m.setElecConVal(rs.getBigDecimal("ELEC_CON_VAL"));
//			m.setElecCo2Val(rs.getBigDecimal("ELEC_CO2_VAL"));
//			m.setElecCo2TonVal(rs.getBigDecimal("ELEC_CO2TON_VAL"));
			m.setWaterConVal(rs.getBigDecimal("WATER_CON_VAL"));
//			m.setWaterCo2Val(rs.getBigDecimal("WATER_CO2_VAL"));
//			m.setWaterCo2TonVal(rs.getBigDecimal("WATER_CO2TON_VAL"));
			m.setSteamConVal(rs.getBigDecimal("STEAM_CON_VAL"));
//			m.setSteamCo2Val(rs.getBigDecimal("STEAM_CO2_VAL"));
//			m.setSteamCo2TonVal(rs.getBigDecimal("STEAM_CO2TON_VAL"));
			m.setElecFactor(rs.getBigDecimal("ELEC_FACTOR"));
			m.setWaterFactor(rs.getBigDecimal("WATER_FACTOR"));
			m.setSteamFactor(rs.getBigDecimal("STEAM_FACTOR"));
			
			
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setActiveFlg(rs.getString("STATUS")); 
//			m.setActive(rs.getString("ACTIVE")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			
			/** Calculate and set all value ***/
			m.calTotal();
			
			return m;
		}
    };
    
    public DataTableAjax<UtilityEnergyInv> getDataTable(UtilityEnergyInv param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  FROM she_util_energy_inv a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getFromYear())){
			wh.add( param.getFromYear() );
			sql.append(" AND a.YEAR >=  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyName())){
			wh.add( param.getCompanyName() );
			sql.append(" AND a.COMPANY_CODE =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getToYear())){
			wh.add( param.getToYear() );
			sql.append(" AND a.YEAR <=  ? ");
		}
		
//		if(StringUtils.isNotEmpty(param.getActiveFlg())){
//			wh.add( param.getActiveFlg() );
//			sql.append(" AND ACTIVE =  ? ");
//		}
		
		sql.append(" ORDER BY year desc ");
		
//		System.out.println(sql.toString()); 
		
		List<UtilityEnergyInv> list = (List<UtilityEnergyInv>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
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


	public UtilityEnergyInv verify(UtilityEnergyInv util) {
		  StringBuilder sql = new StringBuilder();
		  sql.append(" SELECT a.*  FROM she_util_energy_inv a  WHERE 1=1 ");
	      sql.append(" WHERE  a.YEAR = ?  AND a.COMPANY_CODE = ? ");
	      List<UtilityEnergyInv> list = jdbcTemplate.query(sql.toString(),
	    		  BeanPropertyRowMapper.newInstance(UtilityEnergyInv.class), new Object[] {util.getYear(),util.getCompanyCode()});
	      return  list!=null&& list.size()>0? list.get(0):new UtilityEnergyInv() ;
	}
	
    public ChartResponse<UtilityEnergyInv> getDataChart(UtilityEnergyInv param) {
    	ChartResponse result = new ChartResponse<>();
    	
    	StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  FROM she_util_energy_inv a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getFromYear())  && !param.getFromYear().equals("123")){
			wh.add( param.getFromYear() );
			sql.append(" AND a.YEAR >=  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyName())){
			wh.add( param.getCompanyName() );
			sql.append(" AND a.COMPANY_CODE =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getToYear()) && !param.getToYear().equals("123") ){
			wh.add( param.getToYear() );
			sql.append(" AND a.YEAR <=  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getYear()) ){
			wh.add( param.getYear() );
			sql.append(" AND a.YEAR =  ? ");
		}
		
		sql.append(" ORDER BY year ASC ");
		
		List<UtilityEnergyInv> list = (List<UtilityEnergyInv>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		result.setData(list);
		return result;
    	
    }

	

}

