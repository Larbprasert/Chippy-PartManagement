package th.co.keihin.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.keihin.model.CheckToolBean;
import th.co.keihin.model.LocationBean;

@Repository("checkToolService")
public class CheckToolService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public CheckToolBean getCheckToolBeanByID(String checkTool_ID) {
		String query = "select ct.*, md.value1, md.value1 as timing_name, act.value1 as activeFlag_name " +
				"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
				"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 " +
				"and ct.activeFlag <> 2 " + 
				"and checkTool_ID='" + checkTool_ID +"'";
		
		List<CheckToolBean> list = jdbcTemplate.query(query,CHECKTOOL_MAPPER);
		 
	      return  list!=null&& list.size()>0? list.get(0) : new CheckToolBean() ;
	}

	
	public DataTableAjax<CheckToolBean> getAll() {
		
		DataTableAjax<CheckToolBean> listcheckTool = new DataTableAjax<CheckToolBean>();
		
		String query = "select ct.*, md.value1 as timing_name, act.value1 as activeFlag_name " +
					"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
					"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
					"where 1=1 " +
					"and ct.activeFlag <> 2 " + 
					"order by ct.checkTool_ID";
		

		List<CheckToolBean> list = jdbcTemplate.query(query,CHECKTOOL_MAPPER);
		int total = list!=null? list.size():0;
		listcheckTool.setRecordsTotal(total);
		listcheckTool.setRecordsFiltered(total);
		listcheckTool.setData(list);
		return listcheckTool;
	}
	
	  
    private RowMapper CHECKTOOL_MAPPER = new RowMapper(){
		@Override
		public CheckToolBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			CheckToolBean checkToolBean = new CheckToolBean();
			
			checkToolBean.setCheckTool_ID(rs.getString("checkTool_ID"));
			checkToolBean.setCheckTool_name(rs.getString("checkTool_name"));
			
			checkToolBean.setTiming(rs.getInt("timing"));
			checkToolBean.setTiming_name(rs.getString("timing_name"));
			
			checkToolBean.setActiveFlag(rs.getInt("activeFlag"));
			checkToolBean.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			checkToolBean.setCreateBy(rs.getString("createBy"));
			checkToolBean.setCreateDate(rs.getDate("createDate"));
			checkToolBean.setUpdateBy(rs.getString("updateBy"));
			checkToolBean.setUpdateDate(rs.getDate("updateDate"));
			
			return checkToolBean;
		}
    };

	
	public Vector<CheckToolBean> getByName(String checkTool_name) {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		Vector<CheckToolBean> listcheckTool = new Vector<CheckToolBean>();
		
		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
				"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
				"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 " +
				"and ct.activeFlag <> 2 ";		
		
		if (checkTool_name != null) {
			query += "and ct.checkTool_name like '%" + checkTool_name + "%'";
		}

		query += "Order By ct.checkTool_ID"; 
	
		return listcheckTool;
	}

	
	public void save(CheckToolBean checkTool) {

			
			try {
		    	String query = "INSERT INTO tb_checkTool (checkTool_ID,checkTool_name,timing,activeFlag,CreateDate,CreateBy) "+
						"VALUES (?,?,?,?,getdate(),? ) ";
				 jdbcTemplate.update(query,
						new Object[] {  
								checkTool.getCheckTool_ID(),
								checkTool.getCheckTool_name(),
								checkTool.getTiming(),
								checkTool.getActiveFlag(),
								checkTool.getCreateBy(),
								});
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	}

	
	public void delete(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		Connection con = null;
	

		try {
	    	String query = ("update tb_checkTool set activeFlag = 2, updateBy=?, updateDate=getdate() Where checkTool_ID=?");
		    	int updateRecord = jdbcTemplate.update(query,
						new Object[] {  
								checkTool.getUpdateBy(),							
								checkTool.getCheckTool_ID()
								});
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
		
	}

	public void saveOrUpdate(CheckToolBean obj) {
		if(StringUtils.isNotEmpty(obj.getCheckTool_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	public void edit(CheckToolBean inv) {
		try {
	    	String query = ("Update tb_checkTool "+
					"Set checkTool_name=?, "+
	    			"timing=?, " +
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where  checkTool_ID=? ");
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							inv.getCheckTool_name(),
							inv.getTiming(),
							inv.getUpdateBy(),
							inv.getActiveFlag(),
							inv.getCheckTool_ID()
							});
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<LovInfo> loadCheckToolBefore() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
			
		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
				"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
				"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 " +
				"and ct.activeFlag <> 2 " +
				"and ct.timing = 1 " +
				"order by ct.checkTool_ID";
				
		List<CheckToolBean> checkToolList = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(CheckToolBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (CheckToolBean checkTool : checkToolList) {
			lovInfo = new LovInfo();
			lovInfo.setCode(checkTool.getCheckTool_ID());
			lovInfo.setDescTH(checkTool.getCheckTool_name());
			lovInfo.setDescEN(checkTool.getCheckTool_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
	
	public List<LovInfo> loadCheckToolAfter() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
		
		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
				"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
				"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 " +
				"and ct.activeFlag <> 2 " +
				"and ct.timing = 2 " +
				"order by ct.checkTool_ID";
				
		List<CheckToolBean> checkToolList = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(CheckToolBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (CheckToolBean checkTool : checkToolList) {
			lovInfo = new LovInfo();
			lovInfo.setCode(checkTool.getCheckTool_ID());
			lovInfo.setDescTH(checkTool.getCheckTool_name());
			lovInfo.setDescEN(checkTool.getCheckTool_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
}
