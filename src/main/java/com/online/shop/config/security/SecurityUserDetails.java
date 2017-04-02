package com.online.shop.config.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.online.shop.domain.UserAccount;

public class SecurityUserDetails implements UserDetails {
	private static final long serialVersionUID = 3355382762483537625L;

	private UserAccount userAccount;
	private Set<GrantedAuthority> authorities = new HashSet<>();

	public SecurityUserDetails(UserAccount userAccount) {
		this.userAccount = userAccount;
		userAccount.getRoles().forEach(role -> authorities.add(new SimpleGrantedAuthority(role.getType().toString())));
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return userAccount.getPassword();
	}

	@Override
	public String getUsername() {
		return userAccount.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return userAccount.getActive();
	}

	public UserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}

}
