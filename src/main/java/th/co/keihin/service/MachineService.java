package th.co.keihin.service;

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
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.keihin.constant.RequestConstants;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.MachineBean;
import th.co.keihin.model.PartMachineBean;
import th.co.keihin.model.ProductionLineBean;
import th.co.keihin.model.RepairDetail;
import th.co.portal.model.gas.ResponseResult;

@Repository("machineService")
public class MachineService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PartMachineService partMachineService;
	
	private RowMapper MACHINE_MAPPER = new RowMapper(){
		
		@Override
		public MachineBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			MachineBean machine = new MachineBean();
			ProductionLineBean productionLine = new ProductionLineBean();
						
			machine.setMachine_ID(rs.getString("machine_ID"));
			machine.setMachine_name(rs.getString("machine_name"));
			
			machine.setActiveFlag(rs.getString("activeFlag"));
			machine.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			machine.setCreateBy(rs.getString("createBy"));
			machine.setCreateDate(rs.getDate("createDate"));
			machine.setUpdateBy(rs.getString("updateBy"));
			machine.setUpdateDate(rs.getDate("updateDate"));
			
			productionLine.setProductionLine_ID(rs.getString("productionLine_ID"));
			productionLine.setProductionLine_name(rs.getString("productionLine_name"));
			
			machine.setProductionLine(productionLine);
			
			return machine;
		}
	};	
	
	
	public MachineBean getMachineBeanByID(String machine_ID) {
		// TODO Auto-generated method stub
				
		String query = "Select a.*, b.productionLine_name, act.value1 as activeFlag_name "+
				"From tb_machine a left join tb_ProductionLine b on a.productionLine_ID = b.productionLine_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.machine_ID='" + machine_ID +"'"; 
		List<MachineBean> list = jdbcTemplate.query(query,MACHINE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new MachineBean();
	}

	public DataTableAjax<MachineBean> getAll() {
		// TODO Auto-generated method stub
				
		DataTableAjax<MachineBean> listmachine = new DataTableAjax<MachineBean>();
		
		String query = "Select a.*, b.productionLine_name, act.value1 as activeFlag_name "+
				"From tb_machine a left join tb_ProductionLine b on a.productionLine_ID = b.productionLine_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.productionLine_ID";
		List<MachineBean> list = jdbcTemplate.query(query,MACHINE_MAPPER);
		
		int total = list!=null? list.size():0;
		listmachine.setRecordsTotal(total);
		listmachine.setRecordsFiltered(total);
		listmachine.setData(list);
		
		return listmachine;
	}

	public void saveOrUpdate(MachineBean obj) {
		if(StringUtils.isNotEmpty(obj.getMachine_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}

	
	public void save(MachineBean machine) {
		// TODO Auto-generated method stub
		
		System.out.println("createBy : " + machine.getCreateBy() + " || machine_name: " + machine.getMachine_name() + 
				" || machine_ID: " + machine.getMachine_ID() + " || activeFlag: " + machine.getActiveFlag());
		
		try {

			String query = "INSERT INTO tb_machine (machine_ID,machine_name,activeFlag,CreateDate,CreateBy,productionLine_ID) "+
							"VALUES (?,?,?,getdate(),?,? ) ";		
			jdbcTemplate.update(query,
					new Object[] {  
							machine.getMachine_ID(),
							machine.getMachine_name(),
							machine.getActiveFlag(),
							machine.getCreateBy(),
							machine.getProductionLine().getProductionLine_ID(),
							});
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(MachineBean machine) {
		// TODO Auto-generated method stub
		try {

			String query = "update tb_machine set activeFlag = 2, updateBy=?, updateDate=getdate() Where machine_ID=?";
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							machine.getUpdateBy(),							
							machine.getMachine_ID()
							});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(MachineBean machine) {
		// TODO Auto-generated method stub
				
		try {
			
	    	String query = ("Update tb_machine "+
					"Set machine_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=?, productionLine_ID=? "+
					"where 1=1 "+
					"and machine_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					machine.getMachine_name(),							
	    					machine.getUpdateBy(),
	    					machine.getActiveFlag(),
	    					
	    					machine.getProductionLine().getProductionLine_ID(),
	    					
	    					machine.getMachine_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public List<LovInfo> loadActiveMachine() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
			
		String query = "Select a.machine_ID, a.machine_name "+
				"From tb_machine a " + 
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.machine_ID";
				
		List<MachineBean> machinelist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(MachineBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (MachineBean machineBean : machinelist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(machineBean.getMachine_ID());
			lovInfo.setDescTH(machineBean.getMachine_name());
			lovInfo.setDescEN(machineBean.getMachine_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
	
	
	
	
	
	//################################################### Part in Machine
	public DataTableAjax<PartMachineBean> getPartMachine(PartMachineBean bean) {
		String query = "SELECT pmac.* , mac.machine_name, pm.part_name " + 
				"FROM tb_Part_Machine pmac " + 
				"  LEFT JOIN tb_Machine mac on pmac.machine_ID = mac.machine_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"  LEFT JOIN tb_PartMaster pm on pmac.part_ID = pm.part_ID COLLATE SQL_Latin1_General_CP1_CI_AS " + 
				"WHERE 1=1 " +
				"and mac.machine_ID= ? "; 
		List list = jdbcTemplate.queryForList(query,new Object[] { bean.getMachine_ID() } );
		
		DataTableAjax<PartMachineBean> listpartmachine = new DataTableAjax<PartMachineBean>();
		int total = list!=null? list.size():0;
		listpartmachine.setRecordsTotal(total);
		listpartmachine.setRecordsFiltered(total);
		listpartmachine.setData(list);
		
		return listpartmachine;
	}
	
	public ResponseResult partMachineSave(PartMachineBean partMachine) {
		// TODO Auto-generated method stub
		
		System.out.println("createBy : " + partMachine.getCreateBy() + " || machine_name: " + partMachine.getMachine().getMachine_name() + 
				" || machine_ID: " + partMachine.getMachine_ID() + " || Part_ID: " + partMachine.getPart_ID() +
				" || machine_ID: " + partMachine.getPartMaster().getPart_name());
		
		try {

			String query = "INSERT INTO tb_part_machine (part_ID,machine_ID,qty,createDate,createBy) "+
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
		
		ResponseResult responseResult = new ResponseResult();
		
		responseResult.setCode(RequestConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(RequestConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(partMachine);
		return responseResult;	
	}
	
		
	public ResponseResult partMachineDelete(PartMachineBean partMachine) {
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
		
		ResponseResult responseResult = new ResponseResult();
		
		responseResult.setCode(RequestConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(RequestConstants.RESPONSE.SUCCESS_MSG);
		responseResult.setData(partMachine);
		return responseResult;		
	}
	//################################################### Part in Machine
	
}
