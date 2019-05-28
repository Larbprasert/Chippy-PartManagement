package th.co.keihin.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.util.DateUtils;
import th.co.keihin.model.CheckToolBean;
import th.co.portal.model.gas.Equipment;
import th.co.portal.model.gas.RequestList;

@Repository("checkToolService")
public class CheckToolService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public CheckToolBean getCheckToolBeanByID(String checkTool_ID) {
		// TODO Auto-generated method stub
//		Connection con = null;
//		ResultSet rs = null;
//		Statement checkTool = null;
//		
//		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
//				"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
//				"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
//				"where 1=1 " +
//				"and ct.activeFlag <> 2 " + 
//				"and checkTool_ID='" + checkTool_ID +"'";
//		
		CheckToolBean checkToolBean = new CheckToolBean();
//		
//		System.out.println(query);
//		
//		try {
////			con = DBConnect.getConnection();
////			checkTool = con.createStatement();
//
//			rs = checkTool.executeQuery(query);
//
//			while (rs.next()) {
//				
//				checkToolBean.setCheckTool_ID(rs.getString("checkTool_ID"));
//				checkToolBean.setCheckTool_name(rs.getString("checkTool_name"));
//				
//				checkToolBean.setTiming(rs.getInt("timing"));
//				checkToolBean.setTiming_name(rs.getString("value1"));
//				
//				checkToolBean.setActiveFlag(rs.getInt("activeFlag"));
//				checkToolBean.setActiveFlag_name(rs.getString("activeFlag_name"));
//				
//				checkToolBean.setCreateBy(rs.getString("createBy"));
//				checkToolBean.setCreateDate(rs.getDate("createDate"));
//				checkToolBean.setUpdateBy(rs.getString("updateBy"));
//				checkToolBean.setUpdateDate(rs.getDate("updateDate"));
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (checkTool != null) {
//					checkTool.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//			}
//
//		}		
		return checkToolBean;
	}

	
	public DataTableAjax<CheckToolBean> getAll() {
		// TODO Auto-generated method stub
//		Connection con = null;
//		ResultSet rs = null;
//		Statement stmt = null;
		
		DataTableAjax<CheckToolBean> listcheckTool = new DataTableAjax<CheckToolBean>();
		
		String query = "select ct.*, md.value1 as timing_name, act.value1 as activeFlag_name " +
					"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
					"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
					"where 1=1 " +
					"and ct.activeFlag <> 2 " + 
					"order by ct.checkTool_ID";
		

		List<CheckToolBean> list = jdbcTemplate.query(query,CHECKTOOL_MAPPER);
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
			checkToolBean.setTiming_name(rs.getString("value1"));
			
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
				
//		try {
//			con = DBConnect.getConnection();
//			stmt = con.createStatement();
//
//			rs = stmt.executeQuery(query);
//			
//			while (rs.next()) {
//			
//				CheckToolBean checkToolBean = new CheckToolBean();
//				
//				checkToolBean.setCheckTool_ID(rs.getString("checkTool_ID"));
//				checkToolBean.setCheckTool_name(rs.getString("checkTool_name"));
//				
//				checkToolBean.setTiming(rs.getInt("timing"));
//				checkToolBean.setTiming_name(rs.getString("value1"));
//				
//				checkToolBean.setActiveFlag(rs.getInt("activeFlag"));
//				checkToolBean.setActiveFlag_name(rs.getString("activeFlag_name"));
//				
//				checkToolBean.setCreateBy(rs.getString("createBy"));
//				checkToolBean.setCreateDate(rs.getDate("createDate"));
//				checkToolBean.setUpdateBy(rs.getString("updateBy"));
//				checkToolBean.setUpdateDate(rs.getDate("updateDate"));
//				
//				listcheckTool.add(checkToolBean);
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

		return listcheckTool;
	}

	
	public void save(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		Connection con = null;
		
		System.out.println("createBy : " + checkTool.getCreateBy() + " || checkTool_name: " + checkTool.getCheckTool_name() + 
				" || checkTool_ID: " + checkTool.getCheckTool_ID() + " || activeFlag: " + checkTool.getActiveFlag());
		
//		try {
//
//			con = DBConnect.getConnection();
//
//			PreparedStatement ps_Insert = con.prepareStatement(
//					"INSERT INTO tb_checkTool (checkTool_ID,checkTool_name,timing,activeFlag,CreateDate,CreateBy) "+
//							"VALUES (?,?,?,?,getdate(),? ) ",
//							Statement.RETURN_GENERATED_KEYS);
//
//			ps_Insert.setString(1, checkTool.getCheckTool_ID());
//			ps_Insert.setString(2, checkTool.getCheckTool_name());
//			
//			ps_Insert.setInt(3, checkTool.getTiming());
//			ps_Insert.setInt(4, checkTool.getActiveFlag());
//			
//			if (checkTool.getCreateBy() == null) {
//				checkTool.setCreateBy("System");
//			}
//			ps_Insert.setString(5,checkTool.getCreateBy());
//			
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

	
	public void delete(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		Connection con = null;
//		try {
//
//			con = DBConnect.getConnection();
//			PreparedStatement ps_del = con.prepareStatement("update tb_checkTool set activeFlag = 2, updateBy=?, updateDate=getdate() Where checkTool_ID=?");
//			
//			ps_del.setString(1, checkTool.getUpdateBy());
//			ps_del.setString(2, checkTool.getCheckTool_ID());
//
//			ps_del.executeUpdate();
//	 
//			if (ps_del != null)
//				ps_del.close();
//			if (con != null)
//				con.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
	}

	
	public void edit(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		Connection con = null;
		
//		try {
//
//			con = DBConnect.getConnection();
//			
//	    	String query = ("Update tb_checkTool "+
//					"Set checkTool_name=?, "+
//	    			"timing=?, " +
//					"updateBy=?, updateDate=getdate() "+
//					",activeFlag=? "+
//					"where 1=1 "+
//					"and checkTool_ID=? ");
//	    	PreparedStatement ps_edit = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
//	   
//			System.out.println(ps_edit.toString());
//			System.out.println(query);
//			
//			//System.out.println(checkTool.getActiveFlag());
//			
//			ps_edit.setString(1, checkTool.getCheckTool_name());
//			
//			ps_edit.setInt(2,checkTool.getTiming());
//			
//			if (checkTool.getUpdateBy() == null) {
//				checkTool.setUpdateBy("System");
//			}
//			ps_edit.setString(3,checkTool.getUpdateBy());
//			ps_edit.setInt(4,checkTool.getActiveFlag());
//			
//			//### Where condition
//			ps_edit.setString(5, checkTool.getCheckTool_ID());
//			
//			System.out.println(ps_edit.toString());
//			
//			ps_edit.executeUpdate();
//			
//			if (ps_edit != null)
//				ps_edit.close();
//			if (con != null)
//				con.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
	}

	
	public List<CheckToolBean> search(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void saveStatement(CheckToolBean checkTool) {
		// TODO Auto-generated method stub
		String checkTool_ID = null;
		Connection con = null;
		
//		try {
//
//			con = DBConnect.getConnection();
//    	
//			String query = "INSERT INTO tb_checkTool (checkTool_ID,checkTool_name,timing,activeFlag,CreateDate,CreateBy) " + 
//					"VALUES (?,?,?,?,getdate(),? )";
//			PreparedStatement ps_Insert = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
//			
//			ps_Insert.setString(1, checkTool.getCheckTool_ID());
//			ps_Insert.setString(2, checkTool.getCheckTool_name());
//			
//			ps_Insert.setInt(3, checkTool.getTiming());
//			ps_Insert.setInt(4, checkTool.getActiveFlag());
//			
//			if (checkTool.getCreateBy() == null) {
//				checkTool.setCreateBy("System");
//			}
//			ps_Insert.setString(5,checkTool.getCreateBy());
//			
//			ps_Insert.executeUpdate();
//						
//						
//			System.out.println("insert id =" + checkTool.getCheckTool_ID());
//						
//			if (ps_Insert != null)
//				ps_Insert.close();
//			if (con != null)
//				con.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return;		
	}

	
	public void getNewCheckTool_ID(String checkTool_ID, String checkTool_name,String timing, String activeFlag, String createBy) {
		// TODO Auto-generated method stub
		Connection con = null;
		
		System.out.println("createBy : " + createBy + " || checkTool_name: " + checkTool_name + " || checkTool_ID: " + checkTool_ID + " || activeFlag: " + activeFlag);
		
//		try {
//
//			con = DBConnect.getConnection();
//
//			PreparedStatement ps_Insert = con.prepareStatement(
//					"INSERT INTO tb_checkTool (checkTool_ID,checkTool_name,timing,activeFlag,CreateDate,CreateBy) "+
//							"VALUES (?,?,?,?,getdate(),? ) ",
//							Statement.RETURN_GENERATED_KEYS);
//
//			ps_Insert.setString(1, checkTool_ID);
//			ps_Insert.setString(2, checkTool_name);
//			
//			ps_Insert.setString(3, timing);
//			ps_Insert.setString(4, activeFlag);
//			
//			ps_Insert.setString(5,createBy);
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

	
	public Vector<CheckToolBean> getCheckToolBefore() {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		Vector<CheckToolBean> listcheckTool = new Vector<CheckToolBean>();
		
		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
					"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
					"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
					"where 1=1 " +
					"and ct.activeFlag <> 2 " +
					"and ct.timing = 1 " +
					"order by ct.checkTool_ID";
				
//		try {
//			con = DBConnect.getConnection();
//			stmt = con.createStatement();
//
//			rs = stmt.executeQuery(query);
//			
//			while (rs.next()) {
//			
//				CheckToolBean checkToolBean = new CheckToolBean();
//				
//				checkToolBean.setCheckTool_ID(rs.getString("checkTool_ID"));
//				checkToolBean.setCheckTool_name(rs.getString("checkTool_name"));
//				
//				checkToolBean.setTiming(rs.getInt("timing"));
//				checkToolBean.setTiming_name(rs.getString("value1"));
//				
//				checkToolBean.setActiveFlag(rs.getInt("activeFlag"));
//				checkToolBean.setActiveFlag_name(rs.getString("activeFlag_name"));
//				
//				checkToolBean.setCreateBy(rs.getString("createBy"));
//				checkToolBean.setCreateDate(rs.getDate("createDate"));
//				checkToolBean.setUpdateBy(rs.getString("updateBy"));
//				checkToolBean.setUpdateDate(rs.getDate("updateDate"));
//				
//				listcheckTool.add(checkToolBean);
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
//			
//			}
//
//		}

		return listcheckTool;
	}

	
	public Vector<CheckToolBean> getCheckToolAfter() {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		Vector<CheckToolBean> listcheckTool = new Vector<CheckToolBean>();
		
		String query = "select ct.*, md.value1, act.value1 as activeFlag_name " +
					"from tb_checkTool ct left join tbm_misc_data md on ct.timing = md.misc_code and md.misc_type = 'Timing' " +
					"left join tbm_misc_data act on ct.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
					"where 1=1 " +
					"and ct.activeFlag <> 2 " +
					"and ct.timing = 2 " +
					"order by ct.checkTool_ID";
				
		/*
		 * try { con = DBConnect.getConnection(); stmt = con.createStatement();
		 * 
		 * rs = stmt.executeQuery(query);
		 * 
		 * while (rs.next()) {
		 * 
		 * CheckToolBean checkToolBean = new CheckToolBean();
		 * 
		 * checkToolBean.setCheckTool_ID(rs.getString("checkTool_ID"));
		 * checkToolBean.setCheckTool_name(rs.getString("checkTool_name"));
		 * 
		 * checkToolBean.setTiming(rs.getInt("timing"));
		 * checkToolBean.setTiming_name(rs.getString("value1"));
		 * 
		 * checkToolBean.setActiveFlag(rs.getInt("activeFlag"));
		 * checkToolBean.setActiveFlag_name(rs.getString("activeFlag_name"));
		 * 
		 * checkToolBean.setCreateBy(rs.getString("createBy"));
		 * checkToolBean.setCreateDate(rs.getDate("createDate"));
		 * checkToolBean.setUpdateBy(rs.getString("updateBy"));
		 * checkToolBean.setUpdateDate(rs.getDate("updateDate"));
		 * 
		 * listcheckTool.add(checkToolBean); }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); } finally { try { if (stmt !=
		 * null) { stmt.close(); } if (con != null) { con.close(); } } catch (Exception
		 * e) {
		 * 
		 * }
		 * 
		 * }
		 */

		return listcheckTool;
	}

}
