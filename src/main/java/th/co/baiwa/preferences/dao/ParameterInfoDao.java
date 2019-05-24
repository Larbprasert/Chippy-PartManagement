package th.co.baiwa.preferences.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.preferences.entity.ParameterInfo;

@Repository("parameterInfoDao")
public class ParameterInfoDao extends AbstractCommonJdbcDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	public List<ParameterInfo> findByParamGroupId(Long paramGroupId) {
		logger.info("findByParamGroupId paramGroupId=" + paramGroupId);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT param_info_id, param_group_id, param_code, value_1, value_2, ");
		sql.append("        value_3, value_4, value_5, value_6, is_default, sorting_order ");
		sql.append(" FROM sys_parameter_info ");
		sql.append(" WHERE active_flg = 'Y' ");
		sql.append("   AND param_group_id = ? ");
		sql.append(" ORDER BY sorting_order ");
		
		List<ParameterInfo> paramInfoList = (List<ParameterInfo>) executeQuery(sql.toString(),
			new Object[] {
				paramGroupId
			},
			BeanPropertyRowMapper.newInstance(ParameterInfo.class)
		);
		
		return paramInfoList;
	}

	public Long countParameterInfo(String paramGroupId) {
//		Query query = getEntityManager().createQuery("select count(e) from ParameterInfo e where e.paramGroupId=:paramGroupId and e.isDeleted=:isDeleted");
//		query.setParameter("paramGroupId", Long.valueOf(paramGroupId));
//		query.setParameter("isDeleted", FLAG.N_FLAG);
//		return (Long) query.getSingleResult();
		return null;
	}

	public List<ParameterInfo> queryParameterInfo(Integer start, Integer length, String paramGroupId) {
//		Query query = getEntityManager().createQuery("from ParameterInfo e where e.paramGroupId=:paramGroupId and e.isDeleted=:isDeleted");
//		query.setParameter("paramGroupId", Long.valueOf(paramGroupId));
//		query.setParameter("isDeleted", FLAG.N_FLAG);
//		query.setFirstResult(start);
//		query.setMaxResults(length);
//		return query.getResultList();
		return null;
	}

	public void insert(ParameterInfo info) {
		//super.persist(info);
		
	}

	public void update(ParameterInfo info) {
		//super.merge(info);
		
	}

	public void remove(ParameterInfo info) {
		//super.delete(info.getParamInfoId());
		
	}
	
}
