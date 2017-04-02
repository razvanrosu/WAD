package com.online.shop.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
@ComponentScan(basePackages = "com.online.shop")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private SecurityUserDetailsService securityUserDetailsService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(securityUserDetailsService);
//			.passwordEncoder(getBCryptPasswordEncoder());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.anyRequest().permitAll().and()
			.exceptionHandling().accessDeniedPage("/403.html").and()				
			.formLogin()
				.loginPage("/login.html")
				.failureUrl("/login.html?error")
				.defaultSuccessUrl("/home.html", true)
				.usernameParameter("username")
				.passwordParameter("password")
				.successForwardUrl("/home.html")
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/logout.html")
				.logoutSuccessUrl("/login.html")
				.and()
			.csrf().disable()
			.headers().frameOptions().sameOrigin().and()
			//.rememberMe().and()
			.httpBasic();
		http.rememberMe().
				key("rem-me-key").
				rememberMeParameter("remember-me-param").
				rememberMeCookieName("my-remember-me").
				tokenValiditySeconds(86400);
	}
		
//	@Bean
//	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
}
