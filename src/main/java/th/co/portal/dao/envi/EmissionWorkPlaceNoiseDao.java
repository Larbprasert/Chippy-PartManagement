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

import com.mysql.jdbc.log.Log;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.portal.model.envi.EmissionAmbientAir;
import th.co.portal.model.envi.EmissionAmbientAir24;
import th.co.portal.model.envi.EmissionWorkPlaceAir;
import th.co.portal.model.envi.EmissionWorkPlaceNoise;
import th.co.portal.model.envi.SystemParam;

@Repository("EmissionWorkPlaceNoiseDao")
public class EmissionWorkPlaceNoiseDao extends AbstractCommonJdbcDao {
	
    @Autowired
    private JdbcTemplate jdbcTemplate;
	
	public DataTableAjax<EmissionWorkPlaceNoise> getDataTable(EmissionWorkPlaceNoise param){
		DataTableAjax result = new DataTableAjax<>();
		List whList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ewn.* FROM she_emmission_workplace_noise ewn ");
		sql.append(" WHERE 1 = 1 ");
		if(StringUtils.isNotEmpty(param.getPeriodFrom())){
			whList.add( param.getPeriodFrom() );
			sql.append(" AND ewn.PERIOD >=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getPeriodTo())){
			whList.add( param.getPeriodTo() );
			sql.append(" AND ewn.PERIOD <=   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyCode())){
			whList.add( param.getCompanyCode() );
			sql.append(" AND ewn.COMPANY_CODE =  ? ");
		}
		/*
		if(StringUtils.isNotEmpty(param.getParameterCode())){
			whList.add( param.getParameterCode() );
			sql.append(" AND ewnPARAMETER_CODE = ? ");
		}*/
		if(StringUtils.isNotEmpty(param.getSamplingPoint())){
			whList.add( param.getSamplingPoint() );
			sql.append(" AND ewn.PLANT_CODE = ? ");
		}
		sql.append(" ORDER BY ewn.PERIOD desc ");
		List<EmissionWorkPlaceNoise> list = (List<EmissionWorkPlaceNoise>) executeQuery(sql.toString(), whList.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
	private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public EmissionWorkPlaceNoise mapRow(ResultSet rs, int rowNum) throws SQLException {
			EmissionWorkPlaceNoise m = new EmissionWorkPlaceNoise();
			m.setId (rs.getInt("ID"));
			m.setPeriod(rs.getString("PERIOD"));
			m.setSampling1Frist(rs.getBigDecimal("SAMPLING1_1ST"));
			m.setSampling1Second(rs.getBigDecimal("SAMPLING1_2ND"));
			m.setSampling1Third(rs.getBigDecimal("SAMPLING1_3RD")); 
			m.setSampling1Fourth(rs.getBigDecimal("SAMPLING1_4TH"));
			m.setSampling2Frist(rs.getBigDecimal("SAMPLING2_1ST"));
			m.setSampling2Second(rs.getBigDecimal("SAMPLING2_2ND"));
			m.setSampling2Third(rs.getBigDecimal("SAMPLING2_3RD")); 
			m.setSampling2Fourth(rs.getBigDecimal("SAMPLING2_4TH"));
			m.setSampling3Frist(rs.getBigDecimal("SAMPLING3_1ST")); 
			m.setSampling3Second(rs.getBigDecimal("SAMPLING3_2ND"));
			m.setSampling3Third(rs.getBigDecimal("SAMPLING3_3RD")); 
			m.setSampling3Fourth(rs.getBigDecimal("SAMPLING3_4TH"));
			m.setSamplingPoint(rs.getString("PLANT_CODE")); 
			m.setCompanyCode(rs.getString("COMPANY_CODE"));
			m.setParameterCode(rs.getString("PARAMETER_CODE"));
			return m;
		}
    };
	public String insertData(EmissionWorkPlaceNoise param) {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO she_emmission_workplace_noise ( ");
		sql.append(" PERIOD          ");
		sql.append(" , COMPANY_CODE  ");
		sql.append(" , PARAMETER_CODE ");
		sql.append(" , PLANT_CODE    ");
		sql.append(" , SAMPLING1_1ST ");
		sql.append(" , SAMPLING1_2ND ");
		sql.append(" , SAMPLING1_3RD ");
		sql.append(" , SAMPLING1_4TH ");
		sql.append(" , SAMPLING2_1ST ");
		sql.append(" , SAMPLING2_2ND ");
		sql.append(" , SAMPLING2_3RD ");
		sql.append(" , SAMPLING2_4TH ");
		sql.append(" , SAMPLING3_1ST ");
		sql.append(" , SAMPLING3_2ND ");
		sql.append(" , SAMPLING3_3RD ");
		sql.append(" , SAMPLING3_4TH ");
		sql.append(" , CREATE_DATE   ");
		sql.append(" , CREATE_BY     ");
		sql.append(" , UPDATE_DATE   ");
		sql.append(" , UPDATE_BY  )  ");
		sql.append("	VALUES (      ");
		sql.append("	? , ? , ? , ? , ? , ? , ?   ");
		sql.append("	, ? , ? , ? , ? , ? , ? , ?  ");
		sql.append("	, ? , ? , GETDATE() , ? , GETDATE() , ? )    ");
		
		Long insertRecord =  executeInsert(sql.toString()
							, new Object[] {param.getPeriod()
											, param.getCompanyCode()
											, param.getParameterCode()
											, param.getSamplingPoint()
											, param.getSampling1Frist()
											, param.getSampling1Second()
											, param.getSampling1Third()
											, param.getSampling1Fourth()
											, param.getSampling2Frist()
											, param.getSampling2Second()
											, param.getSampling2Third()
											, param.getSampling2Fourth()
											, param.getSampling3Frist()
											, param.getSampling3Second()
											, param.getSampling3Third()
											, param.getSampling3Fourth()
											, param.getCreateBy()
											, param.getUpdateBy()
										}
							);
		return insertRecord.intValue()+"";
	}                 
	
	private RowMapper SYSTEM_MAPPER = new RowMapper() {
		@Override
		public SystemParam mapRow(ResultSet rs, int rowNum) throws SQLException {
			SystemParam sparam = new SystemParam();
			sparam.setCode(rs.getString("CODE"));
			sparam.setName(rs.getString("NAME"));
			sparam.setType(rs.getString("TYPE"));
			return sparam;
		}
	};
	
	public String updateData(EmissionWorkPlaceNoise param) {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE she_emmission_workplace_noise SET ");
		sql.append("  SAMPLING1_1ST = ? 	");
		sql.append(" , SAMPLING1_2ND = ? 	");
		sql.append(" , SAMPLING1_3RD = ?	");
		sql.append(" , SAMPLING1_4TH = ? 	");
		sql.append(" , SAMPLING2_1ST = ? 	");
		sql.append(" , SAMPLING2_2ND = ? 	");
		sql.append(" , SAMPLING2_3RD = ?	");
		sql.append(" , SAMPLING2_4TH = ?	");
		sql.append(" , SAMPLING3_1ST = ?	");
		sql.append(" , SAMPLING3_2ND = ?	");
		sql.append(" , SAMPLING3_3RD = ?	");
		sql.append(" , SAMPLING3_4TH = ?	");
		sql.append(" , UPDATE_DATE = SYSDATETIME()   ");
		sql.append(" , UPDATE_BY 	= ?   ");
		sql.append(" WHERE id = ?   ");
	
		return executeUpdate(sql.toString()
						,new Object[] { 
									 param.getSampling1Frist()
									, param.getSampling1Second()
									, param.getSampling1Third()
									, param.getSampling1Fourth()
									, param.getSampling2Frist()
									, param.getSampling2Second()
									, param.getSampling2Third()
									, param.getSampling2Fourth()
									, param.getSampling3Frist()
									, param.getSampling3Second()
									, param.getSampling3Third()
									, param.getSampling3Fourth()
									, param.getUpdateBy()
									, param.getId()
						}
					)+"";
	}
	
	public int checkDuplicateData(EmissionWorkPlaceNoise param){
		DataTableAjax result = new DataTableAjax<>();
		List whList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ewn.* FROM she_emmission_workplace_noise ewn ");
		sql.append(" WHERE 1 = 1 ");
		if(StringUtils.isNotEmpty(param.getPeriod())){
			whList.add( param.getPeriod() );
			sql.append(" AND ewn.PERIOD =   ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getCompanyCode())){
			whList.add( param.getCompanyCode() );
			sql.append(" AND ewn.COMPANY_CODE =  ? ");
		}
		if(StringUtils.isNotEmpty(param.getSamplingPoint())){
			whList.add( param.getSamplingPoint() );
			sql.append(" AND ewn.PLANT_CODE = ? ");
		}
		sql.append(" ORDER BY ewn.PERIOD desc ");
		List<EmissionWorkPlaceNoise> list = (List<EmissionWorkPlaceNoise>) executeQuery(sql.toString(), whList.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;

		return total;
	}
}
