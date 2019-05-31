package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.MoldTypeBean;
import th.co.keihin.model.UnitTypeBean;

@Repository("unitTypeService")
public class UnitTypeService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper UNITTYPE_MAPPER = new RowMapper(){
		
		@Override
		public UnitTypeBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			UnitTypeBean unittype = new UnitTypeBean();
			
			unittype.setUnitType_ID(rs.getString("unitType_ID"));
			unittype.setUnitType_name(rs.getString("unitType_name"));
			
			unittype.setCreateBy(rs.getString("createBy"));
			unittype.setCreateDate(rs.getDate("createDate"));
			
			unittype.setUpdateBy(rs.getString("updateBy"));
			unittype.setUpdateDate(rs.getDate("updateDate"));
			
			unittype.setActiveFlag(rs.getInt("activeFlag"));
			unittype.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			return unittype;
		}
	};
	
	
	
	public UnitTypeBean getUnitTypeBeanByID(String unitType_ID) {
		// TODO Auto-generated method stub
		
		
		String query = "Select a.*, act.value1 as activeFlag_name " +
				"From tb_UnitType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.unitType_ID = '" + unitType_ID +"'"; 
		
		List<UnitTypeBean> list = jdbcTemplate.query(query,UNITTYPE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new UnitTypeBean();
	}

	
	public DataTableAjax<UnitTypeBean> getAll() {
		// TODO Auto-generated method stub
		
		DataTableAjax<UnitTypeBean> listUnitType = new DataTableAjax<UnitTypeBean>();
		
		String query = "Select a.*, act.value1 as activeFlag_name " +
				"From tb_UnitType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.unitType_ID";
				
		List<UnitTypeBean> list = jdbcTemplate.query(query,UNITTYPE_MAPPER);
		
		int total = list!=null? list.size():0;
		listUnitType.setRecordsTotal(total);
		listUnitType.setRecordsFiltered(total);
		listUnitType.setData(list);

		return listUnitType;
	}
	
	
	public void saveOrUpdate(UnitTypeBean obj) {
		if(StringUtils.isNotEmpty(obj.getUnitType_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	
	public void save(UnitTypeBean UnitType) {
		// TODO Auto-generated method stub
		
		try {
			String query = "INSERT INTO tb_unitType (unitType_ID,unitType_name,CreateDate,CreateBy,activeFlag) "+
					"VALUES ((SELECT top 1 'UN' + CAST(CAST(substring((select CASE WHEN max(unitType_ID) IS NULL THEN '1' ELSE MAX(unitType_ID) END unitType_ID " + 
					"from [dbo].[tb_UnitType]),3,len((select CASE WHEN max(unitType_ID) IS NULL THEN '1' ELSE MAX(unitType_ID) END unitType_ID " + 
					"from [dbo].[tb_UnitType]))) AS INT)+1 AS varchar(50))) "+
					",?,getdate(),?,? ) ";
			jdbcTemplate.update(query,
					new Object[] {  							
							UnitType.getUnitType_name(),
							UnitType.getCreateBy(),
							UnitType.getActiveFlag(),							
							});

		} catch (Exception e) {
			e.printStackTrace();
		}	
			
	}

	
	public void delete(UnitTypeBean unitType) {
		// TODO Auto-generated method stub
		try {

			String query = ("update tb_unitType set activeFlag = 2, updateBy=?, updateDate=getdate() Where unitType_ID=?");
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							unitType.getUpdateBy(),							
							unitType.getUnitType_ID()
							});
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void edit(UnitTypeBean UnitType) {
		// TODO Auto-generated method stub
		
		try {

			String query = ("Update tb_UnitType "+
					"Set unitType_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and unitType_ID=? ");
			int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					UnitType.getUnitType_name(),							
	    					UnitType.getUpdateBy(),
	    					UnitType.getActiveFlag(),
	    					UnitType.getUnitType_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
