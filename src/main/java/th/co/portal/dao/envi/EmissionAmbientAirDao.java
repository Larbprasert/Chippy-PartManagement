package th.co.portal.dao.envi;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.UtilityEnergyInv;

@Repository("EmissionAmbientAirDao")
public class EmissionAmbientAirDao extends AbstractCommonJdbcDao {
	protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
	
    public DataTableAjax<EmissionAmbientAir> getDataTable(EmissionAmbientAir param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT * FROM she_emission_ambient_air WHERE 1 = 1");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getPeriodFrom())){
			wh.add( param.getPeriodFrom() );
			sql.append(" AND period >=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPeriodTo())){
			wh.add( param.getPeriodTo() );
			sql.append(" AND period <=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyName())){
			wh.add( param.getCompanyName() );
			sql.append(" AND company_code =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getParameter_code())){
			wh.add( param.getParameter_code() );
			sql.append(" AND parameter_code = ? ");
		}

		
		sql.append(" ORDER BY period desc ");
		
		List<EmissionAmbientAir> list = (List<EmissionAmbientAir>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
	
    public ChartResponse<EmissionAmbientAir> getDataChart(EmissionAmbientAir param) {
    	ChartResponse result = new ChartResponse<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT * FROM she_emission_ambient_air WHERE 1 = 1");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getPeriodFrom())){
			wh.add( param.getPeriodFrom() );
			sql.append(" AND period >=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPeriodTo())){
			wh.add( param.getPeriodTo() );
			sql.append(" AND period <=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyName())){
			wh.add( param.getCompanyName() );
			sql.append(" AND company_code =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getParameter_code())){
			wh.add( param.getParameter_code() );
			sql.append(" AND parameter_code = ? ");
		}
		sql.append(" ORDER BY period ASC ");
		
		List<EmissionAmbientAir> list = (List<EmissionAmbientAir>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		result.setData(list);
		return result;

    }
    
    public EmissionAmbientAir verifyData(EmissionAmbientAir param) {
    	EmissionAmbientAir result = new EmissionAmbientAir();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" select count (1) from she_emission_ambient_air where 1=1  ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getPeriod())){
			wh.add( param.getPeriod() );
			sql.append(" AND period =   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyName())){
			wh.add( param.getCompanyName() );
			sql.append(" AND company_code =  ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getParameter_code())){
			wh.add( param.getParameter_code() );
			sql.append(" AND parameter_code = ? ");
		}
		if (param.getId() != null ){
			if(StringUtils.isNotEmpty(Integer.toString(param.getId()))){
				wh.add( Integer.toString(param.getId()) );
				sql.append(" AND id <> ? ");
			}
		}
		
		int  count = executeQueryForObject(sql.toString(), wh.toArray(),Integer.class);
		result.setStatus(Integer.toString(count));
		return result;

    }

    public int insert(EmissionAmbientAir air) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { air.getPeriod(),
						air.getCompanyName(),
						air.getParameter_code(),
						air.getPlant_min(),
						air.getPlant_max(),
						air.getNongfab_min(),
						air.getNongfab_max(),
						air.getChkl_min(),
						air.getChkl_max(),
						air.getCreateBy()
						});
        return insertRecord.intValue();
    }
    public int update(EmissionAmbientAir air) {
  		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
  				new Object[] {  
  						air.getPeriod(),
  						air.getPlant_min(),
  						air.getPlant_max(),
  						air.getNongfab_min(),
  						air.getNongfab_max(),
  						air.getChkl_min(),
  						air.getChkl_max(),
  						air.getUpdateBy   (),
  						air.getId() });
          return updateRecord;
      }
    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_emission_ambient_air ( ");
        sql.append(" PERIOD              ");
        sql.append(",COMPANY_CODE      ");
        sql.append(",PARAMETER_CODE       ");
        sql.append(",PLANT_MIN      ");
        sql.append(",PLANT_MAX 		 ");
        sql.append(",NONGFAB_MIN     ");
        sql.append(",NONGFAB_MAX 		 ");
        sql.append(",CHKL_MIN 	   ");
        sql.append(",CHKL_MAX 		 ");
        sql.append(",CREATE_DATE      ");
        sql.append(",CREATE_BY        ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,GETDATE(),?) ");
        return sql.toString();
    }
    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_emission_ambient_air ");
        sql.append(" SET ");
        sql.append(" PERIOD    =?  ");   
        sql.append(" ,PLANT_MIN    =?   ");
        sql.append(" ,PLANT_MAX 	 =?	 ");
        sql.append(" ,NONGFAB_MIN =?     ");
        sql.append(" ,NONGFAB_MAX =? 		 ");
        sql.append(" ,CHKL_MIN 	 =?   ");
        sql.append(" ,CHKL_MAX  =?		 ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append(" WHERE ");
        sql.append("   ID = ? ");
        return sql.toString();
    }
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public EmissionAmbientAir mapRow(ResultSet rs, int rowNum) throws SQLException {
			EmissionAmbientAir m = new EmissionAmbientAir();
			m.setId (rs.getInt("ID"));
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setPeriod(rs.getString("PERIOD"));
			m.setParameter_code(rs.getString("PARAMETER_CODE"));
			m.setPlant_min(rs.getBigDecimal("PLANT_MIN"));
			m.setPlant_max(rs.getBigDecimal("PLANT_MAX"));
			m.setNongfab_min(rs.getBigDecimal("NONGFAB_MIN"));
			m.setNongfab_max(rs.getBigDecimal("NONGFAB_MAX"));
			m.setChkl_min(rs.getBigDecimal("CHKL_MIN"));
			m.setChkl_max(rs.getBigDecimal("CHKL_MAX"));
			
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



}
