package th.co.baiwa.core.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/search")
public abstract class AbstractController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String tokenId = "" + System.currentTimeMillis();
	@PostConstruct
	private void init() {
//		String logDebugName = getSrvcName() + "_Debug";
		log_info("deployed: " + getSrvcName());
		if (logger != null) {
			logger.debug("deployed: " + getSrvcName());
		}
	}

	@PreDestroy
	private void destroy() {
		log_info("destroyed: " + getSrvcName());
	}

	protected abstract String getSrvcName();

	protected void sys_log_error(String msg) {
//		serviceName|token|date|msg
		logger.error("{}|{}|{}|[ERROR]={}",getSrvcName(),tokenId, getCurrentDate(),msg);
	}

	protected void log_info(String msg) {
		logger.info("{}|{}|{}|[INFO]={}",getSrvcName(),tokenId, getCurrentDate(),msg);
	}

	protected String getCurrentDate() {
		// 2016-07-15 15:52:45
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		return formater.format(Calendar.getInstance().getTime());
	}
}
