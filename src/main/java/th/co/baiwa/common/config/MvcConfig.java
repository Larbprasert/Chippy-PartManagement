package th.co.baiwa.common.config;

import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.GsonHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import th.co.baiwa.common.bean.JsonNumberSerializer;
import th.co.baiwa.common.constant.CommonConstants.ENCODING;

@Configuration
@EnableWebMvc
@ComponentScan(
	useDefaultFilters = false,
	basePackages = {
		"th.co.baiwa",
		"th.co.tpcc",
		"th.co.portal",
		"th.co.keihin"
	},
	includeFilters = {
		@ComponentScan.Filter(
			type = FilterType.ANNOTATION,
			value = {
				Controller.class,
				RestController.class
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
public class MvcConfig extends WebMvcConfigurerAdapter {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		logger.info("Configure View Resolvers");
		
		registry.tiles();
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		logger.info("Tiles Configurer");
		
		TilesConfigurer tilesconfigurer = new TilesConfigurer();
		// TODO Add Tiles Configure Here
		tilesconfigurer.setDefinitions(new String[] {
			"/WEB-INF/defs/baiwa/baiwaTiles.xml",
			"/WEB-INF/defs/tpcc/tpccTiles.xml",
			"/WEB-INF/defs/portal/enviTiles.xml",
			"/WEB-INF/defs/portal/gasTiles.xml",
			"/WEB-INF/defs/portal/ffeTiles.xml",
			"/WEB-INF/defs/keihin/partManagementTitle.xml"
		});
		tilesconfigurer.setCheckRefresh(true);
		
		return tilesconfigurer;
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		logger.info("Multipart Resolver");

		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding(ENCODING.UTF8);
	    resolver.setMaxUploadSize(10485760); // 10MB
	    resolver.setResolveLazily(false);

		return resolver;
	}
	
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {

		Gson gson = new GsonBuilder()
			//.excludeFieldsWithoutExposeAnnotation()
//			.setDateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss")
			.setDateFormat("dd/MM/yyyy")
			.setPrettyPrinting()
			.registerTypeAdapter(BigDecimal.class, new JsonNumberSerializer())
			.serializeNulls()
			.create();
		
		GsonHttpMessageConverter gsonConverter = new GsonHttpMessageConverter();
		gsonConverter.setGson(gson);
		
		converters.add(gsonConverter);
	}
	
    
//   @Override
//   public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
//       converters.add(mappingJackson2HttpMessageConverter());
//   }
//    
//   @Bean
//   public MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter() {
//       MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
//       converter.setObjectMapper(new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false));
//       return converter;
//   }
	
	
	
	@Bean
    public ReloadableResourceBundleMessageSource messageSource(){
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("classpath:messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Bean
    public CookieLocaleResolver localeResolver(){
        CookieLocaleResolver localeResolver = new CookieLocaleResolver();
        localeResolver.setDefaultLocale(Locale.ENGLISH);
        localeResolver.setCookieName("baiwa-locale-cookie");
        localeResolver.setCookieMaxAge(3600);
        return localeResolver;
    }

    @Bean
    public LocaleChangeInterceptor localeInterceptor(){
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("lang");
        return interceptor;
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeInterceptor());
    }

    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
}
