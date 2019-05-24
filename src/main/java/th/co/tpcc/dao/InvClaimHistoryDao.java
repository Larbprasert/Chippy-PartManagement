
package th.co.tpcc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.tpcc.model.InvAsset;
import th.co.tpcc.model.InvClaimHistory;
import th.co.tpcc.model.SheDept;
import th.co.tpcc.model.Owner;

@Repository("invClaimHistoryDao")
public class InvClaimHistoryDao extends AbstractCommonJdbcDao{
	

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   CLAIM_ID ");
        sql.append("   ,CLAIM_NO ");
        sql.append("   ,CLAIM_CODE ");
        sql.append("   ,CLAIM_TYPE ");
        sql.append("   ,CLAIM_DETAIL ");
        sql.append("   ,HOST_ID ");
        sql.append("   ,ASSIGN_TO ");
        sql.append("   ,START_DATE ");
        sql.append("   ,FINISH_DATE ");
        sql.append("   ,REMARK ");
        sql.append("   ,OWNER_CODE ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append(" FROM INV_CLAIM_HISTORY");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO inv_claim_history ( ");
        sql.append("   CLAIM_NO ");
        sql.append("   ,CLAIM_CODE ");
        sql.append("   ,CLAIM_TYPE ");
        sql.append("   ,CLAIM_DETAIL ");
        sql.append("   ,HOST_ID ");
        sql.append("   ,START_DATE ");
        sql.append("   ,FINISH_DATE ");
        sql.append("   ,REMARK ");
        sql.append("   ,OWNER_CODE ");
        sql.append("   ,ASSIGN_TO ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,"
				+ " convert(datetime, ? ,103),"
        		+ " convert(datetime, ? ,103) ,?,?,?,?,GETDATE()) ");
		return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE inv_claim_history ");
        sql.append(" SET ");
        sql.append("   CLAIM_NO = ? ");
        sql.append("   ,CLAIM_CODE = ? ");
        sql.append("   ,CLAIM_TYPE = ? ");
        sql.append("   ,CLAIM_DETAIL = ? ");
        sql.append("   ,HOST_ID = ? ");
        sql.append("   ,START_DATE = convert(datetime, ? ,103) ");
        sql.append("   ,FINISH_DATE = convert(datetime, ? ,103) ");
        sql.append("   ,REMARK = ? ");
        sql.append("   ,OWNER_CODE = ? ");
        sql.append("   ,ASSIGN_TO = ? ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append(" WHERE ");
        sql.append("   CLAIM_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM inv_claim_history ");
        sql.append(" WHERE ");
        sql.append("   CLAIM_ID = ? ");
        return sql.toString();
    }

    
    public List<InvClaimHistory> selectAll() {
        List<InvClaimHistory> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(InvClaimHistory.class));
        return resultList;
    }

    
    public InvClaimHistory selectById(String id) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   CLAIM_ID = ? ");
        List<InvClaimHistory> list = (List<InvClaimHistory>) executeQuery(sql.toString(),new Object[] {id}, INV_CLAIM_RM2);
      return list!=null&&list.size()>0? list.get(0): new InvClaimHistory();
    }
    
    private RowMapper INV_CLAIM_RM2 = new RowMapper(){
 		@Override
 		public InvClaimHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
 			InvClaimHistory m = new InvClaimHistory();
 			m.setClaimId(rs.getInt("CLAIM_ID"));
 			m.setClaimNo(rs.getString("CLAIM_NO"));
 			m.setClaimCode(rs.getString("CLAIM_CODE"));
 			m.setClaimStatus(rs.getString("CLAIM_TYPE"));
 			m.setClaimDetail(rs.getString("CLAIM_DETAIL"));
 			m.setHostId(rs.getString("HOST_ID"));
 			m.setStartDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("START_DATE")));
 			m.setFinishDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("FINISH_DATE")));
 			m.setRemark(rs.getString("REMARK"));
 			m.setOwnerCode(rs.getString("OWNER_CODE"));
 			m.setAssignTo(rs.getString("ASSIGN_TO"));
 			m.setCreateBy(rs.getString("CREATE_BY")); 
 			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
 			m.setCreateDate(rs.getDate("CREATE_DATE"));
 			m.setUpdateBy(rs.getString("UPDATE_BY")); 
 			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
 			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
 			return m;
 		}	
 	};		
 			
    private RowMapper INV_CLAIM_RM = new RowMapper(){
 		@Override
 		public InvClaimHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
 			InvClaimHistory m = new InvClaimHistory();
 			m.setClaimId(rs.getInt("CLAIM_ID"));
 			m.setClaimNo(rs.getString("CLAIM_NO"));
 			m.setClaimCode(rs.getString("CLAIM_CODE"));
 			m.setClaimStatus(rs.getString("CLAIM_TYPE"));
 			m.setClaimDetail(rs.getString("CLAIM_DETAIL"));
 			m.setHostId(rs.getString("HOST_ID"));
 			m.setAssignTo(rs.getString("ASSIGN_TO"));
 			m.setStartDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("START_DATE")));
 			m.setFinishDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("FINISH_DATE")));
 			m.setRemark(rs.getString("REMARK"));
 			m.setOwnerCode(rs.getString("OWNER_CODE"));
 			m.setCreateBy(rs.getString("CREATE_BY")); 
 			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
 			m.setCreateDate(rs.getDate("CREATE_DATE"));
 			m.setUpdateBy(rs.getString("UPDATE_BY")); 
 			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
 			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
 			
 			
			InvAsset invAsset = new InvAsset();
			invAsset.setRam(rs.getString("RAM"));
			invAsset.setCpu(rs.getString("CPU"));
			invAsset.setAssetId(rs.getInt("ASSET_ID")); 
			invAsset.setHostId(rs.getString("HOST_ID"));
			invAsset.setType(rs.getString("TYPE"));
			invAsset.setStatus(rs.getString("STATUS"));
			invAsset.setSn(rs.getString("SN"));
			invAsset.setBrand(rs.getString("BRAND"));
			invAsset.setModels(rs.getString("MODELS"));
			invAsset.setSn2(rs.getString("SN2"));
			invAsset.setFixedAsset(rs.getString("FIXED_ASSET"));
			invAsset.setExpCode(rs.getString("EXP_CODE"));
			invAsset.setHdd(rs.getString("HDD"));
			invAsset.setOs(rs.getString("OS"));
			invAsset.setMonitorModel(rs.getString("MONITOR_MODEL"));
			invAsset.setMonitorSn(rs.getString("MONITOR_SN"));
			invAsset.setKeyboardSn(rs.getString("KEYBOARD_SN"));
			invAsset.setMouseSn(rs.getString("MOUSE_SN"));
			invAsset.setBagSn(rs.getString("BAG_SN"));
			invAsset.setDockingSn(rs.getString("DOCKING_SN"));
			invAsset.setDockingAdpSn(rs.getString("DOCKING_ADP_SN"));
			invAsset.setExternalDvdSn(rs.getString("EXTERNAL_DVD_SN"));
			invAsset.setPoNumber(rs.getString("PO_NUMBER"));
			invAsset.setSupplier(rs.getString("SUPPLIER"));
			invAsset.setWarrantyType(rs.getString("WARRANTY_TYPE"));
			invAsset.setAcquiredDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("ACQUIRED_DATE")));
			invAsset.setWarrantyExpDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("WARRANTY_EXP_DATE")));
			invAsset.setNote(rs.getString("NOTE"));
			invAsset.setPoolComputer(rs.getString("POOL_COMPUTER"));
			invAsset.setHeadcount(rs.getString("HEADCOUNT"));
			m.setInvAsset(invAsset);
			
			Owner owner = new Owner();
			owner.setOwnerId(rs.getInt("OWNER_ID"));
			owner.setOwnerCode(rs.getString("OWNER_CODE"));
			owner.setFirstName(rs.getString("FIRST_NAME"));
			owner.setLastName(rs.getString("LAST_NAME"));
			owner.setMobile(rs.getString("MOBILE"));
			owner.setEmail(rs.getString("EMAIL"));
			owner.setTitle(rs.getString("TITLE"));
			m.setOwner(owner);
			return m;
 		}
 		
 	};
 	
    public DataTableAjax<InvClaimHistory> getDataTable(InvClaimHistory param) {
 		logger.info("### getDataTable :xxxxxx ");
 		DataTableAjax result = new DataTableAjax<>();
 		
 		StringBuilder sql = new StringBuilder();
		sql.append(" select a.CLAIM_NO ,a.CLAIM_ID                                                     " );
		sql.append(" 	,a.CLAIM_CODE                                                           " );
		sql.append(" 	,dbo.GetParamDesc(a.CLAIM_TYPE ,'CLAIM_TYPE','TH') CLAIM_TYPE    " );
		sql.append(" 	,a.CLAIM_DETAIL                                                           " );
		sql.append(" 	,a.HOST_ID                                                           " );
		sql.append("   ,a.START_DATE ");
		sql.append("   ,a.FINISH_DATE ");
		sql.append("   ,a.REMARK ");
		sql.append(" ,a.OWNER_CODE 															" );
		sql.append(" ,a.ASSIGN_TO 															" );
		sql.append("   ,a.CREATE_BY ");
		sql.append("   ,a.CREATE_DATE ");
		sql.append("   ,a.UPDATE_BY ");
		sql.append("   ,a.UPDATE_DATE ");
 		
 		sql.append(" ,b.ASSET_ID                                                            " );
		sql.append("  ,dbo.GetParamDesc(b.TYPE ,'ASSET_TYPE','TH')  TYPE                        " );
		sql.append("   ,dbo.GetParamDesc(b.STATUS ,'ASSET_STATUS','TH') STATUS                  " );
		sql.append(" ,b.SN                                                                  " );
		sql.append(" ,dbo.GetParamDesc(b.BRAND ,'BRAND','TH') BRAND   " );
		sql.append(" ,b.MODELS                                                              " );
		sql.append(" ,b.SN2                                                                 " );
		sql.append(" ,b.FIXED_ASSET                                                         " );
		sql.append(" ,b.EXP_CODE                                                            " );
		sql.append(" ,b.CPU                                                                 " );
		sql.append(" ,b.RAM                                                                 " );
		sql.append(" ,b.HDD                                                                 " );
		sql.append(" ,b.OS                                                                  " );
		sql.append(" ,b.MONITOR_MODEL                                                       " );
		sql.append(" ,b.MONITOR_SN                                                          " );
		sql.append(" ,b.KEYBOARD_SN                                                         " );
		sql.append(" ,b.MOUSE_SN                                                            " );
		sql.append(" ,b.BAG_SN                                                              " );
		sql.append(" ,b.DOCKING_SN                                                          " );
		sql.append(" ,b.DOCKING_ADP_SN                                                      " );
		sql.append(" ,b.EXTERNAL_DVD_SN                                                     " );
		sql.append(" ,b.PO_NUMBER                                                           " );
		sql.append(" ,b.SUPPLIER                                                            " );
		sql.append(" ,dbo.GetParamDesc(b.WARRANTY_TYPE ,'WARRANTY_TYPE','TH')  WARRANTY_TYPE    " );
		sql.append(" ,b.ACQUIRED_DATE                                                       " );
		sql.append(" ,b.WARRANTY_EXP_DATE                                                   " );
		sql.append(" ,b.NOTE                                                                " );
		sql.append(" ,b.POOL_COMPUTER                                                       " );
		sql.append(" ,b.HEADCOUNT                                                           " );
		
		sql.append(" ,c.FIRST_NAME                                                          " );
		sql.append(" ,c.LAST_NAME                                                           " );
		sql.append(" ,c.EMAIL                                                               " );
		sql.append(" ,c.TITLE                                                               " );
		sql.append(" ,c.MOBILE                                                               " );
		sql.append(" ,c.OWNER_ID                                                            " );
		sql.append("  from inv_claim_history a                                              " );
		sql.append(" left join inv_asset b                                                  " );
		sql.append(" on b.HOST_ID = a.HOST_ID                                               " );
		sql.append(" left join she_owner c                                                  " );
		sql.append(" on c.OWNER_CODE = a.OWNER_CODE											");
		sql.append(" WHERE 1=1 ");
 		
		List wh = new ArrayList<>();
		InvAsset invAsset = param.getInvAsset();
		Owner owner = param.getOwner();
		
		if(StringUtils.isNotEmpty(param.getHostId())){
			wh.add("%"+param.getHostId()+"%");
			sql.append(" AND a.HOST_ID like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getSn())){
			wh.add("%"+param.getSn()+"%");
			sql.append(" AND b.SN like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getClaimNo())){
			wh.add(param.getClaimNo());
			sql.append(" AND a.CLAIM_NO = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getClaimCode())){
			wh.add(param.getClaimCode());
			sql.append(" AND a.CLAIM_CODE  = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getOwnerCode())){
			wh.add("%"+param.getOwnerCode()+"%");
			wh.add("%"+param.getOwnerCode()+"%");
			wh.add("%"+param.getOwnerCode()+"%");
			sql.append(" AND (a.OWNER_CODE like ? or c.FIRST_NAME like ? or c.LAST_NAME like ?)  ");
		}

// 		if(StringUtils.isNotEmpty(param.getDeptCode())){
// 			wh.add("%"+param.getDeptCode()+"%");
// 			sql.append(" AND DEPT_CODE like ?  ");
// 		}
// 		
// 		if(StringUtils.isNotEmpty(param.getDeptNameTh())){
// 			wh.add("%"+param.getDeptNameTh()+"%");
// 			wh.add("%"+param.getDeptNameTh()+"%");
// 			sql.append(" AND ( DEPT_NAME_TH like ? ");
// 			sql.append(" OR DEPT_NAME_EN like ? ) ");
// 		}
 		
 		sql.append(" ORDER BY DEPT_CODE ");
 		
// 		System.out.println(sql.toString()); 
 		
 		List<InvClaimHistory> list = (List<InvClaimHistory>) executeQuery(sql.toString(), wh.toArray(), INV_CLAIM_RM);
 		int total = list!=null? list.size():0;
 		result.setRecordsTotal(total);
 		result.setRecordsFiltered(total);
 		result.setData(list);
 		return result;
 	}
    
    public int insert(InvClaimHistory invClaimHistory) {
        Long insertRecord = executeInsert(SQL_INSERT, new Object[] 
        		{invClaimHistory.getClaimNo(), 
        				invClaimHistory.getClaimCode(), 
        				invClaimHistory.getClaimStatus(), 
        				invClaimHistory.getClaimDetail(), 
        				invClaimHistory.getHostId(), 
        				invClaimHistory.getStartDate(), 
        				StringUtils.isEmpty(invClaimHistory.getFinishDate())? null:invClaimHistory.getFinishDate(), 
        				invClaimHistory.getRemark(), 
        				invClaimHistory.getOwnerCode(),
        				invClaimHistory.getAssignTo(),
        				invClaimHistory.getCreateBy()
        				});
        return insertRecord.intValue();
    }

    
    public int update(InvClaimHistory invClaimHistory) {
        int updateRecord = jdbcTemplate.update(SQL_UPDATE, new Object[] 
        		{invClaimHistory.getClaimNo(), 
        				invClaimHistory.getClaimCode(), 
        				invClaimHistory.getClaimStatus(), 
        				invClaimHistory.getClaimDetail(),
        				invClaimHistory.getHostId(), 
        				invClaimHistory.getStartDate(), 
        				StringUtils.isEmpty(invClaimHistory.getFinishDate())? null:invClaimHistory.getFinishDate(), 
        				invClaimHistory.getRemark(), 
        				invClaimHistory.getOwnerCode(),
        				invClaimHistory.getAssignTo(),
        				invClaimHistory.getUpdateBy(), 
        				invClaimHistory.getClaimId()
        				});
        return updateRecord;
    }

    
    public int delete(Integer claimId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {claimId });
        return deleteRecord;
    }
  
}
