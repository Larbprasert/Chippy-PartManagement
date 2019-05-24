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
import th.co.portal.model.envi.EmissionWWT;
import th.co.portal.model.envi.EmissionWorkPlaceAir;

@Repository("EmissionWWTDao")
public class EmissionWWTDao extends AbstractCommonJdbcDao {
	
    @Autowired
    private JdbcTemplate jdbcTemplate;
	
	public DataTableAjax<EmissionWorkPlaceAir> getDataTable(EmissionWWT param){
		DataTableAjax result = new DataTableAjax<>();
		List whList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ewt.* FROM she_emmission_wwt ewt ");
		sql.append(" WHERE 1 = 1 ");
		if(StringUtils.isNotEmpty(param.getPeriodFrom())){
			whList.add( param.getPeriodFrom() );
			sql.append(" AND ewt.PERIOD >=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPeriodTo())){
			whList.add( param.getPeriodTo() );
			sql.append(" AND ewt.PERIOD <=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getParameterReq())){
			whList.add( param.getParameterReq() );
			sql.append(" AND ewt.PARAMATER = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPlantReq())){
			whList.add( param.getPlantReq() );
			sql.append(" AND ewt.PLANT_CODE = ? ");
		}
		
		sql.append(" ORDER BY ewt.PERIOD desc ");
		List<EmissionWWT> list = (List<EmissionWWT>) executeQuery(sql.toString(), whList.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
	private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public EmissionWWT mapRow(ResultSet rs, int rowNum) throws SQLException {
			EmissionWWT m = new EmissionWWT();
			m.setId (rs.getInt("ID"));
			m.setPeriod(rs.getString("PERIOD"));
			m.setPlantCode(rs.getString("PLANT_CODE"));
			m.setJan(rs.getBigDecimal("JAN"));
			m.setFeb(rs.getBigDecimal("FEB"));
			m.setMar(rs.getBigDecimal("MAR"));
			m.setApr(rs.getBigDecimal("APR"));
			m.setMay(rs.getBigDecimal("MAY"));
			m.setJun(rs.getBigDecimal("JUN"));
			m.setJul(rs.getBigDecimal("JUL"));
			m.setAug(rs.getBigDecimal("AUG"));
			m.setSep(rs.getBigDecimal("SEP"));
			m.setOct(rs.getBigDecimal("OCT"));
			m.setNov(rs.getBigDecimal("NOV"));
			m.setDec(rs.getBigDecimal("DEC"));
			m.setParameterCode(rs.getString("PARAMATER"));
			return m;
		}
    };
	public String insertData(EmissionWWT param) {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO she_emmission_wwt ( ");
		sql.append(" PERIOD          ");
		sql.append(" , PLANT_CODE  ");
		sql.append(" , PARAMATER ");
		sql.append(" , JAN    ");
		sql.append(" , FEB ");
		sql.append(" , MAR ");
		sql.append(" , APR ");
		sql.append(" , MAY ");
		sql.append(" , JUN ");
		sql.append(" , JUL ");
		sql.append(" , AUG ");
		sql.append(" , SEP ");
		sql.append(" , OCT ");
		sql.append(" , NOV ");
		sql.append(" , DEC ");
		sql.append(" , CREATE_DATE   ");
		sql.append(" , CREATE_BY     ");
		sql.append(" , UPDATE_DATE   ");
		sql.append(" , UPDATE_BY  )  ");
		sql.append("	VALUES (      ");
		sql.append("	? , ? , ? , ? , ? , ? , ?   ");
		sql.append("	, ? , ? , ? , ? , ? , ? , ? ,? ");
		sql.append("	, GETDATE() , ? , GETDATE() , ? )    ");
		
		Long insertRecord =  executeInsert(sql.toString()
							, new Object[] {param.getPeriod()
											, param.getPlantCode()
											, param.getParameterCode()
											, param.getJan()
											, param.getFeb()
											, param.getMar()
											, param.getApr()
											, param.getMay()
											, param.getJun()
											, param.getJul()
											, param.getAug()
											, param.getSep()
											, param.getOct()
											, param.getNov()
											, param.getDec()
											, param.getCreateBy()
											, param.getUpdateBy()
										}
							);
		return insertRecord.intValue()+"";
	}                 
	
	public String updateData(EmissionWWT param) {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE she_emmission_wwt SET ");
		sql.append("  JAN = ? 	");
		sql.append(" , FEB = ? 	");
		sql.append(" , MAR = ?	");
		sql.append(" , APR = ? 	");
		sql.append(" , MAY = ? 	");
		sql.append(" , JUN = ? 	");
		sql.append(" , JUL = ?	");
		sql.append(" , AUG = ?	");
		sql.append(" , SEP = ?	");
		sql.append(" , OCT = ?	");
		sql.append(" , NOV = ?	");
		sql.append(" , DEC = ?	");
		sql.append(" , UPDATE_DATE = SYSDATETIME()   ");
		sql.append(" , UPDATE_BY 	= ?   ");
		sql.append(" WHERE id = ?   ");
	
		return executeUpdate(sql.toString()
						,new Object[] { 
									 param.getJan()
									, param.getFeb()
									, param.getMar()
									, param.getApr()
									, param.getMay()
									, param.getJun()
									, param.getJul()
									, param.getAug()
									, param.getSep()
									, param.getOct()
									, param.getNov()
									, param.getDec()
									, param.getUpdateBy()
									, param.getId()
						}
					)+"";
	}
	
	public int checkDuplicateData(EmissionWWT param){
		DataTableAjax result = new DataTableAjax<>();
		List whList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ewt.* FROM she_emmission_wwt ewt ");
		sql.append(" WHERE 1 = 1 ");
		if(StringUtils.isNotEmpty(param.getPeriod())){
			whList.add( param.getPeriod() );
			sql.append(" AND ewt.PERIOD =   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getParameterReq())){
			whList.add( param.getParameterReq() );
			sql.append(" AND ewt.PARAMATER = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPlantCode())){
			whList.add( param.getPlantCode() );
			sql.append(" AND ewt.PLANT_CODE = ? ");
		}
		
		List<EmissionWWT> list = (List<EmissionWWT>) executeQuery(sql.toString(), whList.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;

		return total;
	}
}
