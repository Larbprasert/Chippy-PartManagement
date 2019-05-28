package th.co.baiwa.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import th.co.baiwa.admin.dao.RoleDao;
import th.co.baiwa.admin.entity.Role;
import th.co.baiwa.admin.entity.UserProfile;
import th.co.baiwa.admin.service.UserService;
import th.co.baiwa.preferences.dao.LovDao;
import th.co.baiwa.preferences.dao.MessageDao;
import th.co.baiwa.preferences.dao.ParameterGroupDao;
import th.co.baiwa.preferences.dao.ParameterInfoDao;
import th.co.baiwa.preferences.entity.LovInfo;
import th.co.baiwa.preferences.entity.Message;
import th.co.baiwa.preferences.entity.ParameterGroup;
import th.co.baiwa.preferences.entity.ParameterInfo;
import th.co.tpcc.dao.OwnerDao;
import th.co.tpcc.model.Owner;
import th.co.tpcc.model.SysParam;

public class ApplicationCache {
	
	static {
		Locale.setDefault(Locale.US);
	}
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ParameterGroupDao parameterGroupDao;
	@Autowired
	private ParameterInfoDao parameterInfoDao;
	@Autowired
	private MessageDao messageDao;
//	@Autowired
//	private SheDeptDao sheDeptDao;
//	@Autowired
//	private InvDeptDao invDeptDao;
//	@Autowired
//	private InvAssetDao invAssetDao;
	@Autowired
	private OwnerDao ownerDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private LovDao lovDao;
	@Autowired
	private UserService userService;
	
//	private static final ConcurrentHashMap<String, ParameterGroupWrapper> PARAMETER_GROUP_MAP = new ConcurrentHashMap<String, ParameterGroupWrapper>();
//	private static final ConcurrentHashMap<Long, ParameterInfo> PARAMETER_INFO_MAP = new ConcurrentHashMap<Long, ParameterInfo>();
	private static final ConcurrentHashMap<String, Message> MESSAGE_MAP = new ConcurrentHashMap<String, Message>();
//	private static final ConcurrentHashMap<String, Object> COMMON_CACHE = new ConcurrentHashMap<String, Object>();
	private static final ConcurrentHashMap<String, List<LovInfo>> LOV_MAP = new ConcurrentHashMap<String, List<LovInfo>>();
	private static final ConcurrentHashMap<String, List<SysParam>> PARAMETER_MAP = new ConcurrentHashMap<String, List<SysParam>>();
	private static List<LovInfo> LOV_ASSET = new ArrayList<LovInfo>();
	private static List<LovInfo> LOV_OWNER = new ArrayList<LovInfo>();
	private static List<LovInfo> LOV_ROLE = new ArrayList<LovInfo>();
	private static List<LovInfo> LOV_SYS_USERS = new ArrayList<LovInfo>();


	
	/********************* Method for Get Cache - Start *********************/
	
	/** Parameter Group & Parameter Info */
//	public static ParameterGroup getParameterGroupByCode(String groupCode) {
//		ParameterGroup result = PARAMETER_GROUP_MAP.get(groupCode).getParameterGroup();
//		return result;
//	}
//	
//	public static ParameterInfo getParameterInfoById(Long parameterInfoId) {
//		return PARAMETER_INFO_MAP.get(parameterInfoId);
//	}
	
//	public static ParameterInfo getParameterInfoByCode(String groupCode, String infoCode) {
//		return PARAMETER_GROUP_MAP.get(groupCode).getParameterInfoCodeMap().get(infoCode);
//	}
	
	static final class ParameterGroupWrapper {
		private ParameterGroup parameterGroup;
		private Map<String, ParameterInfo> parameterInfoCodeMap = new HashMap<String, ParameterInfo>();
		
		public ParameterGroupWrapper(ParameterGroup paramGroup, List<ParameterInfo> paramInfoList) {
			this.parameterGroup = paramGroup;
			for (ParameterInfo paramInfo : paramInfoList) {
				parameterInfoCodeMap.put(paramInfo.getParamCode(), paramInfo);
			}
		}
		
		public ParameterGroup getParameterGroup() {
			return parameterGroup;
		}
		
		public void setParameterGroup(ParameterGroup parameterGroup) {
			this.parameterGroup = parameterGroup;
		}
		
		public Map<String, ParameterInfo> getParameterInfoCodeMap() {
			return parameterInfoCodeMap;
		}
		
		public void setParameterInfoCodeMap(Map<String, ParameterInfo> parameterInfoCodeMap) {
			this.parameterInfoCodeMap = parameterInfoCodeMap;
		}
	}
	
	/** Message Response */
	public static String getMessage(String messageCode) {
		Message message = MESSAGE_MAP.get(messageCode);
		return message != null ? message.getMessageTh() : null;
	}
	public static Map<String,String> getAllMessageEN() {
		 Map<String,String> map = new HashMap<>();
		 for(Message m : MESSAGE_MAP.values()){
			 map.put(m.getMessageCode(), m.getMessageEn());
		 }
		 return map;
	}
	
	/** Common Cache */
//	public static Object getCommonCache(String cacheName) {
//		return COMMON_CACHE.get(cacheName);
//	}
	
	/********************* Method for Get Cache - End *********************/
	
	
	/** Reload */
	public synchronized void reloadCache() {
		logger.info("ApplicationCache Reloading...");
		
		loadParameterGroup();
//		
//		loadMessageResponse();
		
//		loadCommonCache();
		
		loadLOV();
//		buildDepartmentLov();
//		buildAssetLov();
		buildOwnerLov();
		buildRoleLov();
		buildUserLov();
		
		logger.info("ApplicationCache Reloaded");
	}
	
	private void loadParameterGroup() {
		logger.info("load Paramter Info loading...");
		PARAMETER_MAP.clear();
		List<SysParam> l = lovDao.loadAllParameter();
		
		for (SysParam info : l) {
			if(!PARAMETER_MAP.containsKey(info.getParamType())){
				ArrayList<SysParam> infoList = new ArrayList<SysParam>();
				infoList.add(info);
				PARAMETER_MAP.put(info.getParamType(), infoList);
			}else{
				PARAMETER_MAP.get(info.getParamType()).add(info);
			}
		}
		logger.info("load PARAMETER MAP  ... [" + PARAMETER_MAP.size() + "]");
	}
	
	
	public static List<SysParam> getParamGroupType(String type) {
		return PARAMETER_MAP.get(type);
	}
	
	public static SysParam getParamGroupValue(String type, String code) {
		List<SysParam> list = getParamGroupType(type);
		SysParam param = new SysParam();
		for (SysParam p : list) {
			if(code!=null && code.equals(p.getParamCode())){
				return p;
			}
		}
		return param;
	}

	public static String getParamGroupTypeToJSON(String type) {
		List<SysParam> list = getParamGroupType(type);
		return new Gson().toJson(list) ;
	}
	
	/*private void loadMessageResponse() {
		logger.info("load Message loading...");
		List<Message> group = messageDao.getAllForCache();
			MESSAGE_MAP.clear();
			for (Message info : group) {
				MESSAGE_MAP.put(info.getMessageCode(), info);
			}
		logger.info("load Message loaded [" + MESSAGE_MAP.size() + "]");
	}
	
	private void loadCommonCache() {
		logger.info("load CommonCache loading...");
		
		COMMON_CACHE.clear();
//		COMMON_CACHE.put(COMMON_CACHE_NAME.REQUEST_TAB_MAP, requestTabMap);
		
		logger.info("load CommonCache loaded");
	}
	*/
	private void loadLOV(){
		logger.info("load loadLOV loading...");
		List<LovInfo> l = lovDao.loadAllLov();
		LOV_MAP.clear();
		for (LovInfo info : l) {
			if(!LOV_MAP.containsKey(info.getType())){
				ArrayList<LovInfo> infoList = new ArrayList<LovInfo>();
				infoList.add(info);
				LOV_MAP.put(info.getType(), infoList);
			}else{
				LOV_MAP.get(info.getType()).add(info);
			}
		}
		
		logger.info("load loadLOV loaded [" + LOV_MAP.size() + "]");
		for (String k : LOV_MAP.keySet()){
			logger.info(k + " = [" + LOV_MAP.get(k).size() + "]");
		}
	}
	
	public static List<LovInfo> getLovByType(String lovType) {
		return LOV_MAP.get(lovType);
	}
	
	public static ConcurrentHashMap<String, List<LovInfo>> getLov() {
		return LOV_MAP;
	}
	
	public static List<LovInfo> getLovParamType() {
		List<LovInfo> list = new ArrayList<>();
		for (String k : LOV_MAP.keySet()){
			list.add(new LovInfo("PARAM_TYPE", k ,k , k));
		}
		return list;
	}

	/*public void buildDepartmentLov() {
		LOV_DEPT = new ArrayList<LovInfo>();
		List<SheDept> deptList = sheDeptDao.selectAll();
		for (SheDept dept : deptList) {
			LOV_DEPT.add(new LovInfo("DEPARTMENT", dept.getDeptCode(), dept.getDeptNameTh(), dept.getDeptNameEn()));
		}
	}*/
	
	/*public void buildAssetLov() {
		LOV_ASSET = new ArrayList<LovInfo>();
		List<InvAsset> list = invAssetDao.selectAll();
		for (InvAsset inv : list) {
			LOV_ASSET.add(new LovInfo("ASSET", inv.getHostId(), inv.getHostId(), inv.getHostId()));
		}
	}*/
	
	public void buildOwnerLov() {
		LOV_OWNER = new ArrayList<LovInfo>();
		List<Owner> list = ownerDao.selectAll();
		for (Owner inv : list) {
			LOV_OWNER.add(new LovInfo("OWNER", inv.getOwnerCode(),
					inv.getFirstName()+" "+inv.getLastName(),
					inv.getFirstName()+" "+inv.getLastName()));
		}
	}
	
	public void buildUserLov() {
		LOV_SYS_USERS = new ArrayList<LovInfo>();
		List<UserProfile> list = userService.queryUserAll();
		for (UserProfile inv : list) {
			LOV_SYS_USERS.add(new LovInfo("USERS", inv.getUserName(),
					inv.getFirstNameTh()+" "+inv.getLastNameTh(),
					inv.getFirstNameEn()+" "+inv.getLastNameEn()));
		}
	}
	
	public void buildRoleLov() {
		LOV_ROLE = new ArrayList<LovInfo>();
		List<Role> list = roleDao.selectAll();
		for (Role inv : list) {
			LOV_ROLE.add(new LovInfo("ROLE", inv.getRoleId()+"", inv.getRoleDesc(), inv.getRoleDesc()));
		}
	}

//	public static List<LovInfo> getLovDept() {
//		return LOV_DEPT;
//	}

	public static List<LovInfo> getLovAsset() {
		return LOV_ASSET;
	}
	
	public static List<LovInfo> getLovOwner() {
		return LOV_OWNER;
	}

	public static List<LovInfo> getLovRole() {
		return LOV_ROLE;
	}

	public static List<LovInfo> getLovUsers() {
		return LOV_SYS_USERS;
	}
	
}
