package th.co.baiwa.common.config.core;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import th.co.baiwa.common.config.AppConfig;
import th.co.baiwa.common.config.MvcConfig;
import th.co.baiwa.common.constant.CommonConstants.ENCODING;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	// configure Spring Container in ContextListener
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppConfig.class };
	}

	// configure default Spring Dispatcher (DispatcherServlet)
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { MvcConfig.class };
	}

	// configure default Spring MVC URL pattern
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		super.onStartup(servletContext);
		
		// Add Filter
		configFilter(servletContext);
		
		// Add Listener
		servletContext.addListener(HttpSessionEventPublisher.class);
	}
	
	private void configFilter(ServletContext servletContext) {
		// Filter for encoding UTF-8
		FilterRegistration.Dynamic characterEncodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
		characterEncodingFilter.setInitParameter("encoding", ENCODING.UTF8);
		characterEncodingFilter.setInitParameter("forceEncoding", "true");
		characterEncodingFilter.addMappingForUrlPatterns(null, true, "/*");
	}

}