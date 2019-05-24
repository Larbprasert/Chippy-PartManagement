package th.co.baiwa.common.constant;

import java.math.RoundingMode;

public class CommonConstants {
	
	public static final class FLAG {
		public static final String Y_FLAG = "Y";
		public static final String N_FLAG = "N";
	}
	
	public static final class ENCODING {
		public static final String UTF8 = "utf-8";
	}
	
	public static final class SPRING_BEAN_NAME {
		public static final String MESSAGE_SESSION_BEAN = "messageSessionBean";
	}
	
	// Using in Security Module, for checking this User is authenticate already
	public static final String ROLE_USER = "ROLE_USER";
	
	// System User
	public static final class BACKEND_USER {
		public static final String SYSTEM = "SYSTEM";
	}
	
	public static final class ANGULAR2 {
		public static final String VIWE_NAME = "baiwa/common/templates/angular2-body";
		public static final String APP_NAME = "mainTsName";
	}
	
	public static final class EditDataTableAction {
		public static final String CREATE = "create";
		public static final String EDIT = "edit";
		public static final String REMOVE = "remove";
	}
	

	public static class WEBSERVICE {
		public static final String STATUS_SUCCESS = "0";
		public static final String STATUS_FAILED = "1";

		public static final String STATUS_SUCCESS_TEXT = "SUCCESS";
		public static final String STATUS_FAILED_TEXT = "FAILED";
	}

	
	public static class ROLES {
		public static final String ROLE_ENVI_ADMIN  = "ROLE_ENVI_ADMIN";
		public static final String ROLE_ENVI_USER   = "ROLE_ENVI_USER";
		
		public static final String ROLE_GAS_STAFF   = "ROLE_GAS_STAFF";
		public static final String ROLE_GAS_USER    = "ROLE_GAS_USER";
		public static final String ROLE_GAS_SUP     = "ROLE_GAS_SUP";
		public static final String ROLE_GAS_SEC_MNG = "ROLE_GAS_SEC_MNG";
		public static final String ROLE_GAS_DEP_MNG = "ROLE_GAS_DEP_MNG";
		
	}
	
	public static class NUMBER_SCALE {
		public static final int SCALE_SHOW = 5;
		public static final int SCALE_CAL = 4;
		public static final RoundingMode ROUNDING_MODE = RoundingMode.HALF_UP;
	}
	
	
}
