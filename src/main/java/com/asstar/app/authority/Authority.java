package com.asstar.app.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.asstar.app.authority.user.User;
import com.asstar.app.authority.user.UserService;

public class Authority implements UserDetailsService {

	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String no) throws UsernameNotFoundException {
		User user = userService.findByNo(no);
		if (user == null) {
			throw new UsernameNotFoundException("error");
		}
		return new Security(user);
	}

}
