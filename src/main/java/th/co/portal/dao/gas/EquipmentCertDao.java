
package th.co.portal.dao.gas;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.portal.model.gas.UploadFile;

@Repository("EquipmentCertDao")
public class EquipmentCertDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper DB_ROW_MAPPER = new RowMapper(){
		@Override
		public UploadFile mapRow(ResultSet rs, int rowNum) throws SQLException {
			UploadFile m = new UploadFile();
			m.setId (rs.getInt("ID"));
			m.setEqId (rs.getInt("EQ_ID"));
			m.setFileId (rs.getString("FILE_ID"));
			m.setFileName(rs.getString("FILE_NAME"));
			m.setFileType(rs.getString("FILE_TYPE"));
			m.setFileSize(rs.getString("FILE_SIZE"));
			m.setFileDesc(rs.getString("FILE_DESC"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy_hhmmss_from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			
			return m;
		}
    };
    
    public DataTableAjax<UploadFile> getDataTable(UploadFile param) {
		logger.info("### getDataTable CertDocument :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		 sql.append(" SELECT a.*  ");
		 sql.append("   FROM SHE_DOCUMENT_CERT a  WHERE 1=1 ");
		
		List wh = new ArrayList<>();
//		 
//		if(StringUtils.isNotEmpty(param.getDeptCode())){
//			wh.add( param.getDeptCode() );
//			sql.append(" AND a.DEPT_CODE =  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getEqCode())){
//			wh.add( "%"+param.getEqCode()+"%");
//			sql.append(" AND a.EQ_CODE like  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getSerialNo())){
//			wh.add( "%"+param.getSerialNo()+"%");
//			sql.append(" AND a.SERIAL_NO like  ? ");
//		}
//		if(StringUtils.isNotEmpty(param.getEqTypeCode())){
//			wh.add( param.getEqTypeCode() );
//			sql.append(" AND a.EQ_TYPE =  ? ");
//		}
//		
		if(null!=param.getEqId()){
			wh.add( param.getEqId() );
			sql.append(" AND a.EQ_ID =  ? ");
		}
		
		sql.append(" ORDER BY CREATE_DATE DESC ");
		
//		System.out.println(sql.toString()); 
		
		List<UploadFile> list = (List<UploadFile>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}
    
 
//	public CertDocument verify(CertDocument util) {
//		  StringBuilder sql = new StringBuilder();
//		  sql.append(" SELECT a.*  FROM SHE_DOCUMENT_CERT a  WHERE 1=1 ");
//	      sql.append(" AND  a.EQ_CODE = ?  ");
//	      List<CertDocument> list = jdbcTemplate.query(sql.toString(),
//	    		  BeanPropertyRowMapper.newInstance(CertDocument.class), new Object[] {util.getEqCode()});
//	      return  list!=null&& list.size()>0? list.get(0):new CertDocument() ;
//	}

 
 
}

