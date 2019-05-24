package th.co.baiwa.common.constant;

public class MessageConstants {
	
	public static final class MESSAGE_TYPE {
		public static final String ERROR = "E";
		public static final String WARNING = "W";
		public static final String INFO = "I";
	}
	
	public static final class MESSAGE_CODE {
		// INFO
		public static final String INFO_INSERT_SUCCESSFUL = "I0001";
		public static final String INFO_UPDATE_SUCCESSFUL = "I0002";
		public static final String INFO_DELETE_SUCCESSFUL = "I0003";
		public static final String INFO_CONFIRM_DELETE = "I0001";
		public static final String INFO_ACTION_SUCCESSFUL = "I0005";
		
		// WARNING
		
		// ERROR
		public static final String ERROR_CANNOT_INSERT_DATA = "E0001";
		public static final String ERROR_CANNOT_UPDATE_DATA = "E0002";
		public static final String ERROR_CANNOT_DELETE_DATA = "E0003";
		public static final String ERROR_CONCURRENCY_FAILURE = "E0004";
		public static final String ERROR_OTHER_EXCEPTION = "E0005";
		public static final String ERROR_ACTION_EXCEPTION = "E0006";
	}
	
}
