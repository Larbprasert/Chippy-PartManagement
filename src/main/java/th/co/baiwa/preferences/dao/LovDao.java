package th.co.baiwa.preferences.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
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

}
