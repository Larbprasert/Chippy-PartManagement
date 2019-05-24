package th.co.baiwa.preferences.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.preferences.entity.ParameterGroup;

@Repository("parameterGroupDao")
public class ParameterGroupDao extends AbstractCommonJdbcDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	public List<ParameterGroup> findAllForCache() {
		logger.info("findAllForCache");
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT param_group_id, param_group_code, param_group_desc ");
		sql.append(" FROM sys_parameter_group ");
		sql.append(" WHERE active_flg = 'Y' ");
		
		List<ParameterGroup> paramGroupList = (List<ParameterGroup>) executeQuery(sql.toString(),
			BeanPropertyRowMapper.newInstance(ParameterGroup.class)
		);
		
		return paramGroupList;
	}

	public Long countParameterGroup() {
//		return  super.count();
		return null;
	}

	public List<ParameterGroup> queryParameterGroup(Integer start, Integer length) {
//		Query query = getEntityManager().createQuery("from ParameterGroup");
//		query.setFirstResult(start);
//		query.setMaxResults(length);
//		return query.getResultList();
		return null;
	}

	public ParameterGroup getParamGroupById(ParameterGroup parameterGroup) {
//		return super.findOne(parameterGroup.getParamGroupId());
		return null;
	}

}
