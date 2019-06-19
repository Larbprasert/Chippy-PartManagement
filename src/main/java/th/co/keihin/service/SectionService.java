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
import th.co.keihin.model.DepartmentBean;
import th.co.keihin.model.SectionBean;

@Repository("sectionService")
public class SectionService {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper SECTION_MAPPER = new RowMapper(){
		
		@Override
		public SectionBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			SectionBean section = new SectionBean();
			DepartmentBean department = new DepartmentBean();
			
			
			section.setSection_ID(rs.getString("section_ID"));
			section.setSection_name(rs.getString("section_name"));
			
			section.setActiveFlag(rs.getString("activeFlag"));
			section.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			section.setCreateBy(rs.getString("createBy"));
			section.setCreateDate(rs.getDate("createDate"));
			section.setUpdateBy(rs.getString("updateBy"));
			section.setUpdateDate(rs.getDate("updateDate"));
			
//			section.setDept_ID(rs.getString("dept_ID"));
//			section.setDept_name(rs.getString("dept_name"));
			
			department.setDept_ID(rs.getString("dept_ID"));
			department.setDept_name(rs.getString("dept_name"));
			
			section.setDepartment(department);
			
			return section;
		}
	};
	
	public SectionBean getSectionBeanByID(String section_ID) {
		// TODO Auto-generated method stub
			
		String query = "Select a.*, b.dept_name,act.value1 as activeFlag_name "+
				"From tb_section a left join tb_department b on a.dept_ID = b.dept_ID " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.section_ID='" + section_ID +"'"; 
		List<SectionBean> list = jdbcTemplate.query(query,SECTION_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new SectionBean();
	}

	
	public DataTableAjax<SectionBean> getAll() {
		// TODO Auto-generated method stub
		
		DataTableAjax<SectionBean> listsection = new DataTableAjax<SectionBean>();
		
		String query = "Select a.*, b.dept_name,act.value1 as activeFlag_name "+
				"From tb_section a left join tb_department b on a.dept_ID = b.dept_ID " +
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.section_ID";
		
		List<SectionBean> list = jdbcTemplate.query(query,SECTION_MAPPER);
		
		int total = list!=null? list.size():0;
		
		listsection.setRecordsTotal(total);
		listsection.setRecordsFiltered(total);
		listsection.setData(list);
		
		return listsection;
	}

	
	public void saveOrUpdate(SectionBean obj) {
		if(StringUtils.isNotEmpty(obj.getSection_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}

	
	public void save(SectionBean section) {
		// TODO Auto-generated method stub
		
		try {

		
			String query = 
					"INSERT INTO tb_section (section_ID,section_name,activeFlag,CreateDate,CreateBy,dept_ID) "+
							"VALUES (?,?,?,getdate(),?,? ) ";
			jdbcTemplate.update(query,
					new Object[] {  
							section.getSection_ID(),
							section.getSection_name(),
							section.getActiveFlag(),
							section.getCreateBy(),
							section.getDepartment().getDept_ID(),
							});
					
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void delete(SectionBean section) {
		// TODO Auto-generated method stub
		try {

			String query = ("update tb_section set activeFlag = 2, updateBy=?, updateDate=getdate() Where section_ID=?");
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							section.getUpdateBy(),							
							section.getSection_ID()
							});
		
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(SectionBean section) {
		// TODO Auto-generated method stub
		try {

			
	    	String query = ("Update tb_section "+
					"Set section_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=?, dept_ID=? "+
					"where 1=1 "+
					"and section_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					section.getSection_name(),							
	    					section.getUpdateBy(),
	    					section.getActiveFlag(),
	    					section.getDepartment().getDept_ID(),
	    					section.getSection_ID()
	    					});
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public List<LovInfo> loadActiveSection() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
		
		String query = "Select a.section_ID, a.section_name " +
				"From tb_section a " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.section_ID";
				
		List<SectionBean> sectionList = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(SectionBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (SectionBean section : sectionList) {
			lovInfo = new LovInfo();
			lovInfo.setCode(section.getSection_ID());
			lovInfo.setDescTH(section.getSection_name());
			lovInfo.setDescEN(section.getSection_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
}
