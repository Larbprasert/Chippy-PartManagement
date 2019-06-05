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
import th.co.keihin.model.MakerBean;
import th.co.keihin.model.MoldTypeBean;

@Repository("moldTypeService")
public class MoldTypeService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper MOLDTYPE_MAPPER = new RowMapper(){
		
		@Override
		public MoldTypeBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			MoldTypeBean moldtype = new MoldTypeBean();
			
			moldtype.setMoldType_ID(rs.getString("MoldType_ID"));
			moldtype.setMoldType_name(rs.getString("MoldType_name"));
			
			moldtype.setActiveFlag(rs.getInt("activeFlag"));
			moldtype.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			moldtype.setCreateBy(rs.getString("createBy"));
			moldtype.setCreateDate(rs.getDate("createDate"));
			moldtype.setUpdateBy(rs.getString("updateBy"));
			moldtype.setUpdateDate(rs.getDate("updateDate"));
			
			return moldtype;
		}
	};

	
	public MoldTypeBean getMoldTypeBeanByID(String MoldType_ID) {
		// TODO Auto-generated method stub
		
		String query = "Select a.*, act.value1 as activeFlag_name " +
				"From tb_moldType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.MoldType_ID='" + MoldType_ID +"'"; 
		
		List<MoldTypeBean> list = jdbcTemplate.query(query,MOLDTYPE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new MoldTypeBean();
		
		
	}

	
	public DataTableAjax<MoldTypeBean> getAll() {
		// TODO Auto-generated method stub
		
		DataTableAjax<MoldTypeBean> listMoldType = new DataTableAjax<MoldTypeBean>();
		
		String query = "Select a.*, act.value1 as activeFlag_name " +
				"From tb_moldType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.moldType_ID";
				
		List<MoldTypeBean> list = jdbcTemplate.query(query,MOLDTYPE_MAPPER);
		
		int total = list!=null? list.size():0;
		listMoldType.setRecordsTotal(total);
		listMoldType.setRecordsFiltered(total);
		listMoldType.setData(list);
		
		return listMoldType;
	}
	
	public void saveOrUpdate(MoldTypeBean obj) {
		if(StringUtils.isNotEmpty(obj.getMoldType_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}
	
	public void save(MoldTypeBean moldType) {
		// TODO Auto-generated method stub
		try {
			String query = "INSERT INTO tb_moldType (MoldType_ID,MoldType_name,activeFlag,CreateDate,CreateBy) " + 
					"VALUES (?,?,?,getdate(),? ) ";
			jdbcTemplate.update(query,
			new Object[] {  
					moldType.getMoldType_ID(),
					moldType.getMoldType_name(),
					moldType.getActiveFlag(),
					moldType.getCreateBy(),
					});
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(MoldTypeBean moldType) {
		// TODO Auto-generated method stub
		
		try {
			
			String query = "update tb_moldType set activeFlag = 2, updateBy=?, updateDate=getdate() Where MoldType_ID=?";
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							moldType.getUpdateBy(),							
							moldType.getMoldType_ID()
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(MoldTypeBean moldType) {
		// TODO Auto-generated method stub
		
		try {			
	    	String query = ("Update tb_moldType "+
					"Set MoldType_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and MoldType_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					moldType.getMoldType_name(),							
	    					moldType.getUpdateBy(),
	    					moldType.getActiveFlag(),
	    					moldType.getMoldType_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public List<LovInfo> loadActiveMoldType() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
			
		String query = "Select a.moldType_ID, a.moldType_name "+
				"From tb_MoldType a " + 
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.moldType_ID";
				
		List<MoldTypeBean> moldTypelist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(MoldTypeBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (MoldTypeBean moldType : moldTypelist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(moldType.getMoldType_ID());
			lovInfo.setDescTH(moldType.getMoldType_name());
			lovInfo.setDescEN(moldType.getMoldType_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
}
