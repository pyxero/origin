package com.asstar.app.appConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

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
		http.authorizeRequests().antMatchers("/login", "/verify", "/certificate", "/session").permitAll().anyRequest()
				.hasRole("LOGIN");
		http.formLogin().loginPage("/login").usernameParameter("no").passwordParameter("password").permitAll();
		http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
		http.csrf().disable();
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