package com.asstar.app.appConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.asstar.app.authority.Authority;

//boot:5
@EnableWebSecurity
@ComponentScan("com.asstar.app")
public class SecurityConfigurer extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/path", "/login", "/certificate")
				.permitAll()
				.antMatchers("/**").hasRole("LOGIN")
				.anyRequest().authenticated().and()
				.formLogin().loginPage("/path?url=login")
				.usernameParameter("no")
				.passwordParameter("password")
				.permitAll();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder authenticationManager) throws Exception {

		authenticationManager.userDetailsService(userDetailsService());
	}

	@Bean
	public Authority userDetailsService() {

		Authority userDetailsService = new Authority();
		return userDetailsService;
	}

	@Bean(name = "authenticationManager")
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
}