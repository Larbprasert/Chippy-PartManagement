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

@Repository("factoryService")
public class FactoryService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper FACTORY_MAPPER = new RowMapper(){
		
		@Override
		public FactoryBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			FactoryBean factory = new FactoryBean();
			
			factory.setFactory_ID(rs.getString("factory_ID"));
			factory.setFactory_name(rs.getString("factory_name"));
			
			factory.setActiveFlag(rs.getInt("activeFlag"));
			factory.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			factory.setCreateBy(rs.getString("createBy"));
			factory.setCreateDate(rs.getDate("createDate"));
			factory.setUpdateBy(rs.getString("updateBy"));
			factory.setUpdateDate(rs.getDate("updateDate"));
			
			return factory;
		}
	};
	
	
	public FactoryBean getFactoryBeanByID(String factory_ID) {
		// TODO Auto-generated method stub
			
			String query = "Select fac.*, act.value1 as activeFlag_name "+
			"from tb_factory fac " +
			"left join tbm_misc_data act on fac.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
			"where 1=1 and fac.activeFlag <> 2 " +
			"and fac.factory_ID='" + factory_ID +"'";

			List<FactoryBean> list = jdbcTemplate.query(query,FACTORY_MAPPER);
			 
		    return  list!=null&& list.size()>0? list.get(0) : new FactoryBean();

	}

	
	public DataTableAjax<FactoryBean> getAll() {
		// TODO Auto-generated method stub

		DataTableAjax<FactoryBean> listFactory = new DataTableAjax<FactoryBean>();

		String query = "Select fac.*, act.value1 as activeFlag_name "+
				"from tb_factory fac " +
				"left join tbm_misc_data act on fac.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and fac.activeFlag <> 2 " +
				"order by fac.factory_ID";
				
		List<FactoryBean> list = jdbcTemplate.query(query,FACTORY_MAPPER);
		
		int total = list!=null? list.size():0;
		listFactory.setRecordsTotal(total);
		listFactory.setRecordsFiltered(total);
		listFactory.setData(list);
		
		return listFactory;
	}

	
	public void saveOrUpdate(FactoryBean obj) {
		if(StringUtils.isNotEmpty(obj.getFactory_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}	
	
	
	public void save(FactoryBean factory) {
		// TODO Auto-generated method stub

		try {
			
			String query = "INSERT INTO tb_factory (factory_ID,factory_name,activeFlag,CreateDate,CreateBy) " +
					"VALUES (?,?,?,getdate(),? ) ";
			jdbcTemplate.update(query,
			new Object[] {  
					factory.getFactory_ID(),
					factory.getFactory_name(),
					factory.getActiveFlag(),
					factory.getCreateBy(),
					});
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(FactoryBean factory) {
		// TODO Auto-generated method stub
		
		try {

			
			String query = "update tb_factory set activeFlag = 2, updateBy=?, updateDate=getdate() Where factory_ID=?";
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							factory.getUpdateBy(),							
							factory.getFactory_ID()
							});


		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(FactoryBean factory) {
		// TODO Auto-generated method stub
		
		try {
					
	    	String query = ("Update tb_factory "+
					"Set factory_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and factory_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					factory.getFactory_name(),							
	    					factory.getUpdateBy(),
	    					factory.getActiveFlag(),
	    					factory.getFactory_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public List<LovInfo> loadActiveFactory() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
		String query = "Select fac.factory_ID ," + 
				"fac.factory_Name factory_name "+
				"from tb_factory fac " +
				"where 1=1 and fac.activeFlag <> 2 " +
				"order by fac.factory_ID";
				
		List<FactoryBean> faclist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(FactoryBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (FactoryBean factoryBean : faclist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(factoryBean.getFactory_ID());
			lovInfo.setDescTH(factoryBean.getFactory_name());
			lovInfo.setDescEN(factoryBean.getFactory_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}

}
