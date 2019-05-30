package th.co.keihin.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.DepartmentBean;

@Repository("departmentService")
public class DepartmentService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper USERTYPE_MAPPER = new RowMapper(){
		
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
		
		List<DepartmentBean> list = jdbcTemplate.query(query,USERTYPE_MAPPER);
		 
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
				
		List<DepartmentBean> list = jdbcTemplate.query(query,USERTYPE_MAPPER);
		
		int total = list!=null? list.size():0;
		listDepartment.setRecordsTotal(total);
		listDepartment.setRecordsFiltered(total);
		listDepartment.setData(list);
		
		return listDepartment;
	}

	
	public Vector<DepartmentBean> getByName(String dept_name) {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		Vector<DepartmentBean> listDepartment = new Vector<DepartmentBean>();
		
		String query = "Select dept.*, act.value1 as activeFlag_name "+
				"From tb_department dept " + 
				"left join tbm_misc_data act on dept.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and dept.activeFlag <> 2 ";
		
		if (dept_name != null) {
			query += "and dept.dept_name like '%" + dept_name + "%'";
		}

		query += "Order By dept.dept_ID"; 
				
//		try {
//			con = DBConnect.getConnection();
//			stmt = con.createStatement();
//
//			rs = stmt.executeQuery(query);
//			
//			while (rs.next()) {
//			
//				DepartmentBean DepartmentBean = new DepartmentBean();
//				
//				DepartmentBean.setDept_ID(rs.getString("dept_ID"));
//				DepartmentBean.setDept_name(rs.getString("dept_name"));
//				
//				DepartmentBean.setActiveFlag(rs.getInt("activeFlag"));
//				DepartmentBean.setActiveFlag_name(rs.getString("activeFlag_name"));
//				
//				DepartmentBean.setCreateBy(rs.getString("createBy"));
//				DepartmentBean.setCreateDate(rs.getDate("createDate"));
//				DepartmentBean.setUpdateBy(rs.getString("updateBy"));
//				DepartmentBean.setUpdateDate(rs.getDate("updateDate"));
//				
//				listDepartment.add(DepartmentBean);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (stmt != null) {
//					stmt.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//			}
//
//		}

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
	    	
    	
//			con = DBConnect.getConnection();
//			PreparedStatement ps_del = con.prepareStatement("update tb_Department set activeFlag = 2, updateBy=?, updateDate=getdate() Where dept_ID=?");
//			
//			ps_del.setString(1, department.getUpdateBy());
//			ps_del.setString(2, department.getDept_ID());
//
//			ps_del.executeUpdate();
//	 
//			if (ps_del != null)
//				ps_del.close();
//			if (con != null)
//				con.close();

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

	
	public List<DepartmentBean> search(DepartmentBean department) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void saveStatement(DepartmentBean department) {
		// TODO Auto-generated method stub
		//String dept_ID = null;
//		Connection con = null;
//		
//		try {
//
//			con = DBConnect.getConnection();
//    	
//			String query = "INSERT INTO tb_Department (dept_ID,dept_name,activeFlag,CreateDate,CreateBy) " + 
//					"VALUES (?,?,?,getdate(),? )";
//			PreparedStatement ps_Insert = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
//			
//			ps_Insert.setString(1, department.getDept_ID());
//			ps_Insert.setString(2, department.getDept_name());
//			ps_Insert.setInt(3, department.getActiveFlag());
//			
//			if (department.getCreateBy() == null) {
//				department.setCreateBy("System");
//			}
//			ps_Insert.setString(4,department.getCreateBy());
//			
//			ps_Insert.executeUpdate();
//						
//						
//			System.out.println("insert id =" + department.getDept_ID());
//						
//			if (ps_Insert != null)
//				ps_Insert.close();
//			if (con != null)
//				con.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return;		
	}

	
	public void getNewDept_ID(String dept_ID, String dept_name, String activeFlag, String createBy) {
		// TODO Auto-generated method stub
//		Connection con = null;
//		
//		System.out.println("createBy : " + createBy + " || dept_name: " + dept_name + " || dept_ID: " + dept_ID + " || activeFlag: " + activeFlag);
//		
//		try {
//
//			con = DBConnect.getConnection();
//
//			PreparedStatement ps_Insert = con.prepareStatement(
//					"INSERT INTO tb_Department (dept_ID,dept_name,activeFlag,CreateDate,CreateBy) "+
//							"VALUES (?,?,?,getdate(),? ) ",
//							Statement.RETURN_GENERATED_KEYS);
//
//			ps_Insert.setString(1, dept_ID);
//			ps_Insert.setString(2, dept_name);
//			ps_Insert.setString(3, activeFlag);
//			ps_Insert.setString(4,createBy);
//			ps_Insert.executeUpdate();
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (con != null) {
//					con.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}			
	}


}
