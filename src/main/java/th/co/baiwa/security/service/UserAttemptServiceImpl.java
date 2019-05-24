package th.co.baiwa.security.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.co.baiwa.admin.dao.UserDao;
import th.co.baiwa.admin.entity.User;
import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.constant.CommonConstants.FLAG;
import th.co.baiwa.common.constant.ParameterConstants.PARAMETER_GROUP;
import th.co.baiwa.common.constant.ParameterConstants.SYSTEM_CONFIG;
import th.co.baiwa.preferences.entity.ParameterInfo;
import th.co.baiwa.security.dao.UserAttemptDao;
import th.co.baiwa.security.entity.UserAttempt;

@Service("userAttemptService")
public class UserAttemptServiceImpl implements UserAttemptService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserAttemptDao userAttemptDao;
	@Autowired
	private UserDao userDao;
	
	
	@Override
	@Transactional
	public void resetFailAttempt(String username) {
		logger.info("resetFailAttempt username=" + username);
		
		UserAttempt userAttempt = userAttemptDao.findByUsername(username);
		if (userAttempt == null) {
			userAttempt = new UserAttempt();
			userAttempt.setUsername(username);
			userAttempt.setAttempts(0);
			userAttempt.setLastModified(new Date());
			userAttemptDao.insert(userAttempt);
		} else {
			userAttempt.setAttempts(0);
			userAttempt.setLastModified(new Date());
			userAttemptDao.update(userAttempt);
		}
	}
	
	@Override
	public void updateFailAttempt(String username) {
		logger.info("updateFailAttempt username={}", username);
		
		UserAttempt userAttempt = userAttemptDao.findByUsername(username);
		if (userAttempt == null) {
			userAttempt = new UserAttempt();
			userAttempt.setUsername(username);
			userAttempt.setAttempts(1);
			userAttempt.setLastModified(new Date());
			userAttemptDao.insert(userAttempt);
		} else {
			userAttempt.setAttempts(userAttempt.getAttempts() + 1);
			userAttempt.setLastModified(new Date());
			userAttemptDao.update(userAttempt);
			
			/*ParameterInfo maxLoginAttempts = ApplicationCache.getParameterInfoByCode(PARAMETER_GROUP.SYSTEM_CONFIG, SYSTEM_CONFIG.LOGIN_ATTEMPTS);
			if (FLAG.Y_FLAG.equals(maxLoginAttempts.getValue1()) && userAttempt.getAttempts() + 1 >= Integer.parseInt(maxLoginAttempts.getValue2())) {
				// Locked User
				User user = userDao.findByUsername(username);
				user.setAccountNonLocked(FLAG.N_FLAG);
				userDao.update(user);
				
				// Throw Exception
				throw new LockedException("User Account is locked!");
			}*/
		}
	}
	
}
