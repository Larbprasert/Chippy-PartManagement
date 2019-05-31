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
import th.co.keihin.model.UserTypeBean;

@Repository("userTypeService")
public class UserTypeService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

private RowMapper USERTYPE_MAPPER = new RowMapper(){
	
	@Override
	public UserTypeBean mapRow(ResultSet rs, int rowNum) throws SQLException {

		UserTypeBean userType = new UserTypeBean();
		
		userType.setUserType_ID(rs.getString("userType_ID"));
		userType.setUserType_name(rs.getString("userType_name"));
		
		userType.setActiveFlag(rs.getInt("activeFlag"));
		userType.setActiveFlag_name(rs.getString("activeFlag_name"));
		
		userType.setCreateBy(rs.getString("createBy"));
		userType.setCreateDate(rs.getDate("createDate"));
		userType.setUpdateBy(rs.getString("updateBy"));
		userType.setUpdateDate(rs.getDate("updateDate"));
		
		return userType;
	}
};

	
	
	public UserTypeBean getUserTypeBeanByID(String userType_ID) {
		// TODO Auto-generated method stub
		
		String query = "Select a.*,act.value1 as activeFlag_name " +
				"From tb_UserType a " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.userType_ID='" + userType_ID +"'"; 
		
		List<UserTypeBean> list = jdbcTemplate.query(query,USERTYPE_MAPPER);
		 
	      return  list!=null&& list.size()>0? list.get(0) : new UserTypeBean() ;
	}
		
	
	public DataTableAjax<UserTypeBean> getAll() {
		// TODO Auto-generated method stub
		DataTableAjax<UserTypeBean> listuserType = new DataTableAjax<UserTypeBean>();
		
		String query = "Select a.*,act.value1 as activeFlag_name " +
				"From tb_UserType a " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.userType_ID";
				
		List<UserTypeBean> list = jdbcTemplate.query(query,USERTYPE_MAPPER);
		
		int total = list!=null? list.size():0;
		listuserType.setRecordsTotal(total);
		listuserType.setRecordsFiltered(total);
		listuserType.setData(list);
		
		return listuserType;
	}

	
	public Vector<UserTypeBean> getByName(String userType_name) {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		Vector<UserTypeBean> listUType = new Vector<UserTypeBean>();
		
		String query = "Select a.*,act.value1 as activeFlag_name " +
				"From tb_UserType a " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 ";
		
		if (userType_name != null) {
			query += "and a.userType_name like '%" + userType_name + "%'";
		}

		query += "Order By a.userType_ID"; 
				
//		try {
//			con = DBConnect.getConnection();
//			stmt = con.createStatement();
//
//			rs = stmt.executeQuery(query);
//			
//			while (rs.next()) {
//			
//				UserTypeBean userType = new UserTypeBean();
//				
//				userType.setUserType_ID(rs.getString("userType_ID"));
//				userType.setUserType_name(rs.getString("userType_name"));
//				
//				userType.setActiveFlag(rs.getInt("activeFlag"));
//				userType.setActiveFlag_name(rs.getString("activeFlag_name"));
//				
//				userType.setCreateBy(rs.getString("createBy"));
//				userType.setCreateDate(rs.getDate("createDate"));
//				userType.setUpdateBy(rs.getString("updateBy"));
//				userType.setUpdateDate(rs.getDate("updateDate"));
//				
//				listUType.add(userType);
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
//		}
//
//		}

		return listUType;
	}

	
	public void save(UserTypeBean userType) {
		// TODO Auto-generated method stub
		
		try {

			String query = "INSERT INTO tb_userType (userType_ID,userType_name,activeFlag,CreateDate,CreateBy) "+
							"VALUES ((SELECT top 1 'UT' + CAST(CAST(substring((select case when max(userType_ID) IS NULL then '1' else max(userType_ID) end userType_ID "+
							"from [dbo].[tb_UserType]),3,len((select case when max(userType_ID) IS NULL then '1' else max(userType_ID) end userType_ID "+
							"from [dbo].[tb_UserType]))) AS INT)+1 AS varchar(50))) "+
							",?,?,getdate(),? )" ;
			jdbcTemplate.update(query,
					new Object[] {  
							userType.getUserType_name(),
							userType.getActiveFlag(),
							userType.getCreateBy(),
							});
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}	
			
	}

	
	public void delete(UserTypeBean userType) {
		// TODO Auto-generated method stub
			
			try {
	    	String query = ("update tb_UserType set activeFlag = 2, updateBy=?, updateDate=getdate() Where userType_ID=?");
		    	int updateRecord = jdbcTemplate.update(query,
						new Object[] {  
								userType.getUpdateBy(),							
								userType.getUserType_ID()
								});
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
	}

	public void saveOrUpdate(UserTypeBean obj) {
		if(StringUtils.isNotEmpty(obj.getUserType_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	public void edit(UserTypeBean userType) {
		// TODO Auto-generated method stub
//		Connection con = null;
		
		try {

//			con = DBConnect.getConnection();
			
	    	String query = ("Update tb_UserType "+
					"Set userType_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and userType_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							userType.getUserType_name(),							
							userType.getUpdateBy(),
							userType.getActiveFlag(),
							userType.getUserType_ID()
							});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public List<UserTypeBean> search(UserTypeBean userType) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void saveStatement(UserTypeBean userType) {
		// TODO Auto-generated method stub
//		String userType_ID = null;
//		Connection con = null;
//		
//		try {
//
//			con = DBConnect.getConnection();
//    	
//			String query = "INSERT INTO tb_userType (userType_ID,userType_name,activeFlag,CreateDate,CreateBy) "+
//							"VALUES ((SELECT top 1 'UT' + CAST(CAST(substring((select case when max(userType_ID) IS NULL then '1' else max(userType_ID) end userType_ID "+
//							"from [dbo].[tb_UserType]),3,len((select case when max(userType_ID) IS NULL then '1' else max(userType_ID) end userType_ID "+
//							"from [dbo].[tb_UserType]))) AS INT)+1 AS varchar(50))) "+
//							",'?',?,getdate(),'?' ) ";
//			PreparedStatement ps_Insert = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
//			
//			ps_Insert.setString(1, userType.getUserType_name());
//			
//			if (userType.getCreateBy() == null) {
//				userType.setCreateBy("System");
//			}
//			ps_Insert.setInt(2, userType.getActiveFlag());
//			ps_Insert.setString(3,userType.getCreateBy());
//			
//			ps_Insert.executeUpdate();
//						
//			PreparedStatement ps2 = con
//	        .prepareStatement("SELECT (select max(userType_ID) from tb_UserType) as userType_ID FROM tb_UserType");
//	 
//			ResultSet rs = ps2.executeQuery();
//			if (rs.next()) {
//				userType_ID =  rs.getString(1);
//			}
//			
//			System.out.println("insert id =" + userType_ID);
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
//	}
}




};
