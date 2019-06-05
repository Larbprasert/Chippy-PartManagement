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
import th.co.keihin.model.FactoryBean;
import th.co.keihin.model.LocationBean;

@Repository("locationService")
public class LocationService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper LOCATION_MAPPER = new RowMapper(){
		
		@Override
		public LocationBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			LocationBean location = new LocationBean();
			FactoryBean factory = new FactoryBean();
			
			
			location.setLocation_ID(rs.getString("location_ID"));
			location.setLocation_name(rs.getString("location_name"));
			
			location.setActiveFlag(rs.getInt("activeFlag"));
			location.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			location.setCreateBy(rs.getString("createBy"));
			location.setCreateDate(rs.getDate("createDate"));
			location.setUpdateBy(rs.getString("updateBy"));
			location.setUpdateDate(rs.getDate("updateDate"));
			
//			location.setFactory_ID(rs.getString("factory_ID"));
//			location.setFactory_name(rs.getString("factory_name"));
//			
			factory.setFactory_ID(rs.getString("factory_ID"));
			factory.setFactory_name(rs.getString("factory_name"));
			
			location.setFactory(factory);
			
			return location;
		}
	};

	
	public LocationBean getLocationBeanByID(String location_ID) {
		// TODO Auto-generated method stub

		
		String query = "Select a.*, b.factory_name, act.value1 as activeFlag_name "+
				"From tb_location a left join tb_factory b on a.Factory_ID = b.Factory_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.location_ID='" + location_ID +"'"; 
		List<LocationBean> list = jdbcTemplate.query(query,LOCATION_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new LocationBean();
	}

	
	public DataTableAjax<LocationBean> getAll() {
		// TODO Auto-generated method stub
		
		DataTableAjax<LocationBean> listlocation = new DataTableAjax<LocationBean>();
		
		String query = "Select a.*, b.factory_name, act.value1 as activeFlag_name "+
				"From tb_location a left join tb_factory b on a.Factory_ID = b.Factory_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.location_ID";
		
		List<LocationBean> list = jdbcTemplate.query(query,LOCATION_MAPPER);
		
		int total = list!=null? list.size():0;
		listlocation.setRecordsTotal(total);
		listlocation.setRecordsFiltered(total);
		listlocation.setData(list);
		
		return listlocation;
	}

	public void saveOrUpdate(LocationBean obj) {
		if(StringUtils.isNotEmpty(obj.getLocation_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	
	public void save(LocationBean location) {
		// TODO Auto-generated method stub
			
			
		try {

			String query = 
					"INSERT INTO tb_location (location_ID,location_name,activeFlag,CreateDate,CreateBy,Factory_ID) "+
							"VALUES (?,?,?,getdate(),?,? ) ";
			jdbcTemplate.update(query,
					new Object[] {  
							location.getLocation_ID(),
							location.getLocation_name(),
							location.getActiveFlag(),
							location.getCreateBy(),
							location.getFactory().getFactory_ID(),
//							location.getFactory_ID(),
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(LocationBean location) {
		// TODO Auto-generated method stub
		
		try {

		String query = "update tb_location set activeFlag = 2, updateBy=?, updateDate=getdate() Where location_ID=?";
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							location.getUpdateBy(),							
							location.getLocation_ID()
							});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(LocationBean location) {
		// TODO Auto-generated method stub
		
		try {
						
	    	String query = ("Update tb_location "+
					"Set location_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=?, Factory_ID=? "+
					"where 1=1 "+
					"and location_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					location.getLocation_name(),							
	    					location.getUpdateBy(),
	    					location.getActiveFlag(),
	    					
	    					location.getFactory().getFactory_ID(),
//	    					location.getFactory_ID(),
	    					
	    					location.getLocation_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}


	public List<LovInfo> loadActiveLocation() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
			
		String query = "Select a.location_ID, a.location_name "+
				"From tb_location a " + 
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.location_ID";
				
		List<LocationBean> locationlist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(LocationBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (LocationBean locationBean : locationlist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(locationBean.getLocation_ID());
			lovInfo.setDescTH(locationBean.getLocation_name());
			lovInfo.setDescEN(locationBean.getLocation_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
	
}
