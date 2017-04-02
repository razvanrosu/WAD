package com.online.shop.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.online.shop.domain.UserAccount;
import com.online.shop.service.UserAccountService;

@Component
public class SecurityUserDetailsService implements UserDetailsService {

	@Autowired
	private UserAccountService userAccountService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserAccount userAccount = this.userAccountService.findByUsername(username);
		if (userAccount != null && userAccount.getActive()) {
			return new SecurityUserDetails(userAccount);
		}
		throw new UsernameNotFoundException("Account with username " + username + " not found");
	}

}
