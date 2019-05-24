
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

@Repository("invAssetDao")
public class InvAssetDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   ASSET_ID ");
        sql.append("   ,HOST_ID ");
        sql.append("   ,TYPE ");
        sql.append("   ,STATUS ");
        sql.append("   ,SN ");
        sql.append("   ,BRAND ");
        sql.append("   ,MODELS ");
        sql.append("   ,SN2 ");
        sql.append("   ,FIXED_ASSET ");
        sql.append("   ,EXP_CODE ");
        sql.append("   ,CPU ");
        sql.append("   ,RAM ");
        sql.append("   ,HDD ");
        sql.append("   ,OS ");
        sql.append("   ,MONITOR_MODEL ");
        sql.append("   ,MONITOR_SN ");
        sql.append("   ,KEYBOARD_SN ");
        sql.append("   ,MOUSE_SN ");
        sql.append("   ,BAG_SN ");
        sql.append("   ,DOCKING_SN ");
        sql.append("   ,DOCKING_ADP_SN ");
        sql.append("   ,EXTERNAL_DVD_SN ");
        sql.append("   ,PO_NUMBER ");
        sql.append("   ,SUPPLIER ");
        sql.append("   ,WARRANTY_TYPE ");
        sql.append("   ,ACQUIRED_DATE ");
        sql.append("   ,WARRANTY_EXP_DATE ");
        sql.append("   ,NOTE ");
        sql.append("   ,POOL_COMPUTER ");
        sql.append("   ,HEADCOUNT ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append(" FROM inv_asset");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO inv_asset ( ");
        sql.append("   HOST_ID ");
        sql.append("   ,TYPE ");
        sql.append("   ,STATUS ");
        sql.append("   ,SN ");
        sql.append("   ,BRAND ");
        sql.append("   ,MODELS ");
        sql.append("   ,SN2 ");
        sql.append("   ,FIXED_ASSET ");
        sql.append("   ,EXP_CODE ");
        sql.append("   ,CPU ");
        sql.append("   ,RAM ");
        sql.append("   ,HDD ");
        sql.append("   ,OS ");
        sql.append("   ,MONITOR_MODEL ");
        sql.append("   ,MONITOR_SN ");
        sql.append("   ,KEYBOARD_SN ");
        sql.append("   ,MOUSE_SN ");
        sql.append("   ,BAG_SN ");
        sql.append("   ,DOCKING_SN ");
        sql.append("   ,DOCKING_ADP_SN ");
        sql.append("   ,EXTERNAL_DVD_SN ");
        sql.append("   ,PO_NUMBER ");
        sql.append("   ,SUPPLIER ");
        sql.append("   ,WARRANTY_TYPE ");
        sql.append("   ,ACQUIRED_DATE ");
        sql.append("   ,WARRANTY_EXP_DATE ");
        sql.append("   ,NOTE ");
        sql.append("   ,POOL_COMPUTER ");
        sql.append("   ,HEADCOUNT ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,CREATE_DATE ");
//        sql.append("   ,UPDATE_BY ");
//        sql.append("   ,UPDATE_DATE ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
        		+ " convert(datetime, ? ,103),"
        		+ " convert(datetime, ? ,103) ,"
        		+ "?,?,?,?,GETDATE()) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE inv_asset ");
        sql.append(" SET ");
        sql.append("   HOST_ID = ? ");
        sql.append("   ,TYPE = ? ");
        sql.append("   ,STATUS = ? ");
        sql.append("   ,SN = ? ");
        sql.append("   ,BRAND = ? ");
        sql.append("   ,MODELS = ? ");
        sql.append("   ,SN2 = ? ");
        sql.append("   ,FIXED_ASSET = ? ");
        sql.append("   ,EXP_CODE = ? ");
        sql.append("   ,CPU = ? ");
        sql.append("   ,RAM = ? ");
        sql.append("   ,HDD = ? ");
        sql.append("   ,OS = ? ");
        sql.append("   ,MONITOR_MODEL = ? ");
        sql.append("   ,MONITOR_SN = ? ");
        sql.append("   ,KEYBOARD_SN = ? ");
        sql.append("   ,MOUSE_SN = ? ");
        sql.append("   ,BAG_SN = ? ");
        sql.append("   ,DOCKING_SN = ? ");
        sql.append("   ,DOCKING_ADP_SN = ? ");
        sql.append("   ,EXTERNAL_DVD_SN = ? ");
        sql.append("   ,PO_NUMBER = ? ");
        sql.append("   ,SUPPLIER = ? ");
        sql.append("   ,WARRANTY_TYPE = ? ");
        sql.append("   ,ACQUIRED_DATE = convert(datetime, ? ,103) ");
        sql.append("   ,WARRANTY_EXP_DATE = convert(datetime, ? ,103) ");
        sql.append("   ,NOTE = ? ");
        sql.append("   ,POOL_COMPUTER = ? ");
        sql.append("   ,HEADCOUNT = ? ");
//        sql.append("   ,CREATE_BY = ? ");
//        sql.append("   ,CREATE_DATE = ? ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append("   ,UPDATE_DATE = GETDATE() ");
        sql.append(" WHERE ");
        sql.append("   ASSET_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM inv_asset ");
        sql.append(" WHERE ");
        sql.append("   ASSET_ID = ? ");
        return sql.toString();
    }

//    public List<InvAsset> selectAll() {
//        List<InvAsset> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(InvAsset.class));
//        return resultList;
//    }

    public InvAsset selectById(String id) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   ASSET_ID = ? ");
        List<InvAsset> list = (List<InvAsset>) executeQuery(sql.toString(),new Object[] {id}, INV_ASSET_RM);
        return list!=null&&list.size()>0? list.get(0): new InvAsset();
    }

    public int insert(InvAsset invAsset) {
        Long insertRecord = executeInsert(SQL_INSERT, 
        		new Object[] {invAsset.getHostId(), 
        					  invAsset.getType(), 
        					  invAsset.getStatus(), 
        					  invAsset.getSn(), 
        					  invAsset.getBrand(), 
        					  invAsset.getModels(), 
        					  invAsset.getSn2(), 
        					  invAsset.getFixedAsset(), 
        					  invAsset.getExpCode(), 
        					  invAsset.getCpu(), 
        					  invAsset.getRam(), 
        					  invAsset.getHdd(), 
        					  invAsset.getOs(), 
        					  invAsset.getMonitorModel(), 
        					  invAsset.getMonitorSn(), 
        					  invAsset.getKeyboardSn(), 
        					  invAsset.getMouseSn(), 
        					  invAsset.getBagSn(), 
        					  invAsset.getDockingSn(), 
        					  invAsset.getDockingAdpSn(), 
        					  invAsset.getExternalDvdSn(), 
        					  invAsset.getPoNumber(), 
        					  invAsset.getSupplier(), 
        					  invAsset.getWarrantyType(), 
        					  invAsset.getAcquiredDate(), 
        					  invAsset.getWarrantyExpDate(), 
        					  invAsset.getNote(), 
        					  invAsset.getPoolComputer(), 
        					  invAsset.getHeadcount(), 
        					  invAsset.getCreateBy()
//        					  invAsset.getCreateDate()
//        					  invAsset.getUpdateBy(), 
//        					  invAsset.getUpdateDate()
        					  });
        return insertRecord.intValue();
    }

    public int update(InvAsset invAsset) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { invAsset.getHostId(), invAsset.getType(), invAsset.getStatus(), invAsset.getSn(),
						invAsset.getBrand(), invAsset.getModels(), invAsset.getSn2(), invAsset.getFixedAsset(),
						invAsset.getExpCode(), invAsset.getCpu(), invAsset.getRam(), invAsset.getHdd(),
						invAsset.getOs(), invAsset.getMonitorModel(), invAsset.getMonitorSn(), invAsset.getKeyboardSn(),
						invAsset.getMouseSn(), invAsset.getBagSn(), invAsset.getDockingSn(), invAsset.getDockingAdpSn(),
						invAsset.getExternalDvdSn(), invAsset.getPoNumber(), invAsset.getSupplier(),
						invAsset.getWarrantyType(), invAsset.getAcquiredDate(), invAsset.getWarrantyExpDate(),
						invAsset.getNote(), invAsset.getPoolComputer(), invAsset.getHeadcount(), 
//						invAsset.getCreateBy(),
//						invAsset.getCreateDate(), 
						invAsset.getUpdateBy(), 
						invAsset.getAssetId()
						});
        return updateRecord;
    }

    public int delete(Integer assetId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {assetId });
        return deleteRecord;
    }
    
	private RowMapper INV_ASSET_RM = new RowMapper(){
		@Override
		public InvAsset mapRow(ResultSet rs, int rowNum) throws SQLException {
			InvAsset m = new InvAsset();
			m.setRam(rs.getString("RAM"));
			m.setCpu(rs.getString("CPU"));
			m.setAssetId(rs.getInt("ASSET_ID")); 
			m.setHostId(rs.getString("HOST_ID"));
			m.setType(rs.getString("TYPE"));
			m.setStatus(rs.getString("STATUS"));
			m.setSn(rs.getString("SN"));
			m.setBrand(rs.getString("BRAND"));
			m.setModels(rs.getString("MODELS"));
			m.setSn2(rs.getString("SN2"));
			m.setFixedAsset(rs.getString("FIXED_ASSET"));
			m.setExpCode(rs.getString("EXP_CODE"));
			m.setHdd(rs.getString("HDD"));
			m.setOs(rs.getString("OS"));
			m.setMonitorModel(rs.getString("MONITOR_MODEL"));
			m.setMonitorSn(rs.getString("MONITOR_SN"));
			m.setKeyboardSn(rs.getString("KEYBOARD_SN"));
			m.setMouseSn(rs.getString("MOUSE_SN"));
			m.setBagSn(rs.getString("BAG_SN"));
			m.setDockingSn(rs.getString("DOCKING_SN"));
			m.setDockingAdpSn(rs.getString("DOCKING_ADP_SN"));
			m.setExternalDvdSn(rs.getString("EXTERNAL_DVD_SN"));
			m.setPoNumber(rs.getString("PO_NUMBER"));
			m.setSupplier(rs.getString("SUPPLIER"));
			m.setWarrantyType(rs.getString("WARRANTY_TYPE"));
			m.setAcquiredDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("ACQUIRED_DATE")));
			m.setWarrantyExpDate(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("WARRANTY_EXP_DATE")));
			m.setNote(rs.getString("NOTE"));
			m.setPoolComputer(rs.getString("POOL_COMPUTER"));
			m.setHeadcount(rs.getString("HEADCOUNT"));
			m.setCreateBy(rs.getString("CREATE_BY")); 
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE"))); 
			m.setCreateDate(rs.getDate("CREATE_DATE"));
			m.setUpdateBy(rs.getString("UPDATE_BY")); 
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));
			return m;
		}
		
	};
	public DataTableAjax<InvAsset> getDataTable(InvAsset param) {
		logger.info("### getDataTable :xxxxxx ");
		DataTableAjax result = new DataTableAjax<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT                                                              ");
		sql.append("   a.ASSET_ID                                                        ");
		sql.append(" ,a.HOST_ID                                                          ");
		sql.append("  ,dbo.GetParamDesc(a.TYPE ,'ASSET_TYPE','TH')  TYPE                     ");
		sql.append("   ,dbo.GetParamDesc(a.STATUS ,'ASSET_STATUS','TH') STATUS               ");
		sql.append(" ,a.SN                                                               ");
		sql.append(" ,dbo.GetParamDesc(a.BRAND ,'BRAND','TH')   BRAND                                                         ");
		sql.append(" ,dbo.GetParamDesc(a.MODELS ,'MODEL','TH')  MODELS                                                    ");
//		sql.append(" ,a.BRAND                                                            ");
//		sql.append(" ,a.MODELS                                                           ");
		sql.append(" ,a.SN2                                                              ");
		sql.append(" ,a.FIXED_ASSET                                                      ");
		sql.append(" ,a.EXP_CODE                                                         ");
		sql.append(" ,a.CPU                                                              ");
		sql.append(" ,a.RAM                                                              ");
		sql.append(" ,a.HDD                                                              ");
		sql.append(" ,a.OS                                                               ");
		sql.append(" ,a.MONITOR_MODEL                                                    ");
		sql.append(" ,a.MONITOR_SN                                                       ");
		sql.append(" ,a.KEYBOARD_SN                                                      ");
		sql.append(" ,a.MOUSE_SN                                                         ");
		sql.append(" ,a.BAG_SN                                                           ");
		sql.append(" ,a.DOCKING_SN                                                       ");
		sql.append(" ,a.DOCKING_ADP_SN                                                   ");
		sql.append(" ,a.EXTERNAL_DVD_SN                                                  ");
		sql.append(" ,a.PO_NUMBER                                                        ");
		sql.append(" ,a.SUPPLIER                                                         ");
		sql.append(" ,dbo.GetParamDesc(a.WARRANTY_TYPE ,'WARRANTY_TYPE','TH')  WARRANTY_TYPE ");
		sql.append(" ,a.ACQUIRED_DATE                                                    ");
		sql.append(" ,a.WARRANTY_EXP_DATE                                                ");
		sql.append(" ,a.NOTE                                                             ");
		sql.append(" ,a.POOL_COMPUTER                                                    ");
		sql.append(" ,a.HEADCOUNT                                                        ");
		sql.append(" ,a.CREATE_BY                                                        ");
		sql.append(" ,a.CREATE_DATE                                                      ");
		sql.append(" ,a.UPDATE_BY                                                        ");
		sql.append(" ,a.UPDATE_DATE                                                      ");
		sql.append(" FROM inv_asset a													");
		sql.append(" WHERE 1=1 ");
		
		List wh = new ArrayList<>();
		
		if(StringUtils.isNotEmpty(param.getHostId())){
			wh.add("%"+param.getHostId()+"%");
			sql.append(" AND HOST_ID like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getSn())){
			wh.add("%"+param.getSn()+"%");
			sql.append(" AND SN like ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getType())){
			wh.add(param.getType());
			sql.append(" AND TYPE = ? ");
		}
		
		if(StringUtils.isNotEmpty(param.getWarrantyExpDate())){
			wh.add(param.getWarrantyExpDate());
			sql.append(" AND a.WARRANTY_EXP_DATE  = convert(datetime, ? ,103) ");
		}
		
//		if(StringUtils.isNotEmpty(param.getDeptNameTh())){
//			wh.add("%"+param.getDeptNameTh()+"%");
//			wh.add("%"+param.getDeptNameTh()+"%");
//			sql.append(" AND ( DEPT_NAME_TH like ? ");
//			sql.append(" OR DEPT_NAME_EN like ? ) ");
//		}
		
		sql.append(" ORDER BY HOST_ID ");
		
//		System.out.println(sql.toString()); 
		
		List<InvAsset> list = (List<InvAsset>) executeQuery(sql.toString(), wh.toArray(), INV_ASSET_RM);
		int total = list!=null? list.size():0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}

	public boolean existHostId(String hostId) {
		  StringBuilder sql = new StringBuilder();
		  	sql.append(" SELECT ASSET_ID ,HOST_ID from inv_asset WHERE HOST_ID = '"+hostId+"' ");
	        List list = jdbcTemplate.queryForList(sql.toString());
	        return list!=null&&list.size()>0;
	}

//	public InvAsset getAssetById(String assetId) {
//		logger.info("### getAssetById : "+assetId);
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append(" SELECT * from inv_asset ");
//		sql.append(" WHERE ASSET_ID = ? ");
//		List<InvAsset> list = (List<InvAsset>) executeQuery(sql.toString(), new String[]{assetId}, INV_ASSET_RM);
//		return list!=null&& list.size()>0? list.get(0):new InvAsset() ;
//	}
	


}
