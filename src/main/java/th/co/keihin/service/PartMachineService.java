package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.keihin.model.MachineBean;
import th.co.keihin.model.PartMachineBean;
import th.co.keihin.model.PartMasterBean;


@Repository("partMachineService")
public class PartMachineService {
	

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
private RowMapper PARTMASTER_MAPPER = new RowMapper(){
		
		
	public PartMachineBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			PartMachineBean partMachine = new PartMachineBean();
			PartMasterBean partMaster = new PartMasterBean();
			MachineBean machine = new MachineBean();
			
			partMaster.setPart_ID(rs.getString("part_ID"));
			partMaster.setPart_name(rs.getString("part_name"));
			partMachine.setPartMaster(partMaster);
			
			partMachine.setPart_ID(rs.getString("part_ID"));
			partMachine.setPart_name(rs.getString("part_name"));

			partMachine.setQty(rs.getInt("qty"));
			
			machine.setMachine_ID(rs.getString("machine_ID"));
			machine.setMachine_name(rs.getString("machine_name"));
			partMachine.setMachine(machine);
			
			partMachine.setCreateBy(rs.getString("createBy"));
			partMachine.setCreateDate(rs.getDate("createDate"));
								
			return partMachine;
		}
	};
	

}
