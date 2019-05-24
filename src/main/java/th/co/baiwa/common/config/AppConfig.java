package th.co.baiwa.common.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.MessageSessionBean;
import th.co.baiwa.common.constant.CommonConstants;

@Configuration
@ComponentScan(
	useDefaultFilters = false,
	basePackages = {
		"th.co.baiwa",
		"th.co.tpcc",
		"th.co.portal"
	},
	includeFilters = {
		@ComponentScan.Filter(
			type = FilterType.ANNOTATION,
			value = {
				Service.class,
				Repository.class,
				Component.class
			}
		)
	},
	excludeFilters = {
		@ComponentScan.Filter(
			type = FilterType.ANNOTATION,
			value = Configuration.class
		)
	}
)
@EnableWebMvc
@PropertySource( "classpath:application.properties" )
@Import({
	DataAccessConfig.class,
	SecurityConfig.class
})
public class AppConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean(name="filterMultipartResolver") 
//	@Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() throws IOException{
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
         
        //Set the maximum allowed size (in bytes) for each individual file.
        resolver.setMaxUploadSizePerFile(5242880);//5MB
         
        //You may also set other available properties.
        resolver.setDefaultEncoding("utf-8");
         
        return resolver;
    }
 
	
//	@Bean
//	public JavaMailSenderImpl javaMailSenderImpl() {
//		JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
//		mailSenderImpl.setHost(env.getProperty("smtp.host"));
//		mailSenderImpl.setPort(env.getProperty("smtp.port", Integer.class));
//		mailSenderImpl.setProtocol(env.getProperty("smtp.protocol"));
//		mailSenderImpl.setUsername(env.getProperty("smtp.username"));
//		mailSenderImpl.setPassword(env.getProperty("smtp.password"));
//		Properties javaMailProps = new Properties();
//		javaMailProps.put("mail.smtp.auth", true);
//		javaMailProps.put("mail.smtp.starttls.enable", true);
//		mailSenderImpl.setJavaMailProperties(javaMailProps);
//		return mailSenderImpl;
//	}
	
	@Bean(name = CommonConstants.SPRING_BEAN_NAME.MESSAGE_SESSION_BEAN)
	@Scope(value = WebApplicationContext.CLASSPATH_URL_PREFIX, proxyMode = ScopedProxyMode.TARGET_CLASS)
	public MessageSessionBean messageSessionBean() {
		return new MessageSessionBean();
	}
	
	@Bean(initMethod = "reloadCache")
	public ApplicationCache applicationCache() {
		return new ApplicationCache();
	}
	
    @Bean  
    public UrlBasedViewResolver setupViewResolver() {  
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();  
        resolver.setPrefix("/views/");  
        resolver.setSuffix(".jsp");  
        resolver.setViewClass(JstlView.class);
        return resolver;  
    }
	
}
