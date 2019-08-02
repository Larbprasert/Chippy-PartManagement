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
import th.co.keihin.model.MachineBean;
import th.co.keihin.model.PartMachineBean;
import th.co.keihin.model.PartMasterBean;
import th.co.keihin.model.UnitTypeBean;


@Repository("partMachineService")
public class PartMachineService {
	

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
private RowMapper PARTMACHINE_MAPPER = new RowMapper(){
		
		
	public PartMachineBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			PartMachineBean partMachine = new PartMachineBean();
			PartMasterBean partMaster = new PartMasterBean();
			MachineBean machine = new MachineBean();
			UnitTypeBean unitType = new UnitTypeBean();
			
			partMachine.setMachine_ID(rs.getString("machine_ID"));
			partMachine.setPart_ID(rs.getString("part_ID"));
			partMachine.setPart_name(rs.getString("part_name"));
			partMachine.setQty(rs.getInt("qty"));
			
			partMachine.setCreateBy(rs.getString("createBy"));
			partMachine.setCreateDate(rs.getDate("createDate"));

//			partMaster.setPart_ID(rs.getString("part_ID"));
			partMaster.setPart_name(rs.getString("part_name"));
			partMaster.setPrice(rs.getFloat("price"));
			partMachine.setPartMaster(partMaster);
			
//			machine.setMachine_ID(rs.getString("machine_ID"));
			machine.setMachine_name(rs.getString("machine_name"));
			partMachine.setMachine(machine);
			
			unitType.setUnitType_name(rs.getString("unitType_name"));
			partMachine.setUnitType(unitType);
								
			return partMachine;
		}
	};

	public PartMachineBean getPartBeanByMachineID(String machine_ID) {
		// TODO Auto-generated method stub
				
		String query = "SELECT pmac.* , mac.machine_name, pm.part_name " + 
				"FROM tb_Part_Machine pmac " + 
				"  LEFT JOIN tb_Machine mac on pmac.machine_ID = mac.machine_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"  LEFT JOIN tb_PartMaster pm on pmac.part_ID = pm.part_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"WHERE 1=1 " +
				"and mac.machine_ID='" + machine_ID +"'"; 
		List<PartMachineBean> list = jdbcTemplate.query(query,PARTMACHINE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new PartMachineBean();
	}
	
	public PartMachineBean getPartBeanByPartID(String part_ID) {
		// TODO Auto-generated method stub
		
		String query = "SELECT pmac.* , mac.machine_name, pm.part_name " + 
				"FROM tb_Part_Machine pmac " + 
				"  LEFT JOIN tb_Machine mac on pmac.machine_ID = mac.machine_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"  LEFT JOIN tb_PartMaster pm on pmac.part_ID = pm.part_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"WHERE 1=1 " +
				"and pm.part_ID='" + part_ID +"'"; 
		List<PartMachineBean> list = jdbcTemplate.query(query,PARTMACHINE_MAPPER);
		
		return  list!=null&& list.size()>0? list.get(0) : new PartMachineBean();
	}

	public DataTableAjax<PartMachineBean> getAll(PartMachineBean bean) {
		// TODO Auto-generated method stub
				
		DataTableAjax<PartMachineBean> listpartmachine = new DataTableAjax<PartMachineBean>();
		
		String query = "SELECT pmac.* , mac.machine_name, pm.part_name " 
				+ ",pm.price "
				+ ",ut.unitType_name " 
				+ "FROM tb_Part_Machine pmac " 
				+ "  LEFT JOIN tb_Machine mac ON pmac.machine_ID = mac.machine_ID COLLATE SQL_Latin1_General_CP1_CI_AS "  
				+ "  LEFT JOIN tb_PartMaster pm ON pmac.part_ID = pm.part_ID COLLATE SQL_Latin1_General_CP1_CI_AS " 
				+ "  LEFT JOIN tb_UnitType ut ON pm.unitType_ID = ut.unitType_ID " 
				+ "WHERE 1=1 ";				
		
		if(StringUtils.isNotEmpty(bean.getPart_name())){
			query += " AND ( pmac.part_ID like '%"+bean.getPart_name()+"%' " ;
			query += " OR pm.part_name like '%"+bean.getPart_name()+"%' ) " ;
		}
		
		if(StringUtils.isNotEmpty(bean.getMachine_ID())){
			query += " AND pmac.machine_id = (SELECT machine_id FROM tb_requestheader WHERE 1=1 AND request_id = '" +bean.getMachine_ID()+ "' ) ";
		}
		
		if(StringUtils.isNotEmpty(bean.getMachine_ID())){
			query += " AND pmac.part_ID COLLATE SQL_Latin1_General_CP1_CI_AS NOT IN ( SELECT pa.part_ID FROM  tb_RepairDetail pa WHERE pa.request_ID = '"+bean.getMachine_ID()+"' ) " ;
		}		
		
		query += "ORDER BY pmac.machine_ID";
		
		System.out.println(query);
		
		List<PartMachineBean> list = jdbcTemplate.query(query,PARTMACHINE_MAPPER);
		
		int total = list!=null? list.size():0;
		listpartmachine.setRecordsTotal(total);
		listpartmachine.setRecordsFiltered(total);
		listpartmachine.setData(list);
		
		return listpartmachine;
	}
	
	public void saveOrDelete(PartMachineBean obj) {
		if(StringUtils.isNotEmpty(obj.getPart_ID())){
			delete(obj);
		}else{
			save(obj);
		}
	}
	
	public void save(PartMachineBean partMachine) {
		// TODO Auto-generated method stub
		
		System.out.println("createBy : " + partMachine.getCreateBy() + " || machine_name: " + partMachine.getMachine().getMachine_name() + 
				" || machine_ID: " + partMachine.getMachine_ID() + " || Part_ID: " + partMachine.getPart_ID() +
				" || machine_ID: " + partMachine.getPartMaster().getPart_name());
		
		try {

			String query = "INSERT INTO tb_partmachine (part_ID,machine_ID,qty,createDate,createBy) "+
							"VALUES (?,?,?,getdate(),?) ";		
			jdbcTemplate.update(query,
					new Object[] {  
							partMachine.getPart_ID(),
							partMachine.getMachine_ID(),
							partMachine.getQty(),
							partMachine.getCreateBy(),
							});
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(PartMachineBean partMachine) {
		// TODO Auto-generated method stub
		try {

			String query = "DELETE FROM tb_partmachine WHERE 1=1 AND part_ID=?, AND machine_ID = ?";
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							partMachine.getPart_ID(),							
							partMachine.getMachine_ID()
							});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

}
