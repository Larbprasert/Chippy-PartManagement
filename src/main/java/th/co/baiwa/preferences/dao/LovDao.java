package th.co.baiwa.preferences.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.tpcc.model.SysParam;

@Repository("lovDao")
public class LovDao extends AbstractCommonJdbcDao {

	public List<LovInfo> loadAllLov() {
		String sql = "SELECT * FROM  sys_param where active = 'Y' ORDER BY PARAM_TYPE, SORT_NO, PARAM_CODE ";
		return executeQuery(sql, new RowMapper<LovInfo>() {

			@Override
			public LovInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LovInfo info = new LovInfo();
				info.setType(rs.getString("PARAM_TYPE"));
				info.setCode(rs.getString("PARAM_CODE"));
				info.setDescEN(rs.getString("DESC_EN"));
				info.setDescTH(rs.getString("DESC_TH"));
				return info;
			}

		});
	}
	
	public List<SysParam> loadAllParameter() {
		String sql = "SELECT * FROM  sys_param where active = 'Y' ";
		return executeQuery(sql, new RowMapper<SysParam>() {
			
			@Override
			public SysParam mapRow(ResultSet rs, int rowNum) throws SQLException {
				SysParam m = new SysParam();
				m.setParamId(rs.getInt("PARAM_ID")); 
				m.setParamCode(rs.getString("PARAM_CODE")); 
				m.setParamType(rs.getString("PARAM_TYPE")); 
				m.setDescTh(rs.getString("DESC_TH")); 
				m.setDescEn(rs.getString("DESC_EN")); 
				m.setValue_1(rs.getString("VALUE_1")); 
				m.setValue_2(rs.getString("VALUE_2")); 
				m.setActive(rs.getString("ACTIVE"));
				m.setSortNo(rs.getString("SORT_NO"));
				return m;
			}
			
		});
	}
	
//	Load constanst of Partmanagement value to temp server
	public List<LovInfo> loadTimingLov() {
		String sql = "select misc_code,value1 from tbm_misc_data where 1=1 and misc_type = 'Timing' order by misc_code";
		return executeQuery(sql, new RowMapper<LovInfo>() {

			@Override
			public LovInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LovInfo info = new LovInfo();
				info.setCode(rs.getString("misc_code"));
				info.setDescEN(rs.getString("value1"));
				info.setDescTH(rs.getString("value1"));
				return info;
			}

		});
	}
	
	public List<LovInfo> loadActiveFlagLov() {
		String sql = "select misc_code,value1 "
				+ "from tbm_misc_data "
				+ "where 1=1 "
				+ "and misc_type = 'ActiveFlag' "
				+ "and activeFlag = 1 "
				+ "order by misc_code";		
		return executeQuery(sql, new RowMapper<LovInfo>() {
			
			@Override
			public LovInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LovInfo info = new LovInfo();
				info.setCode(rs.getString("misc_code"));
				info.setDescEN(rs.getString("value1"));
				info.setDescTH(rs.getString("value1"));
				return info;
			}
			
		});
	}
	
	public List<LovInfo> loadProvince() {
		String sql = "select province_code,province_name_tha from tbm_province order by province_code";		
		return executeQuery(sql, new RowMapper<LovInfo>() {
			
			@Override
			public LovInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LovInfo info = new LovInfo();
				info.setCode(rs.getString("province_code"));
				info.setDescEN(rs.getString("province_name_tha"));
				info.setDescTH(rs.getString("province_name_tha"));
				return info;
			}
			
		});
	}
	
//	Load constanst of Partmanagement value to temp server	
	

}
