package th.co.baiwa.preferences.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.preferences.entity.Message;

@Repository("messageDao")
public class MessageDao extends AbstractCommonJdbcDao {

	public Long countgetMessageAll() {
		//return this.count();
		return null;
	}

	public List<Message> getMessageAll(Integer start, Integer length) {
//		Query query = getEntityManager().createQuery("from Message e WHERE e.isDeleted=:isDeleted");
//		query.setParameter("isDeleted", FLAG.N_FLAG);
//		query.setFirstResult(start);
//		query.setMaxResults(length);
//		return query.getResultList();
		return null;
	}

	public List<Message> getAllForCache() {
		String sql = "SELECT * FROM `sys_message` ";
		return executeQuery(sql, new RowMapper<Message>(){

			@Override
			public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
				Message m = new Message();				
				m.setMessageCode( rs.getString("message_code"));
				m.setMessageTh(rs.getString("message_th"));
				m.setMessageEn( rs.getString("message_en"));
				return m;
			}
			
		});
	}
	

}
