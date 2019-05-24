package th.co.portal.dao.envi;

import java.sql.Array;
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
import th.co.portal.model.envi.EmissionStackResult;

@Repository("emissionStackDao")
public class EmissionStackResultDao extends AbstractCommonJdbcDao {
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	
	  @Autowired
	  private JdbcTemplate jdbcTemplate;
	  
	  public DataTableAjax<EmissionStackResult> getDataTable(EmissionStackResult param,String[] stackArr) {
		  DataTableAjax result = new DataTableAjax<>();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select st.*,sy.value_2 STACK from she_emmission_stack_result st ");
			sql.append(" right join sys_param sy on ");
			sql.append(" st.stack_no =  sy.value_2 ");
			
			List wh = new ArrayList<>();
			 
			if(StringUtils.isNotEmpty(param.getYear())){
				wh.add( param.getYear() );
				sql.append(" AND YEAR =   ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getCompanyName())){
				wh.add( param.getCompanyName() );
				sql.append(" AND company_code =  ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getParameter_code())){
				wh.add( param.getParameter_code() );
				sql.append(" AND parameter_code = ? ");
			}
			sql.append(" WHERE 1=1 ");
			
			if(stackArr != null){
				String stm = " AND sy.value_1 in  ( ";
				for (int i = 0; i < stackArr.length; i++) {
					stm = stm + "'"+stackArr[i]+"'";
		            if (stackArr.length> i + 1) {
		            	stm = stm +", ";
		            }
		        }
				stm =  stm +" ) ";
				//System.out.println("state ment "+stm );
				sql.append( stm );
				//sql.append(" AND sy.param_id in ( 2924,2925,2926,2927,2928,2929 ) ");

			}
			System.out.println("state ment "+sql.toString() );
			
			//sql.append(" ORDER BY period desc ");
			
			List<EmissionStackResult> list = (List<EmissionStackResult>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
		  
	  }
	  
	    public ChartResponse<EmissionStackResult> getDataChart(EmissionStackResult param) {
	    	ChartResponse result = new ChartResponse<>();
			
			StringBuilder sql = new StringBuilder();
			 sql.append(" SELECT ID,YEAR,COMPANY_CODE,PARAMETER_CODE,STACK_NO STACK,O2_1ST,O2_2ND,EMISSION_1ST,EMISSION_2ND, "
			 		+ " CREATE_DATE,CREATE_BY,UPDATE_DATE,UPDATE_BY  FROM she_emmission_stack_result WHERE 1 = 1 ");
			
			List wh = new ArrayList<>();
			 
			if(StringUtils.isNotEmpty(param.getYearFrom()) && !param.getYearFrom().equals("123")){
				wh.add( param.getYearFrom() );
				sql.append(" AND year >=   ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getYearTo()) && !param.getYearTo().equals("123") ){
				wh.add( param.getYearTo() );
				sql.append(" AND year <=   ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getCompanyName())){
				wh.add( param.getCompanyName() );
				sql.append(" AND company_code =  ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getParameter_code())){
				wh.add( param.getParameter_code() );
				sql.append(" AND parameter_code = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getStackNo())){
				wh.add( param.getStackNo() );
				sql.append(" AND stack_no = ? ");
			}
			
			sql.append(" ORDER BY year ASC ");
			List<EmissionStackResult> list = (List<EmissionStackResult>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
			result.setData(list);
			return result;

	    }
	  
	  
	  public int insert(EmissionStackResult air) {
			Long insertRecord = executeInsert(SQL_INSERT,
					new Object[] { air.getYear(),
							air.getCompanyName(),
							air.getParameter_code(),
							air.getStackNo(),
							air.getO2_1st(),
							air.getO2_2nd(),
							air.getEmission_1st(),
							air.getEmission_2nd(),
							air.getCreateBy()
							});
	        return insertRecord.intValue();
	    }
	    public int update(EmissionStackResult air) {
	  		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
	  				new Object[] {  
							air.getO2_1st(),
							air.getO2_2nd(),
							air.getEmission_1st(),
							air.getEmission_2nd(),
	  						air.getUpdateBy   (),
	  						air.getId() });
	          return updateRecord;
	      }
	  
	  public String getStackbyParameter(String param){
		  param = "STACK_PARAM_"+param;
		  String sql = "select value_2 from  sys_param where param_code = ? " ;
		  
		  String stack = jdbcTemplate.queryForObject( sql, new Object[] { param }, String.class);
		 
		  return stack;
	  }
	  
	    private RowMapper DB_ROW_MAPPER = new RowMapper(){
			@Override
			public EmissionStackResult mapRow(ResultSet rs, int rowNum) throws SQLException {
				EmissionStackResult m = new EmissionStackResult();
				m.setId (rs.getInt("ID"));
				m.setCompanyCode(rs.getString("COMPANY_CODE"));
				m.setYear(rs.getString("YEAR"));
				m.setParameter_code(rs.getString("PARAMETER_CODE"));
				m.setStackNo(rs.getString("STACK"));
				m.setO2_1st(rs.getBigDecimal("O2_1ST"));
				m.setO2_2nd(rs.getBigDecimal("O2_2ND"));
				m.setEmission_1st(rs.getBigDecimal("EMISSION_1ST"));
				m.setEmission_2nd(rs.getBigDecimal("EMISSION_2ND"));
				
				m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
				m.setCreateDate(rs.getDate("CREATE_DATE"));
				m.setUpdateBy(rs.getString("UPDATE_BY")); 
//				m.setActiveFlg(rs.getString("STATUS")); 
//				m.setActive(rs.getString("ACTIVE")); 
				m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
				m.setUpdateDate(rs.getDate("UPDATE_DATE"));

				return m;
			}
	    };
	    private final static String buildInsertStatement() {
	        StringBuilder sql = new StringBuilder();
	        sql.append(" INSERT INTO she_emmission_stack_result ( ");
	        sql.append(" YEAR              ");
	        sql.append(",COMPANY_CODE      ");
	        sql.append(",PARAMETER_CODE       ");
	        sql.append(",STACK_NO      ");
	        sql.append(",O2_1ST 		 ");
	        sql.append(",O2_2ND     ");
	        sql.append(",EMISSION_1ST 		 ");
	        sql.append(",EMISSION_2ND 	   ");
	        sql.append(",CREATE_DATE      ");
	        sql.append(",CREATE_BY        ");
	        sql.append(" ) ");
	        sql.append(" VALUES (?,?,?,?,?,?,?,?,GETDATE(),?) ");
	        return sql.toString();
	    }
	    private final static String buildUpdateStatement() {
	        StringBuilder sql = new StringBuilder();
	        sql.append(" UPDATE she_emmission_stack_result ");
	        sql.append(" SET ");
	        sql.append(" O2_1ST    =?  ");   
	        sql.append(" ,O2_2ND    =?   ");
	        sql.append(" ,EMISSION_1ST 	 =?	 ");
	        sql.append(" ,EMISSION_2ND =?     ");
	        sql.append("   ,UPDATE_DATE = GETDATE() ");
	        sql.append("   ,UPDATE_BY = ? ");
	        sql.append(" WHERE ");
	        sql.append("   ID = ? ");
	        return sql.toString();
	    }

}
