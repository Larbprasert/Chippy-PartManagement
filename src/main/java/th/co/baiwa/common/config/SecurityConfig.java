package th.co.baiwa.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import th.co.baiwa.security.constant.SecurityConstants;

@Configuration
@EnableWebMvc
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled=true, prePostEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	@Qualifier("authenticationProvider")
	private AuthenticationProvider authenticationProvider;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(
			"/rest/**",
			"/html/**"
		);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers(
				"/",
				SecurityConstants.LOGIN_URL,
				"/resources/**",
				"/rest/**"
			).permitAll()
			.anyRequest()
            .authenticated()
//			.antMatchers("/admin/**").hasRole("ADMIN")
//			.anyRequest().hasAnyRole("VIEW","EDIT","DELETE","ADMIN")
			
		.and()
		.formLogin()
			.loginPage(SecurityConstants.LOGIN_URL).permitAll()
			.defaultSuccessUrl(SecurityConstants.LOGIN_SUCCESS_URL)
//			.successHandler(duplicateLoginAuthenticationSuccessHandler(SecurityConstants.LOGIN_SUCCESS_URL, SecurityConstants.LOGIN_WARNING_URL))
			.failureUrl(SecurityConstants.LOGIN_ERROR_URL).permitAll()
			.usernameParameter("username")
			.passwordParameter("password")
		.and()
		.logout()
//			.addLogoutHandler(customLogoutHandler())
			.logoutUrl(SecurityConstants.LOGOUT_URL)
			.logoutSuccessUrl(SecurityConstants.LOGOUT_SUCCESS_URL)
			.invalidateHttpSession(true)
			.clearAuthentication(true)
		.and()
		.exceptionHandling()
			.accessDeniedPage("/error403.htm")
		.and()
		.sessionManagement()
			.maximumSessions(1)
			.sessionRegistry(sessionRegistry())
			.expiredUrl(SecurityConstants.LOGIN_URL+"?sout=Session Time Out !");
		
//		http.headers().frameOptions().sameOrigin().httpStrictTransportSecurity().disable();
		
		http.csrf().disable();
	}
	
	@Bean(name = "passwordEncoder")
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Bean(name = "sessionRegistry")
	public SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}
	
//	@Bean(name = "duplicateLoginAuthenticationSuccessHandler")
//	public DuplicateLoginAuthenticationSuccessHandler duplicateLoginAuthenticationSuccessHandler(String defaultTargetUrl, String warningTargetUrl) {
//		return new DuplicateLoginAuthenticationSuccessHandler(defaultTargetUrl, warningTargetUrl);
//	}
	
//	@Bean(name = "customLogoutHandler")
//	public CustomLogoutHandler customLogoutHandler() {
//		return new CustomLogoutHandler();
//	}
//	
}