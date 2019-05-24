package th.co.portal.constant;

public class GasConstants {

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

	public static class EQUIPMENT_TYPE {
		public static final String GAS_DETECTOR = "GAS_DETECTOR";
	}
	
	public static class REQUEST_STATUS {
		public static final String COMPLETE = "CP";// Complete
		public static final String CREATED = "CR";// Created
//		public static final String SU = "SU";// Submit (Wait Approve)
		public static final String APPROVE = "AP";// Approve
//		public static final String RJ = "RJ";// Reject
		public static final String CANCEL = "CN";// Cancel
		public static final String WAIT_RECEIVE_FROM_USER = "WRU";// Wait receive from user
		public static final String WAIT_SEND_TO_USER = "WSV";// Wait send to vendor
		public static final String WAIT_RECEIVE_FROM_VENDOR = "WRV";// Wait receive from vendor
		public static final String WAIT_SEND_TO_VENDOR = "WSU";// Wait send to user
	}

}
