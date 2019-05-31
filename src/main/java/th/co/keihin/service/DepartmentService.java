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
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.FactoryBean;

@Repository("departmentService")
public class DepartmentService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper DEPARTMENT_MAPPER = new RowMapper(){
		
		@Override
		public DepartmentBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			DepartmentBean department = new DepartmentBean();
			
			department.setDept_ID(rs.getString("dept_ID"));
			department.setDept_name(rs.getString("dept_name"));
			
			department.setActiveFlag(rs.getInt("activeFlag"));
			department.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			department.setCreateBy(rs.getString("createBy"));
			department.setCreateDate(rs.getDate("createDate"));
			department.setUpdateBy(rs.getString("updateBy"));
			department.setUpdateDate(rs.getDate("updateDate"));
			
			return department;
		}
	};

	
	
	public DepartmentBean getDeptBeanByID(String dept_ID) {
		// TODO Auto-generated method stub
	
		String query = "Select dept.*, act.value1 as activeFlag_name "+
				"From tb_department dept " + 
				"left join tbm_misc_data act on dept.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and dept.activeFlag <> 2 " +
				"and dept.dept_ID='" + dept_ID +"'"; 
		
		List<DepartmentBean> list = jdbcTemplate.query(query,DEPARTMENT_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new DepartmentBean() ;
		
	}

	
	public DataTableAjax<DepartmentBean> getAll() {
		// TODO Auto-generated method stub
		DataTableAjax<DepartmentBean> listDepartment = new DataTableAjax<DepartmentBean>();
		
		String query = "Select dept.*, act.value1 as activeFlag_name "+
				"From tb_department dept " + 
				"left join tbm_misc_data act on dept.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and dept.activeFlag <> 2 " +
				"order by dept.dept_ID";
				
		List<DepartmentBean> list = jdbcTemplate.query(query,DEPARTMENT_MAPPER);
		
		int total = list!=null? list.size():0;
		listDepartment.setRecordsTotal(total);
		listDepartment.setRecordsFiltered(total);
		listDepartment.setData(list);
		
		return listDepartment;
	}

	
	public void saveOrUpdate(DepartmentBean obj) {
		if(StringUtils.isNotEmpty(obj.getDept_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}	
	
	public void save(DepartmentBean department) {
		// TODO Auto-generated method stub

		try {

			String query = "INSERT INTO tb_Department (dept_ID,dept_name,activeFlag,CreateDate,CreateBy) VALUES (?,?,?,getdate(),? )" ;
			jdbcTemplate.update(query,
			new Object[] {  
					department.getDept_ID(),
					department.getDept_name(),
					department.getActiveFlag(),
					department.getCreateBy(),
					});
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	
	
	
	public void delete(DepartmentBean department) {
		// TODO Auto-generated method stub
//		Connection con = null;
		try {

			String query = ("update tb_Department set activeFlag = 2, updateBy=?, updateDate=getdate() Where dept_ID=?");
	    	int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							department.getUpdateBy(),							
							department.getDept_ID()
							});
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(DepartmentBean department) {
		// TODO Auto-generated method stub
//		Connection con = null;
		
		try {
		
	    	String query = ("Update tb_Department "+
					"Set dept_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and dept_ID=? ");
	    	
	    	int updateRecord = jdbcTemplate.update(query,
			new Object[] {  
					department.getDept_name(),							
					department.getUpdateBy(),
					department.getActiveFlag(),
					department.getDept_ID()
					});

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	public List<LovInfo> loadActiveDepartment() {
		 List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
		
		String query = "Select dept.dept_ID, dept.dept_name "+
				"From tb_department dept " + 
				"where 1=1 and dept.activeFlag <> 2 " +
				"order by dept.dept_ID";
		
		
		List<DepartmentBean> deptlist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(DepartmentBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (DepartmentBean departmentBean : deptlist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(departmentBean.getDept_ID());
			lovInfo.setDescTH(departmentBean.getDept_name());
			lovInfo.setDescEN(departmentBean.getDept_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}


}
