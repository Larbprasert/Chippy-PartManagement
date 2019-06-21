package th.co.keihin.constant;

public class RequestConstants {

	public static final class FLAG {
		public static final String Y_FLAG = "Y";
		public static final String N_FLAG = "N";
	}
	
	public static final class RESPONSE {
		public static final String SUCCESS_CODE = "200";
		public static final String SUCCESS_MSG = "success";
		public static final String ERROR_CODE = "500";
		public static final String ERROR_MSG = "error";
	}
 
	
	public static class REQUEST_STATUS {
		public static final String CREATED = "1";// Created
		public static final String APPROVE_LV1 = "2";
		public static final String APPROVE_LV2 = "3";
		public static final String APPROVE_LV3 = "4";
		public static final String APPROVE_LV4 = "5";
		public static final String APPROVE_LV5 = "6";
		public static final String COMPLETE = "7";
		public static final String CANCEL = "99";// Cancel
	}

}
