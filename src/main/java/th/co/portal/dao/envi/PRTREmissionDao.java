package th.co.portal.dao.envi;

import java.math.BigDecimal;
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
import th.co.portal.model.envi.PRTREmission;
import th.co.portal.model.envi.UtilityEnergyInv;

@Repository("PRTREmissionDao")
public class PRTREmissionDao extends AbstractCommonJdbcDao {
	protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
	
    public DataTableAjax<PRTREmission> getDataTable(String company,String year) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT pe.*, pc.NAME_OF_CHEMICAL FROM she_prtr_emission pe INNER JOIN she_prtr_chemical pc on pc.ID = pe.PRTR_CHEMICAL_ID  WHERE 1 = 1 ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(company)){
			wh.add( company );
			sql.append(" AND COMPANY_CODE >=   ? ");
		}
		
		if(StringUtils.isNotEmpty(year)){
			wh.add( year );
			sql.append(" AND YEAR <=   ? ");
		}
		
		sql.append(" ORDER BY YEAR desc ");
		
		List<PRTREmission> list = (List<PRTREmission>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
	
    public ChartResponse<PRTREmission> getDataChart(PRTREmission param) {
    	ChartResponse result = new ChartResponse<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT * FROM she_emission_ambient_air WHERE 1 = 1");
		
		List wh = new ArrayList<>();
		 
//		if(StringUtils.isNotEmpty(param.getPeriodFrom())){
//			wh.add( param.getPeriodFrom() );
//			sql.append(" AND period >=   ? ");
//		}
//		
//		if(StringUtils.isNotEmpty(param.getPeriodTo())){
//			wh.add( param.getPeriodTo() );
//			sql.append(" AND period <=   ? ");
//		}
//		
//		if(StringUtils.isNotEmpty(param.getCompanyName())){
//			wh.add( param.getCompanyName() );
//			sql.append(" AND company_code =  ? ");
//		}
//		
//		if(StringUtils.isNotEmpty(param.getParameter_code())){
//			wh.add( param.getParameter_code() );
//			sql.append(" AND parameter_code = ? ");
//		}
		sql.append(" ORDER BY period ASC ");
		
		List<PRTREmission> list = (List<PRTREmission>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		result.setData(list);
		return result;

    }

    public int insert(PRTREmission prtrEmission) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { 
  						prtrEmission.getPrtrChemicalId(),
  						prtrEmission.getCunsumpitonQuantity(),
  						prtrEmission.getAirCombustion(),
  						prtrEmission.getAirProcess(),
  						prtrEmission.getAirFugitive(),
  						prtrEmission.getAirTank(),
  						prtrEmission.getAirLoading(),
  						prtrEmission.getAirWwt(),
  						prtrEmission.getAirSpill(),
  						prtrEmission.getWaterWwt(),
  						prtrEmission.getWaterSpill(),
  						prtrEmission.getSolidLand(),
  						prtrEmission.getTransportWaste(),
  						prtrEmission.getTransportRecycle(),
  						prtrEmission.getRemark(),
  						prtrEmission.getYear(),
  						prtrEmission.getStatus(),
  						
  						prtrEmission.getCompanyCode(),
  						prtrEmission.getEmissionVolumTotal(),
  						prtrEmission.getTranspotVolumTotal(),
  						prtrEmission.getAirTotal(),
  						prtrEmission.getWaterTotal(),
  						prtrEmission.getSolidTotal(),

  						prtrEmission.getCreateBy()
						});
		
        
        
        return insertRecord.intValue();
    }
    public int update(PRTREmission prtrEmission) {
  		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
  				new Object[] {  
  						prtrEmission.getPrtrChemicalId(),
  						prtrEmission.getCunsumpitonQuantity(),
  						prtrEmission.getAirCombustion(),
  						prtrEmission.getAirProcess(),
  						prtrEmission.getAirFugitive(),
  						prtrEmission.getAirTank(),
  						prtrEmission.getAirLoading(),
  						prtrEmission.getAirWwt(),
  						prtrEmission.getAirSpill(),
  						prtrEmission.getWaterWwt(),
  						prtrEmission.getWaterSpill(),
  						prtrEmission.getSolidLand(),
  						prtrEmission.getTransportWaste(),
  						prtrEmission.getTransportRecycle(),
  						prtrEmission.getRemark(),
  						prtrEmission.getYear(),
  						prtrEmission.getStatus(),
  						
 						prtrEmission.getCompanyCode(),
  						prtrEmission.getEmissionVolumTotal(),
  						prtrEmission.getTranspotVolumTotal(),
  						prtrEmission.getAirTotal(),
  						prtrEmission.getWaterTotal(),
  						prtrEmission.getSolidTotal(),
  						
  						prtrEmission.getUpdateBy(),
  						prtrEmission.getId() 
  						});
          return updateRecord;
      }
    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO she_prtr_emission ( "); 
        sql.append(" PRTR_CHEMICAL_ID      "); 
        sql.append(" ,CUNSUMPITON_QUANTITY      ");   
        sql.append(" ,AIR_COMBUSTION       ");
        sql.append(" ,AIR_PROCESS 	 	 ");
        sql.append(" ,AIR_FUGITIVE 	 	 ");
        sql.append(" ,AIR_TANK      ");
        sql.append(" ,AIR_LOADING  		 ");
        sql.append(" ,AIR_WWT 	   ");
        sql.append(" ,AIR_SPILL  	 ");
        sql.append(" ,WATER_WWT  	 ");
        sql.append(" ,WATER_SPILL  		 ");       
        sql.append(" ,SOLID_LAND  		 ");
        sql.append(" ,TRANSPORT_WASTE  		 ");
        sql.append(" ,TRANSPORT_RECYCLE  	 ");       
        sql.append(" ,REMARK  		 ");
        sql.append(" ,YEAR  		 ");
        sql.append(" ,STATUS  		 ");
        
        sql.append(" ,COMPANY_CODE  		 ");
        sql.append(" ,EMISSION_VOLUM_TOTAL  		 ");
        sql.append(" ,TRANSPORT_VOLUM_TOTAL  		 ");
        sql.append(" ,AIR_TOTAL  		 ");
        sql.append(" ,WATER_TOTAL  		 ");
        sql.append(" ,SOLID_TOTAL  		 ");
        
        sql.append(",CREATE_DATE      ");
        sql.append(",CREATE_BY        ");
        

        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,GETDATE(),?) ");
        return sql.toString();
    }
    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE she_prtr_emission ");
        sql.append(" SET ");   
        sql.append("  PRTR_CHEMICAL_ID    =?  ");  
        sql.append(" ,CUNSUMPITON_QUANTITY    =?  ");   
        sql.append(" ,AIR_COMBUSTION    =?   ");
        sql.append(" ,AIR_PROCESS 	 =?	 ");
        sql.append(" ,AIR_FUGITIVE 	 =?	 ");
        sql.append(" ,AIR_TANK =?     ");
        sql.append(" ,AIR_LOADING =? 		 ");
        sql.append(" ,AIR_WWT 	 =?   ");
        sql.append(" ,AIR_SPILL  =?		 ");
        sql.append(" ,WATER_WWT  =?		 ");
        sql.append(" ,WATER_SPILL  =?		 ");       
        sql.append(" ,SOLID_LAND  =?		 ");
        sql.append(" ,TRANSPORT_WASTE  =?		 ");
        sql.append(" ,TRANSPORT_RECYCLE  =?		 ");       
        sql.append(" ,REMARK  =?		 ");
        sql.append(" ,YEAR  =?		 ");
        sql.append(" ,STATUS  =?		 ");
        sql.append(" ,COMPANY_CODE  = ?		 ");
        sql.append(" ,EMISSION_VOLUM_TOTAL  = ?		 ");
        sql.append(" ,TRANSPORT_VOLUM_TOTAL  = ?		 ");
        sql.append(" ,AIR_TOTAL  = ?		 ");
        sql.append(" ,WATER_TOTAL = ? 		 ");
        sql.append(" ,SOLID_TOTAL = ? 		 ");
        
        sql.append(" ,UPDATE_DATE = GETDATE() ");
        sql.append(" ,UPDATE_BY = ? ");
        sql.append(" WHERE ");
        sql.append("   ID = ? ");
       
        return sql.toString();
    }


    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public PRTREmission mapRow(ResultSet rs, int rowNum) throws SQLException {
			PRTREmission m = new PRTREmission();
		        
			m.setId (rs.getInt("ID"));
			m.setPrtrChemicalId(rs.getInt("PRTR_CHEMICAL_ID"));
			m.setCunsumpitonQuantity(rs.getString("CUNSUMPITON_QUANTITY"));
			m.setAirCombustion(rs.getBigDecimal("AIR_COMBUSTION"));
			m.setAirProcess(rs.getBigDecimal("AIR_PROCESS"));
			m.setAirFugitive(rs.getBigDecimal("AIR_FUGITIVE"));
			m.setAirTank(rs.getBigDecimal("AIR_TANK"));
			m.setAirLoading(rs.getBigDecimal("AIR_LOADING"));
			m.setAirWwt(rs.getBigDecimal("AIR_WWT"));
			m.setAirSpill(rs.getBigDecimal("AIR_SPILL"));
			m.setWaterWwt(rs.getBigDecimal("WATER_WWT"));
			m.setWaterSpill(rs.getBigDecimal("WATER_SPILL"));
			m.setSolidLand(rs.getBigDecimal("SOLID_LAND"));
			
			m.setTransportWaste(rs.getBigDecimal("TRANSPORT_WASTE"));
			m.setTransportRecycle(rs.getBigDecimal("TRANSPORT_RECYCLE"));
			
			m.setRemark(rs.getString("REMARK"));
			m.setYear(rs.getString("YEAR"));

			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setEmissionVolumTotal(rs.getBigDecimal("EMISSION_VOLUM_TOTAL"));	
			m.setTranspotVolumTotal(rs.getBigDecimal("TRANSPORT_VOLUM_TOTAL"));	
			m.setAirTotal(rs.getBigDecimal("AIR_TOTAL"));	
			m.setWaterTotal(rs.getBigDecimal("WATER_TOTAL"));	
			m.setSolidTotal(rs.getBigDecimal("SOLID_TOTAL"));	

			m.setStatus(rs.getString("STATUS")); 

			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setCreateBy(rs.getString("CREATE_BY"));
			
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));

			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));

			m.setNameOfChemical(rs.getString("NAME_OF_CHEMICAL"));

			return m;
		}
    };


}
