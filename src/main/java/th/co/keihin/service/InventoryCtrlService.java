package th.co.keihin.service;

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
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.MakerBean;
import th.co.keihin.model.InventoryCtrlBean;
import th.co.keihin.model.UnitTypeBean;


@Repository("inventoryCtrlService")
public class InventoryCtrlService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MachineService machineService;

	
	private RowMapper INVENTORYCTRL_MAPPER = new RowMapper(){
		
		
		public InventoryCtrlBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			InventoryCtrlBean inventoryCtrl = new InventoryCtrlBean();
			UnitTypeBean unitType = new UnitTypeBean();
			LocationBean location = new LocationBean();
			MakerBean maker = new MakerBean();
			
			inventoryCtrl.setSysInventory_ID(rs.getString("sysInventory_ID"));
			
			inventoryCtrl.setInventory_ID(rs.getString("inventory_ID"));
			inventoryCtrl.setInventory_name(rs.getString("inventory_name"));
			
			inventoryCtrl.setMin_stock(rs.getInt("min_stock"));
			inventoryCtrl.setMax_stock(rs.getInt("max_stock"));
			inventoryCtrl.setQty(rs.getInt("qty"));
			
			inventoryCtrl.setPrice(rs.getFloat("price"));				
			
			inventoryCtrl.setActiveFlag(rs.getInt("activeFlag"));				
			inventoryCtrl.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			inventoryCtrl.setCreateBy(rs.getString("createBy"));
			inventoryCtrl.setCreateDate(rs.getDate("createDate"));
			inventoryCtrl.setUpdateBy(rs.getString("updateBy"));
			inventoryCtrl.setUpdateDate(rs.getDate("updateDate"));
		
			unitType.setUnitType_ID(rs.getString("unitType_ID"));
			unitType.setUnitType_name(rs.getString("unitType_name"));
			inventoryCtrl.setUnitType(unitType);
			
			location.setLocation_ID(rs.getString("location_ID"));
			location.setLocation_name(rs.getString("location_name"));
			inventoryCtrl.setLocation(location);;
			
			maker.setMaker_ID(rs.getString("maker_ID"));
			maker.setMaker_name(rs.getString("maker_name"));
			inventoryCtrl.setMaker(maker);
			
			inventoryCtrl.setRank(rs.getInt("rank"));				
			inventoryCtrl.setRank_name(rs.getString("rank_name"));
								
			return inventoryCtrl;
		}
	};
	
	
	public InventoryCtrlBean getInventoryCtrlBeanByID(String inventory_ID) {
		// TODO Auto-generated method stub
				
		String query = "Select iv.* ,ut.unitType_name ,lc.location_name ,mk.maker_name "
				+ ",act.value1 as activeFlag_name ,rank.value1 as rank_name " 
				+ "From tb_inventoryMaster iv " 
				+ "	LEFT JOIN tb_UnitType ut ON iv.unitType_ID = ut.unitType_ID "  
				+ "	LEFT JOIN tb_Location lc ON iv.location_ID = lc.location_ID "  
				+ "	LEFT JOIN tb_Maker mk ON iv.maker_ID = mk.maker_ID COLLATE database_default " 
				+ "	LEFT JOIN tbm_misc_data act on iv.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " 
				+ "	LEFT JOIN tbm_misc_data rank on iv.rank = rank.misc_code and rank.misc_type = 'Ranking' "  
				+ "where 1=1 "  
				+ "and iv.activeFlag <> 2 " 
				+ "and iv.inventory_ID='" + inventory_ID +"'"; 
		
		System.out.println(query);
		
		List<InventoryCtrlBean> list = jdbcTemplate.query(query,INVENTORYCTRL_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new InventoryCtrlBean();
	}

	
	public DataTableAjax<InventoryCtrlBean> getAll(InventoryCtrlBean bean) {
		// TODO Auto-generated method stub
		
		DataTableAjax<InventoryCtrlBean> listinventoryCtrl = new DataTableAjax<InventoryCtrlBean>();
		
		//String query = "select * from tb_inventoryCtrl where 1=1 and activeFlag <> 2 order by Part_ID";
		String query = "Select iv.* ,ut.unitType_name ,lc.location_name ,mk.maker_name "  
				+ ",act.value1 as activeFlag_name ,rank.value1 as rank_name " 
				+ "From tb_inventoryMaster iv " 
				+ "	LEFT JOIN tb_UnitType ut ON iv.unitType_ID = ut.unitType_ID " 
				+ "	LEFT JOIN tb_Location lc ON iv.location_ID = lc.location_ID " 
				+ "	LEFT JOIN tb_Maker mk ON iv.maker_ID = mk.maker_ID COLLATE database_default " 
				+ "	LEFT JOIN tbm_misc_data act on iv.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " 
				+ "	LEFT JOIN tbm_misc_data rank on iv.rank = rank.misc_code and rank.misc_type = 'Ranking' " 
				+ "where 1=1 " 
				+ "and iv.activeFlag <> 2 "; 
				
				
		if(StringUtils.isNotEmpty(bean.getInventory_name())){
			query += " and ( iv.inventory_ID like '%"+bean.getInventory_ID()+"%' " ;
			query += " or iv.inventory_name like '%"+bean.getInventory_name()+"%' ) " ;
		}

		query += "order by iv.inventory_ID";
		
		System.out.println(query);
		
		List<InventoryCtrlBean> list = jdbcTemplate.query(query,INVENTORYCTRL_MAPPER);
		
		int total = list!=null? list.size():0;
		listinventoryCtrl.setRecordsTotal(total);
		listinventoryCtrl.setRecordsFiltered(total);
		listinventoryCtrl.setData(list);
		
		return listinventoryCtrl;
	}

	
	public void saveOrUpdate(InventoryCtrlBean obj) {
		if(StringUtils.isNotEmpty(obj.getInventory_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}


	
	public void save(InventoryCtrlBean inventoryCtrl) {
		// TODO Auto-generated method stub
		System.out.println("############################### Save");
    	System.out.println("Inventory_ID: " + inventoryCtrl.getInventory_ID());
		
		try {
			
			String query ="insert into tb_InventoryMaster(sysInventory_ID,"
					+ "Inventory_ID,"
					+ "Inventory_name,"
					+ "unitType_ID,"
					+ "location_ID,"
					+ "maker_ID,"					
					+ "min_stock,"
					+ "max_stock,"
					+ "qty,"
					+ "price,"
					+ "activeFlag,"
					+ "rank,"
					+ "createDate,"
					+ "createBy) "+
					"values(?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?) ";
			jdbcTemplate.update(query,
					new Object[] {  
							"sys" + inventoryCtrl.getInventory_ID(),
							
							inventoryCtrl.getInventory_ID(),
							inventoryCtrl.getInventory_name(),
							
							inventoryCtrl.getUnitType().getUnitType_ID(),
							inventoryCtrl.getLocation().getLocation_ID(),
							inventoryCtrl.getMaker().getMaker_ID(),
														
							inventoryCtrl.getMin_stock(),
							inventoryCtrl.getMax_stock(),
							inventoryCtrl.getQty(),
							inventoryCtrl.getPrice(),
							inventoryCtrl.getActiveFlag(),
							inventoryCtrl.getRank(),
							inventoryCtrl.getCreateBy(),
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;		
	}

	
	public void delete(InventoryCtrlBean inventoryCtrl) {
		// TODO Auto-generated method stub
		try {
			
			String query = ("update tb_InventoryMaster set activeFlag = 2, updateBy=?, updateDate=getdate() Where 1=1 and sysInventory_ID=?");
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							inventoryCtrl.getUpdateBy(),							
							"sys" + inventoryCtrl.getInventory_ID()
							});	

		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	
	public void edit(InventoryCtrlBean inventoryCtrl) {
		// TODO Auto-generated method stub
				
		try {
			
			String query = ("Update tb_InventoryMaster "+
					"Set inventory_ID=?,"
					+ "inventory_name=?, " 					
					+ "unitType_ID=?,"
					+ "location_ID=?,"
					+ "maker_ID=?,"					
					+ "min_stock=?,"
					+ "max_stock=?,"
					+ "qty=?,"
					+ "price=?,"
					+ "activeFlag=?,"
					+ "rank=?,"
					+ "updateBy=?, "
					+ "updateDate=getdate() "
					+ "where 1=1 "+
					"and sysInventory_ID=? ");
	   	    	
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					inventoryCtrl.getInventory_ID(),
							inventoryCtrl.getInventory_name(),

							inventoryCtrl.getUnitType().getUnitType_ID(),
							inventoryCtrl.getLocation().getLocation_ID(),
							inventoryCtrl.getMaker().getMaker_ID(),
														
							inventoryCtrl.getMin_stock(),
							inventoryCtrl.getMax_stock(),
							inventoryCtrl.getQty(),
							inventoryCtrl.getPrice(),
							inventoryCtrl.getActiveFlag(),
							inventoryCtrl.getRank(),
							inventoryCtrl.getCreateBy(),
							
							"sys" + inventoryCtrl.getInventory_ID()
	    					});
	    	
	    	List param = new ArrayList();
			param.add(inventoryCtrl.getInventory_ID());
			param.add(inventoryCtrl.getQty_before());
			param.add(inventoryCtrl.getQty());
			param.add(inventoryCtrl.getMovementCode());
			param.add(inventoryCtrl.getUpdateBy());
			param.add("Master");
			
			int movementCode = inventoryCtrl.getMovementCode();
			if (movementCode == 1)
					{
						param.add(inventoryCtrl.getInvoice_number());
						
						int insertMovement = jdbcTemplate.update("{call sp_InventoryMovement_Insert(?,?,?,?,?,?,?)}", param.toArray() );
					}
			else {
				
				int insertMovement = jdbcTemplate.update("{call sp_InventoryMovement_Insert(?,?,?,?,?,?,NULL)}", param.toArray() );
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	public void editByMovement(InventoryCtrlBean inventoryCtrl) {
		// TODO Auto-generated method stub
		
		try {

			
	    	String query = ("");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					inventoryCtrl.getQty(),
							inventoryCtrl.getUpdateBy(),
							
							inventoryCtrl.getInventory_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
		

}
