package th.co.tpcc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.SysParam;

@Repository("SysParamDao")
public class SysParamDao extends AbstractCommonJdbcDao{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired
//	private JdbcTemplate jdbcTemplate;
	
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();
	protected final static String SQL_DELETE = buildDeleteStatement();
	
	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO sys_param ( ");
		sql.append("   PARAM_CODE ");
		sql.append("   ,PARAM_TYPE ");
		sql.append("   ,DESC_TH ");
		sql.append("   ,DESC_EN ");
		sql.append("   ,VALUE_1 ");
		sql.append("   ,VALUE_2 ");
		sql.append("   ,ACTIVE ");
		sql.append("   ,SORT_NO ");
		sql.append("   ,CREATE_BY ");
		sql.append("   ,CREATE_DATE ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,?,?,?, GETDATE() ) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE sys_param ");
		sql.append(" SET ");
		sql.append("   PARAM_CODE  = ?");
		sql.append("   ,PARAM_TYPE  = ?");
		sql.append("   ,DESC_TH  = ?");
		sql.append("   ,DESC_EN  = ?");
		sql.append("   ,VALUE_1  = ?");
		sql.append("   ,VALUE_2  = ?");
		sql.append("   ,ACTIVE  = ?");
		sql.append("   ,SORT_NO  = ?");
		sql.append(" WHERE PARAM_ID = ? ");
		return sql.toString();
	}

	private final static String buildDeleteStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM sys_param ");
		sql.append(" WHERE PARAM_ID = ? ");
		return sql.toString();
	}
	
	
	public DataTableAjax<SysParam> queryParameter(SysParam param) {
			DataTableAjax result = new DataTableAjax<>();
			logger.info("queryParameter");
		
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT PARAM_ID   ");
			sql.append(", PARAM_CODE ");
			sql.append(", PARAM_TYPE ");
			sql.append(", DESC_TH    ");
			sql.append(", DESC_EN    ");
			sql.append(", VALUE_1    ");
			sql.append(", VALUE_2    ");
			sql.append(", CREATE_BY  ");
			sql.append(", CREATE_DATE");
			sql.append(", UPDATE_BY  ");
			sql.append(", UPDATE_DATE");
			sql.append(", SORT_NO");
			sql.append(", dbo.GetParamDesc(ACTIVE,'ACTIVE_TYPE','TH') ACTIVE");
			sql.append(" FROM sys_param ");
			sql.append(" WHERE 1=1 ");
			
			List wh = new ArrayList<>();
			if(StringUtils.isNotEmpty(param.getParamCode())){
				wh.add("%"+param.getParamCode()+"%");
				sql.append(" AND PARAM_CODE like ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getParamType())){
				wh.add(param.getParamType());
				sql.append(" AND PARAM_TYPE = ? ");
			}
			
			if(StringUtils.isNotEmpty(param.getDescTh())){
				wh.add("%"+param.getDescTh()+"%");
				wh.add("%"+param.getDescTh()+"%");
				sql.append(" AND ( DESC_TH like ? OR DESC_EN like ? ) ");
			} 
			
			if(StringUtils.isNotEmpty(param.getActive())){
				wh.add(param.getActive());
				sql.append(" AND ACTIVE = ? ");
			}
			
			sql.append(" ORDER BY PARAM_TYPE, SORT_NO, PARAM_CODE DESC ");
			
//			System.out.println(sql.toString());
			
//			int total = getRowCount(sql.toString());
			
//			sql.append(" LIMIT ? , ? ");
			
//			List<SysParam> list = (List<SysParam>) executeQuery(sql.toString(), new Integer[]{start,length}, SYS_PARAM_RM);
//			result.setRecordsTotal(total);
//			result.setRecordsFiltered(total);
//			result.setData(list);
			
			List<SysParam> list = (List<SysParam>) executeQuery(sql.toString(), wh.toArray(), SYS_PARAM_RM);
			int total = list!=null? list.size():0;
			result.setRecordsTotal(total);
			result.setRecordsFiltered(total);
			result.setData(list);
			return result;
	} 
	
	/*public int getRowCount(String sql) {
		List rs = jdbcTemplate.queryForList(sql);
		return rs!=null? rs.size():0;
	}*/

	private RowMapper SYS_PARAM_RM = new RowMapper(){
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
			m.setCreateBy(rs.getString("CREATE_BY")); 
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE"))); 
			m.setActive(rs.getString("ACTIVE"));
			m.setSortNo(rs.getString("SORT_NO"));
			return m;
		}
		
	};

	public SysParam getParameterById(String paramId) {
		logger.info("### getParameterById : "+paramId);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT PARAM_ID   ");
		sql.append(", PARAM_CODE ");
		sql.append(", PARAM_TYPE ");
		sql.append(", DESC_TH    ");
		sql.append(", DESC_EN    ");
		sql.append(", VALUE_1    ");
		sql.append(", VALUE_2    ");
		sql.append(", CREATE_BY  ");
		sql.append(", CREATE_DATE");
		sql.append(", UPDATE_BY  ");
		sql.append(", UPDATE_DATE");
		sql.append(", ACTIVE");
		sql.append(", SORT_NO");
		sql.append(" FROM sys_param ");
		sql.append(" WHERE PARAM_ID = ? ");
		List<SysParam> list = (List<SysParam>) executeQuery(sql.toString(), new String[]{paramId}, SYS_PARAM_RM);
		return list!=null&& list.size()>0? list.get(0):new SysParam() ;
	}

	public SysParam insert(SysParam sysParam) {
		Long sysParamId = executeInsert(SQL_INSERT,
			new Object[] {
					sysParam.getParamCode(),
					sysParam.getParamType(),
					sysParam.getDescTh(),
					sysParam.getDescEn(),
					sysParam.getValue_1(),
					sysParam.getValue_2(),
					sysParam.getActive(),
					sysParam.getSortNo(),
					sysParam.getCreateBy()
			}
		);
		sysParam.setParamId(sysParamId.intValue());
		return sysParam;
	}

	public int update(SysParam sysParam) {
		int updateRecord = getJdbcTemplate().update(SQL_UPDATE,
			new Object[] {
				sysParam.getParamCode(),
				sysParam.getParamType(),
				sysParam.getDescTh(),
				sysParam.getDescEn(),
				sysParam.getValue_1(),
				sysParam.getValue_2(),
				sysParam.getActive(),
				sysParam.getSortNo(),
				sysParam.getParamId()
			}
		);
		return updateRecord;
	}

	public int delete(Long sysParamId) {
		int deleteRecord = getJdbcTemplate().update(SQL_DELETE, new Object[] {sysParamId });
		return deleteRecord;
	}

}
