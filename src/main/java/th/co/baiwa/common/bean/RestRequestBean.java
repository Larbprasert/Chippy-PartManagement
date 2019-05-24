package th.co.baiwa.common.bean;

public class RestRequestBean<T> {
	
	private T request;
	private UserBeanTest userBean;
	
	public T getRequest() {
		return request;
	}
	
	public void setRequest(T request) {
		this.request = request;
	}
	
	public UserBeanTest getUserBean() {
		return userBean;
	}
	
	public void setUserBean(UserBeanTest userBean) {
		this.userBean = userBean;
	}
	
}