package com.sonvt8.root.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {

		User.UserBuilder users = User.withDefaultPasswordEncoder();

		auth.inMemoryAuthentication().withUser(users.username("son").password("password").roles("EMPLOYEE"));

		auth.inMemoryAuthentication().withUser(users.username("admin").password("password").roles("ADMIN"));
	}

	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.authorizeRequests()
				// any request must be authenticated (must be logged in)
				.antMatchers("/resources/css/**").permitAll()
				.antMatchers("/resources/js/**").permitAll()
				.antMatchers("/resources/demo_data/**").permitAll()
				.antMatchers("/resources/images/**").permitAll()
				.antMatchers("/resources/less/**").permitAll()
				.antMatchers("/resources/locales/**").permitAll()
				.antMatchers("/resources/swf/**").permitAll()
				.anyRequest().authenticated().and().formLogin()
				// URL for custom login page
				// must use field name "username" and "password"
				.loginPage("/showMyLoginPage")
				// Spring Security provides by default (no code require)
				.loginProcessingUrl("/authenticateTheUser")
				// allow everyone to see login page
				.permitAll().and().logout().permitAll();
	}
}
