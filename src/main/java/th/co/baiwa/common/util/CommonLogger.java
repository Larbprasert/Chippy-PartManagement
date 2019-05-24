package th.co.baiwa.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class CommonLogger{

	//TODO Defined Log name Here
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	protected void log_error(String msg) {
		// serviceName|token|date|msg
		logger.error("{}|{}|{}|[{}]|[ERROR]={}", getServiceName(), "", getCurrentDate(), getUserLogin(), msg);
	}

	protected void log_info(String msg) {
		logger.info("{}|{}|{}|[{}]|[INFO]={}", getServiceName(), "", getCurrentDate(), getUserLogin(), msg);
	}

	private String getCurrentDate() {
		// 2016-07-15 15:52:45
//		SimpleDateFormat formater = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
//		return formater.format(Calendar.getInstance().getTime());
		return "";
	}
	
	private String getUserLogin(){
		if(UserLoginUtils.getCurrentUser() == null) return "null";
		return UserLoginUtils.getCurrentUser().getUsername();
	}
	protected abstract String getServiceName() ;
}
