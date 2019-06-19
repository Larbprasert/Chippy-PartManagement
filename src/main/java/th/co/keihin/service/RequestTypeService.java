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
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.RequestTypeBean;
import th.co.keihin.model.UserTypeBean;


@Repository("requestTypeService")
public class RequestTypeService{

	
@Autowired
private JdbcTemplate jdbcTemplate;
	

private RowMapper REQUESTTYPE_MAPPER = new RowMapper(){
	
	@Override
	public RequestTypeBean mapRow(ResultSet rs, int rowNum) throws SQLException {

		RequestTypeBean requestType = new RequestTypeBean();
		
		requestType.setRequestType_ID(rs.getString("requestType_ID"));
		requestType.setRequestType_name(rs.getString("requestType_name"));
		
		requestType.setActiveFlag(rs.getString("activeFlag"));
		requestType.setActiveFlag_name(rs.getString("activeFlag_name"));
		
		requestType.setCreateBy(rs.getString("createBy"));
		requestType.setCreateDate(rs.getDate("createDate"));
		requestType.setUpdateBy(rs.getString("updateBy"));
		requestType.setUpdateDate(rs.getDate("updateDate"));
		
		return requestType;
	}
};
	

	public RequestTypeBean getRequestTypeBeanByID(String requestType_ID) {
		// TODO Auto-generated method stub
		
		String query = "Select a.* ,act.value1 as activeFlag_name " +
				"From tb_requestType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"and a.requestType_ID='" + requestType_ID +"'"; 
		
		List<RequestTypeBean> list = jdbcTemplate.query(query,REQUESTTYPE_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new RequestTypeBean() ;
	}

	
	public DataTableAjax<RequestTypeBean> getAll() {
		// TODO Auto-generated method stub
		DataTableAjax<RequestTypeBean> listrequestType = new DataTableAjax<RequestTypeBean>();
		
		String query = "Select a.* ,act.value1 as activeFlag_name " +
				"From tb_requestType a " + 
				"left join tbm_misc_data act on a.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' " +
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.requestType_ID";
				
		List<RequestTypeBean> list = jdbcTemplate.query(query,REQUESTTYPE_MAPPER);
		
		int total = list!=null? list.size():0;
		listrequestType.setRecordsTotal(total);
		listrequestType.setRecordsFiltered(total);
		listrequestType.setData(list);
		
		return listrequestType;
	}

	
	public void saveOrUpdate(RequestTypeBean obj) {
		if(StringUtils.isNotEmpty(obj.getRequestType_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}

	
	public void save(RequestTypeBean requestType) {
		// TODO Auto-generated method stub
		
		try {

			String query = "INSERT INTO tb_requestType (requestType_ID,requestType_name,activeFlag,CreateDate,CreateBy) "+
							"VALUES (?,?,?,getdate(),? ) ";

			jdbcTemplate.update(query,
					new Object[] {  
							requestType.getRequestType_ID(),
							requestType.getRequestType_name(),
							requestType.getActiveFlag(),
							requestType.getCreateBy(),
							});
		} catch (Exception e) {
			e.printStackTrace();
		} 	
	}

	
	public void delete(RequestTypeBean requestType) {
		// TODO Auto-generated method stub
		try {

			String query = "update tb_requestType set activeFlag = 2, updateBy=?, updateDate=getdate() Where requestType_ID=?";
			
	    	int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							requestType.getUpdateBy(),							
							requestType.getRequestType_ID()
							});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void edit(RequestTypeBean requestType) {
		// TODO Auto-generated method stub
		
		try {

			
	    	String query = ("Update tb_requestType "+
					"Set requestType_name=?, "+
					"updateBy=?, updateDate=getdate() "+
					",activeFlag=? "+
					"where 1=1 "+
					"and requestType_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							requestType.getRequestType_name(),							
							requestType.getUpdateBy(),
							requestType.getActiveFlag(),
							requestType.getRequestType_ID()
							});
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<LovInfo> loadActiveRequestType() {
		List<LovInfo>  lovInfos= new ArrayList<LovInfo>();
			
		String query = "Select a.requestType_ID,a.requestType_name " +
				"From tb_requestType a " + 
				"where 1=1 and a.activeFlag <> 2 " +
				"order by a.requestType_ID";
				
		List<RequestTypeBean> requestTypelist = jdbcTemplate.query(query,BeanPropertyRowMapper.newInstance(RequestTypeBean.class));
		
		LovInfo lovInfo = new LovInfo();
		for (RequestTypeBean RequestType : requestTypelist) {
			lovInfo = new LovInfo();
			lovInfo.setCode(RequestType.getRequestType_ID());
			lovInfo.setDescTH(RequestType.getRequestType_name());
			lovInfo.setDescEN(RequestType.getRequestType_name());
			lovInfos.add(lovInfo);
		}
		return lovInfos;
	}
}
