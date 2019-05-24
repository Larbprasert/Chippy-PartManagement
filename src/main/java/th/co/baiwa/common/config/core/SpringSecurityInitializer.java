package th.co.baiwa.common.config.core;

import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.multipart.support.MultipartFilter;

public class SpringSecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	
	// This class will load the springSecurityFilterChain automatically.
	
	@Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		insertFilters(servletContext, new MultipartFilter());
	}
	
}