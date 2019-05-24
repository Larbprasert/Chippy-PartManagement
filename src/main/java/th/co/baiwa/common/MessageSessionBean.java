package th.co.baiwa.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import th.co.baiwa.common.bean.MessageBean;
import th.co.baiwa.common.constant.CommonConstants.SPRING_BEAN_NAME;
import th.co.baiwa.common.constant.MessageConstants.MESSAGE_TYPE;
import th.co.baiwa.common.util.WebContextUtils;

public class MessageSessionBean implements Serializable {
	
	private static final long serialVersionUID = 2284478282696934522L;
	
	private List<MessageBean> errorList = new ArrayList<MessageBean>();
	private List<MessageBean> infoList = new ArrayList<MessageBean>();
	private List<MessageBean> warningList = new ArrayList<MessageBean>();
	
	public static MessageSessionBean getInstance() {
		return (MessageSessionBean) WebContextUtils.getBean(SPRING_BEAN_NAME.MESSAGE_SESSION_BEAN);
	}
	
	public void clear() {
		errorList.clear();
		warningList.clear();
		infoList.clear();
	}
	
	public void addMessageBean(MessageBean messageBean) {
		String messageType = messageBean.getMessageType();
		if (MESSAGE_TYPE.ERROR.equals(messageType)) {
			errorList.add(messageBean);
		} else if (MESSAGE_TYPE.WARNING.equals(messageType)) {
			warningList.add(messageBean);
		} else if (MESSAGE_TYPE.INFO.equals(messageType)) {
			infoList.add(messageBean);
		}
	}
	
	public void addMessageBeans(MessageBean... messageBeans) {
		for (MessageBean messageBean : messageBeans) {
			addMessageBean(messageBean);
		}
	}
	
	public void addMessageBeans(Collection<MessageBean> messageBeans) {
		for (MessageBean messageBean : messageBeans) {
			addMessageBean(messageBean);
		}
	}
	
	public List<MessageBean> getErrorList() {
		return errorList;
	}
	
	public List<MessageBean> getWarningList() {
		return warningList;
	}
	
	public List<MessageBean> getInfoList() {
		return infoList;
	}
	
}
