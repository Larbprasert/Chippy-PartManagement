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
import th.co.keihin.model.MakerBean;


@Repository("makerService")
public class MakerService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper MAKER_MAPPER = new RowMapper(){
		
		@Override
		public MakerBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			MakerBean maker = new MakerBean();
			
			maker.setMaker_ID(rs.getString("maker_ID"));
			maker.setMaker_name(rs.getString("maker_name"));
			maker.setMaker_tel(rs.getString("maker_tel"));
			maker.setMaker_contactName(rs.getString("maker_contactName"));
			maker.setMaker_contactLastName(rs.getString("maker_contactLastName"));
			maker.setMaker_address1(rs.getString("maker_address1"));
			
			maker.setMaker_province(rs.getString("maker_province"));
			maker.setProvince_name_tha(rs.getString("province_name_tha"));
			
			maker.setMaker_email(rs.getString("maker_email"));
			
			maker.setActiveFlag(rs.getInt("activeFlag"));
			maker.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			maker.setCreateBy(rs.getString("createBy"));
			maker.setCreateDate(rs.getDate("createDate"));
			maker.setUpdateBy(rs.getString("updateBy"));
			maker.setUpdateDate(rs.getDate("updateDate"));
			
			return maker;
		}
	};
	
	public MakerBean getMakerBeanByID(String maker_ID) {
		// TODO Auto-generated method stub
		
		
		String query = "Select a.*,b.province_name_tha , act.value1 as activeFlag_name " +
				"From tb_maker a " + 
				"left join tbm_province b on a.maker_province = b.province_code COLLATE SQL_Latin1_General_CP1_CI_AS " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.maker_ID='" + maker_ID +"'"; 
		List<MakerBean> list = jdbcTemplate.query(query,MAKER_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new MakerBean();
	}

	
	public DataTableAjax<MakerBean> getAll() {
		// TODO Auto-generated method stub
		DataTableAjax<MakerBean> listMaker = new DataTableAjax<MakerBean>();
		
		String query = "Select a.*,b.province_name_tha , act.value1 as activeFlag_name " +
				"From tb_maker a " + 
				"left join tbm_province b on a.maker_province = b.province_code COLLATE SQL_Latin1_General_CP1_CI_AS " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.maker_ID";
				
		List<MakerBean> list = jdbcTemplate.query(query,MAKER_MAPPER);
		
		int total = list!=null? list.size():0;
		listMaker.setRecordsTotal(total);
		listMaker.setRecordsFiltered(total);
		listMaker.setData(list);
		
		return listMaker;
	}

	public void saveOrUpdate(MakerBean obj) {
		if(StringUtils.isNotEmpty(obj.getMaker_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
		
	public void save(MakerBean maker) {
		// TODO Auto-generated method stub
		
		System.out.println("############################### Save");
		System.out.println("createBy : " + maker.getUpdateBy() + 
				" || maker_ID: " + maker.getMaker_ID() + 
				" || maker_name: " + maker.getMaker_name() +				
				" || maker_contactName: " + maker.getMaker_contactName() + 
				" || maker_contactLastName: " + maker.getMaker_contactLastName() +
				" || maker_tel: " + maker.getMaker_tel() +
				" || maker_address1: " + maker.getMaker_address1() + 
				" || maker_province: " + maker.getMaker_province() +
				" || maker_email: " + maker.getMaker_email() +
				" || activeFlag: " + maker.getActiveFlag());	
		
		try {

			String query =	"INSERT INTO tb_maker (maker_ID,maker_name,maker_tel"
					+ ",maker_contactName,maker_contactLastName,maker_address1,maker_province,maker_email"
					+ ",activeFlag,CreateDate,CreateBy) "+
							"VALUES (?,?,?,?,?,?,?,?,?,getdate(),? ) ";
			jdbcTemplate.update(query,
					new Object[] {  
							maker.getMaker_ID(),
							maker.getMaker_name(),
							maker.getMaker_tel(),
							maker.getMaker_contactName(),
							maker.getMaker_contactLastName(),
							maker.getMaker_address1(),
							maker.getMaker_province(),
							maker.getMaker_email(),
							maker.getActiveFlag(),
							maker.getCreateBy(),
							});
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 			
	}
		
	public void delete(MakerBean maker) {
		// TODO Auto-generated method stub
		try {

			String query = "update tb_maker set activeFlag = 2, updateBy=?, updateDate=getdate() Where maker_ID=?";
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							maker.getUpdateBy(),							
							maker.getMaker_ID()
							});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(MakerBean maker) {
		// TODO Auto-generated method stub
				
		try {

			String query = ("Update tb_maker "+
					"Set maker_name=?, "+
					"maker_tel=?, "+
					"maker_contactName=?, "+
					"maker_contactLastName=?, "+
					"maker_address1=?, "+
					"maker_province=?, "+
					"maker_email=?, "+
					"activeFlag=?, "+
					"updateBy=?, "+
					"updateDate=getdate() "+
					"where 1=1 "+
					"and maker_ID=? ");
	    	
			int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					maker.getMaker_name(),
	    					maker.getMaker_tel(),
	    					maker.getMaker_contactName(),
	    					maker.getMaker_contactLastName(),
	    					maker.getMaker_address1(),
	    					maker.getMaker_province(),
	    					maker.getMaker_email(),
	    					maker.getActiveFlag(),
	    					maker.getUpdateBy(),
	    					maker.getMaker_ID()
	    					});
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
}
