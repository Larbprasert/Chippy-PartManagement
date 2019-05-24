
package th.co.portal.dao.gas;

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
import th.co.portal.model.gas.RequestedHistory;

@Repository("equipmentHistoryDao")
public class EquipmentHistoryDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    protected final static String SQL_INSERT = buildInsertStatement();
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public RequestedHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
			RequestedHistory m = new RequestedHistory();
			m.setId (rs.getInt("ID"));
			m.setEqId (rs.getInt("EQ_ID"));
			m.setEqCode(rs.getString("EQ_CODE"));
			m.setJobNo(rs.getString("JOB_NO"));
			m.setJobStatus(rs.getString("JOB_STATUS_TXT"));
//			m.setJobType(rs.getString("JOB_TYPE_TXT"));
			m.setRemark(rs.getString("REMARK"));
			m.setCreateBy(rs.getString("CREATE_BY")); 
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			
			return m;
		}
    };
    
    public DataTableAjax<RequestedHistory> getDataTable(RequestedHistory param) {
		logger.info("### getDataTable EquipmentHistory :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  ");
//		 sql.append(" , dbo.GetParamDesc(a.EQ_TYPE,'EQUIPMENT_TYPE','TH')  EQ_TYPE_NAME  ");
		 sql.append(" , dbo.GetParamDesc(a.JOB_STATUS,'REQUEST_STATUS','TH') JOB_STATUS_TXT    ");
//		 sql.append(" , dbo.GetParamDesc(a.OBJECTIVE_CODE,'REQUEST_PURPOSE','TH') JOB_TYPE_TXT    ");
	
		 sql.append("   FROM she_request_history a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		 
		if(StringUtils.isNotEmpty(param.getJobNo())){
			wh.add("%"+ param.getJobNo()+"%" );
			sql.append(" AND JOB_NO LIKE  ?  ");
		}
		
		if(StringUtils.isNotEmpty(param.getDateFrom())){
			wh.add( param.getDateFrom() );
			sql.append(" AND a.CREATE_DATE   >= convert(date, ? ,103) ");
		}
		
		if(StringUtils.isNotEmpty(param.getDateTo())){
			wh.add( param.getDateTo() );
			sql.append(" AND a.CREATE_DATE  <=  convert(date, ? ,103)  ");
		}
//		
		if(null!=param.getEqId()){
			wh.add( param.getEqId() );
			sql.append(" AND a.EQ_ID =  ? ");
		}
		
		sql.append(" ORDER BY CREATE_DATE DESC ");
		
		System.out.println(param); 
		System.out.println(sql.toString()); 
		
		List<RequestedHistory> list = (List<RequestedHistory>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
    
    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append("  INSERT INTO SHE_REQUEST_HISTORY ( ");
        sql.append(" EQ_ID            "); 
        sql.append(" ,EQ_CODE            "); 
        sql.append(" ,JOB_NO           "); 
        sql.append(" ,JOB_STATUS       "); 
        sql.append(" ,REMARK           "); 
        sql.append(" ,CREATE_BY        ");
        sql.append(" ,CREATE_DATE      ");
        sql.append(" ) ");
        sql.append(" VALUES ( ?,?,?,?,?,?, GETDATE() ) ");
        return sql.toString();
    }

	public int insertHistory(RequestedHistory requested) {

		System.out.println(requested); 
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { 
						requested.getEqId() ,
						requested.getEqCode(),
						requested.getJobNo(),
						requested.getJobStatus(),
						requested.getRemark(),
						requested.getCreateBy()
						});
        return insertRecord.intValue();
	}
 
 
}

