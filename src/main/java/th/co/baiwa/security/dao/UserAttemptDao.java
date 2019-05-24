package th.co.baiwa.security.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.security.entity.UserAttempt;

@Repository("userAttemptDao")
public class UserAttemptDao extends AbstractUserAttemptDao {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public UserAttempt findByUsername(String username) {
		logger.info("findByUsername username={}", username);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ");
		sql.append("   user_attempt_id, username, attempts, last_modified ");
		sql.append(" FROM adm_user_attempt ");
		sql.append(" WHERE username = ? ");
		
		UserAttempt userAttempt = executeQueryForObject(sql.toString(),
			new Object[] {
				username
			},
			BeanPropertyRowMapper.newInstance(UserAttempt.class)
		);
		
		return userAttempt;
	}
	
}
