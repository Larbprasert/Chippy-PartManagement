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
import th.co.keihin.model.UnitTypeBean;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.MakerBean;
import th.co.keihin.model.MoldTypeBean;
import th.co.keihin.model.PartMasterBean;

@Repository("partMasterService")
public class PartMasterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper PARTMASTER_MAPPER = new RowMapper(){
		
		
		public PartMasterBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			PartMasterBean partMaster = new PartMasterBean();
			UnitTypeBean unitType = new UnitTypeBean();
			LocationBean location = new LocationBean();
			MakerBean maker = new MakerBean();
			MoldTypeBean moldType = new MoldTypeBean();
			
			
			partMaster.setSysPart_ID(rs.getString("sysPart_ID"));
			
			partMaster.setPart_ID(rs.getString("part_ID"));
			partMaster.setPart_name(rs.getString("part_name"));
			
			partMaster.setMin_stock(rs.getInt("min_stock"));
			partMaster.setMax_stock(rs.getInt("max_stock"));
			partMaster.setQty(rs.getInt("qty"));
			
			partMaster.setPrice(rs.getFloat("price"));				
			
			partMaster.setActiveFlag(rs.getInt("activeFlag"));				
			partMaster.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			partMaster.setCreateBy(rs.getString("createBy"));
			partMaster.setCreateDate(rs.getDate("createDate"));
			partMaster.setUpdateBy(rs.getString("updateBy"));
			partMaster.setUpdateDate(rs.getDate("updateDate"));
			
			
			unitType.setUnitType_ID(rs.getString("unitType_ID"));
			unitType.setUnitType_name(rs.getString("unitType_name"));
			partMaster.setUnitType(unitType);
			
			location.setLocation_ID(rs.getString("location_ID"));
			location.setLocation_name(rs.getString("location_name"));
			partMaster.setLocation(location);;
			
			maker.setMaker_ID(rs.getString("maker_ID"));
			maker.setMaker_name(rs.getString("maker_name"));
			partMaster.setMaker(maker);
			
			moldType.setMoldType_ID(rs.getString("moldType_ID"));
			moldType.setMoldType_name(rs.getString("moldType_name"));
			partMaster.setMoldType(moldType);
			
			
			return partMaster;
		}
	};
	
	
	public PartMasterBean getPartMasterBeanByID(String partMaster_ID) {
		// TODO Auto-generated method stub
				
		String query = "Select pm.* "
				+ ",ut.unitType_name "
				+ ",lc.location_name "
				+ ",mk.maker_name "
				+ ",mt.moldType_Name "
				+ ",act.value1 as activeFlag_name "
				+ "From tb_partMaster pm "
				+ "LEFT JOIN tb_UnitType ut ON pm.unitType_ID = ut.unitType_ID "
				+ "LEFT JOIN tb_Location lc ON pm.location_ID = lc.location_ID "
				+ "LEFT JOIN tb_Maker mk ON pm.maker_ID = mk.maker_ID COLLATE database_default "
				+ "LEFT JOIN tb_MoldType mt ON pm.moldType_ID = mt.moldType_ID "
				+ "LEFT JOIN tbm_misc_data act on pm.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' "
				+ "where 1=1 "
				+ "and pm.activeFlag <> 2 " 
				+ "and pm.part_ID='" + partMaster_ID +"'"; 
		List<PartMasterBean> list = jdbcTemplate.query(query,PARTMASTER_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new PartMasterBean();
	}

	
	public DataTableAjax<PartMasterBean> getAll(PartMasterBean bean) {
		// TODO Auto-generated method stub
		
		DataTableAjax<PartMasterBean> listPartMaster = new DataTableAjax<PartMasterBean>();
		
		//String query = "select * from tb_PartMaster where 1=1 and activeFlag <> 2 order by Part_ID";
		String query = "Select pm.* "
				+ ",ut.unitType_name "
				+ ",lc.location_name "
				+ ",mk.maker_name "
				+ ",mt.moldType_Name "
				+ ",act.value1 as activeFlag_name "
				+ "From tb_partMaster pm "
				+ "LEFT JOIN tb_UnitType ut ON pm.unitType_ID = ut.unitType_ID "
				+ "LEFT JOIN tb_Location lc ON pm.location_ID = lc.location_ID "
				+ "LEFT JOIN tb_Maker mk ON pm.maker_ID = mk.maker_ID COLLATE database_default "
				+ "LEFT JOIN tb_MoldType mt ON pm.moldType_ID = mt.moldType_ID "
				+ "LEFT JOIN tbm_misc_data act on pm.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' "
				+ "where 1=1 "
				+ "and pm.activeFlag <> 2 ";
				
		
		
		if(StringUtils.isNotEmpty(bean.getPart_name())){
			query += " and ( pm.part_ID like '%"+bean.getPart_name()+"%' " ;
			query += " or pm.part_name like '%"+bean.getPart_name()+"%' ) " ;
		}
		
		
		query += "order by pm.part_ID";
		
//		System.out.println(query);
		
		List<PartMasterBean> list = jdbcTemplate.query(query,PARTMASTER_MAPPER);
		
		int total = list!=null? list.size():0;
		listPartMaster.setRecordsTotal(total);
		listPartMaster.setRecordsFiltered(total);
		listPartMaster.setData(list);
		
		return listPartMaster;
	}

	
	public void saveOrUpdate(PartMasterBean obj) {
		if(StringUtils.isNotEmpty(obj.getPart_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}


	
	public void save(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		System.out.println("############################### Save");
    	System.out.println("Part_ID: " + PartMaster.getPart_ID());
		
		try {
			
			String query =
				"insert into tb_PartMaster(sysPart_ID,"
						+ "Part_ID,"
						+ "Part_name,"
						+ "unitType_ID,"
						+ "location_ID,"
						+ "maker_ID,"
						+ "moldType_ID,"
						+ "min_stock,"
						+ "max_stock,"
						+ "qty,"
						+ "price,"
						+ "activeFlag,"
						+ "createDate,"
						+ "createBy) "+
						"values(?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?) ";
			jdbcTemplate.update(query,
					new Object[] {  
							"sys" + PartMaster.getPart_ID(),
							
							PartMaster.getPart_ID(),
							PartMaster.getPart_name(),
							
							PartMaster.getUnitType().getUnitType_ID(),
							PartMaster.getLocation().getLocation_ID(),
							PartMaster.getMaker().getMaker_ID(),
							PartMaster.getMoldType().getMoldType_ID(),
							
							PartMaster.getMin_stock(),
							PartMaster.getMax_stock(),
							PartMaster.getQty(),
							PartMaster.getPrice(),
							PartMaster.getActiveFlag(),
							PartMaster.getCreateBy(),
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;		
	}

	
	public void delete(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		try {
			
			String query = ("update tb_PartMaster set activeFlag = 2, updateBy=?, updateDate=getdate() Where 1=1 and sysPart_ID=?");
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							PartMaster.getUpdateBy(),							
//							PartMaster.getSysPart_ID()
							"sys" + PartMaster.getPart_ID()
							});	

		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	
	public void edit(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
				
		try {

			
	    	String query = ("Update tb_PartMaster "+
					"Set part_ID=?,"
					+ "part_name=?, " 
					+ "unitType_ID=?,"
					+ "location_ID=?,"
					+ "maker_ID=?,"
					+ "moldType_ID=?,"
					+ "min_stock=?,"
					+ "max_stock=?,"
					+ "qty=?,"
					+ "price=?,"
					+ "activeFlag=?,"
					+ "updateBy=?, "
					+ "updateDate=getdate() "
					+ "where 1=1 "+
					"and sysPart_ID=? ");
	    	
			System.out.println("Edit Part_ID = " + PartMaster.getPart_ID());
	    	
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					PartMaster.getPart_ID(),
							PartMaster.getPart_name(),
							
							PartMaster.getUnitType().getUnitType_ID(),
							PartMaster.getLocation().getLocation_ID(),
							PartMaster.getMaker().getMaker_ID(),
							PartMaster.getMoldType().getMoldType_ID(),
							
							PartMaster.getMin_stock(),
							PartMaster.getMax_stock(),
							PartMaster.getQty(),
							PartMaster.getPrice(),
							PartMaster.getActiveFlag(),
							
							PartMaster.getUpdateBy(),
							
							"sys" + PartMaster.getPart_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	
	
	public void editByMovement(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		
		try {

			
	    	String query = ("Update tb_PartMaster "+
					"Set qty=?, "
					+ "updateBy=?, "
					+ "updateDate=getdate() "
					+ "where 1=1 "+
					"and part_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					PartMaster.getQty(),
							PartMaster.getUpdateBy(),
							
							PartMaster.getPart_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

}
