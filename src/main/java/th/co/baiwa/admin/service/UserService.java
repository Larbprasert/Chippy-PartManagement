package th.co.baiwa.admin.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import th.co.baiwa.admin.dao.UserDao;
import th.co.baiwa.admin.dao.UserProfileDao;
import th.co.baiwa.admin.dao.UserRoleDao;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.common.bean.DataTableAjax;

import th.co.keihin.service.FactoryService;
import th.co.keihin.service.SectionService;

@Service("userService")
public class UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserProfileDao userProfileDao;
	@Autowired
	private UserRoleDao userRoleDao;
	
	@Autowired
	private FactoryService factoryService;
	
	@Autowired
	private SectionService sectionService;
	

	public DataTableAjax<UserProfile> queryUserList(UserProfile user) {
		return userDao.queryUserList(user);
	}
	
	public List<UserProfile> queryUserAll() {
		return userDao.queryUserAll();
	}

	public void updateUserTheme(Long userId, String theme) {
		userDao.updateUserTheme(userId, theme);
	}
	
	public boolean checkExist(String val) {
		return userDao.checkExist(val);
	}
	
	public UserProfile getById(String id) {
		return userDao.getById(id);
	}

	public void saveOrUpdate(UserProfile userProfile) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		if(StringUtils.isNoneEmpty(userProfile.getUserId())){
			userDao.update(userProfile);
			
			userProfileDao.update(userProfile);
			
			userRoleDao.update(userProfile);
			
			if(StringUtils.isNoneEmpty(userProfile.getPassword())){
				String hashedPassword = encoder.encode(userProfile.getPassword());
				userProfile.setPassword(hashedPassword);
				userDao.updatePassword(userProfile);
			}
			
		}else{
			userProfile.setPassword(encoder.encode(userProfile.getPassword()));
			userProfile.setUserId(userDao.insert(userProfile)+"");
			userProfileDao.insert(userProfile);
			userRoleDao.insert(userProfile);
		}
	}
}
