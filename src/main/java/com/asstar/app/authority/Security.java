package com.asstar.app.authority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.asstar.app.authority.role.Role;
import com.asstar.app.authority.user.User;

public class Security extends User implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Security(User user) {
		if (user != null) {
			this.setId(user.getId());
			this.setUsername(user.getUsername());
			this.setPassword(user.getPassword());
			this.setRoles(user.getRoles());
			this.setEnabled(user.getEnabled());
			this.setAccountNonExpired(user.getAccountNonExpired());
			this.setAccountNonLocked(user.getAccountNonLocked());
			this.setCredentialsNonExpired(user.getCredentialsNonExpired());
		}
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Set<Role> roles = this.getRoles();
		authorities.add(new SimpleGrantedAuthority("ROLE_LOGIN"));
		if (roles != null) {
			for (Role role : roles) {
				authorities.add(new SimpleGrantedAuthority(role.getName()));
			}
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return super.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return super.getAccountNonExpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return super.getAccountNonLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return super.getCredentialsNonExpired();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return super.getEnabled();
	}

}
