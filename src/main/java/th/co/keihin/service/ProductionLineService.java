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
import th.co.keihin.model.ProductionLineBean;

@Repository("productionLineService")
public class ProductionLineService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper PRODUCTIONLINE_MAPPER = new RowMapper(){
		
		@Override
		public ProductionLineBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			ProductionLineBean productionLine = new ProductionLineBean();
			FactoryBean factory = new FactoryBean();
			
			
			productionLine.setProductionLine_ID(rs.getString("productionLine_ID"));
			productionLine.setProductionLine_name(rs.getString("productionLine_name"));
			
			productionLine.setActiveFlag(rs.getInt("activeFlag"));
			productionLine.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			productionLine.setCreateBy(rs.getString("createBy"));
			productionLine.setCreateDate(rs.getDate("createDate"));
			productionLine.setUpdateBy(rs.getString("updateBy"));
			productionLine.setUpdateDate(rs.getDate("updateDate"));

			factory.setFactory_ID(rs.getString("factory_ID"));
			factory.setFactory_name(rs.getString("factory_name"));
			
			productionLine.setFactory(factory);
			
			return productionLine;
		}
	};
	
	
	public ProductionLineBean getProductionLineBeanByID(String productionLine_ID) {
		// TODO Auto-generated method stub
				
		String query = "Select a.*, b.Factory_name,act.value1 as activeFlag_name "+
				"From tb_productionLine a left join tb_factory b on a.Factory_ID = b.Factory_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.productionLine_ID='" + productionLine_ID +"'"; 
		List<ProductionLineBean> list = jdbcTemplate.query(query,PRODUCTIONLINE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new ProductionLineBean();
	}

	
	public DataTableAjax<ProductionLineBean> getAll() {
		// TODO Auto-generated method stub
		DataTableAjax<ProductionLineBean> listProductionLine = new DataTableAjax<ProductionLineBean>();
			
		String query = "Select a.*, b.Factory_name,act.value1 as activeFlag_name "+
				"From tb_productionLine a left join tb_factory b on a.Factory_ID = b.Factory_ID " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 order by a.productionLine_ID";
		
		List<ProductionLineBean> list = jdbcTemplate.query(query,PRODUCTIONLINE_MAPPER);
		
		int total = list!=null? list.size():0;
		listProductionLine.setRecordsTotal(total);
		listProductionLine.setRecordsFiltered(total);
		listProductionLine.setData(list);
		
		return listProductionLine;
	}

	
	public void saveOrUpdate(ProductionLineBean obj) {
		if(StringUtils.isNotEmpty(obj.getProductionLine_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	

	
	public void save(ProductionLineBean productionLine) {
		// TODO Auto-generated method stub
		
		System.out.println("createBy : " + productionLine.getCreateBy() + " || productionLine_name: " + productionLine.getProductionLine_name() + 
				" || productionLine_ID: " + productionLine.getProductionLine_ID() + " || activeFlag: " + productionLine.getActiveFlag());
		
		try {
			String query = "INSERT INTO tb_productionLine (productionLine_ID,productionLine_name,activeFlag,CreateDate,CreateBy,Factory_ID) "+
							"VALUES (?,?,?,getdate(),?,? ) ";
			jdbcTemplate.update(query,
					new Object[] {  
							productionLine.getProductionLine_ID(),
							productionLine.getProductionLine_name(),
							productionLine.getActiveFlag(),
							productionLine.getCreateBy(),
							productionLine.getFactory().getFactory_ID(),
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(ProductionLineBean productionLine) {
		// TODO Auto-generated method stub
		System.out.println(" Delete ==> productionLine_ID: " + productionLine.getProductionLine_ID());
		
		try {

			String query = "update tb_productionLine set activeFlag = 2, updateBy=?, updateDate=getdate() Where productionLine_ID=?";
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							productionLine.getUpdateBy(),							
							productionLine.getProductionLine_ID()
							});	

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(ProductionLineBean productionLine) {
		// TODO Auto-generated method stub
		System.out.println(" Edit ==> productionLine_ID: " + productionLine.getProductionLine_ID());
		
		try {
			
	    	String query = ("Update tb_productionLine "+
					"Set productionLine_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=?, Factory_ID=? "+
					"where 1=1 "+
					"and productionLine_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					productionLine.getProductionLine_name(),							
	    					productionLine.getUpdateBy(),
	    					productionLine.getActiveFlag(),
	    					
	    					productionLine.getFactory().getFactory_ID(),
	    					
	    					productionLine.getProductionLine_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public List<LovInfo> loadActiveProductionLine() {
		 List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
		
		String query = "Select a.productionLine_ID, a.productionLine_name"+
		"From tb_productionLine a " +
		"where 1=1 and a.activeFlag <> 2 order by a.productionLine_ID";
				
		List<ProductionLineBean> productionLineList = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(ProductionLineBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (ProductionLineBean ProductionLineBean : productionLineList) {
			lovInfo = new LovInfo();
			lovInfo.setCode(ProductionLineBean.getProductionLine_ID());
			lovInfo.setDescTH(ProductionLineBean.getProductionLine_name());
			lovInfo.setDescEN(ProductionLineBean.getProductionLine_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
}
