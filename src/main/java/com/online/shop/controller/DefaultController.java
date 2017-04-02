package com.online.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.online.shop.config.security.SecurityUserDetails;
import com.online.shop.domain.UserAccount;
import com.online.shop.service.UserAccountService;


public abstract class DefaultController {
	
	@Autowired
	private UserAccountService userAccountService;

	@ModelAttribute(value = "urlSegment")
	public String getUrlSegment() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String request_url = request.getRequestURL().toString();
		String[] segments = request_url.split("/");

		if (segments.length > 0 && !request.getServletContext().equals(segments[segments.length - 1])) {
			return segments[segments.length - 1];
		}
		return null;
	}
	
	@ModelAttribute(value = "currentUser")
	public UserAccount getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof SecurityUserDetails) {
			updateCurrentUser();
			return ((SecurityUserDetails) authentication.getPrincipal()).getUserAccount();
		}
		return null;
	}
	
	private void updateCurrentUser() {
		SecurityUserDetails details = (SecurityUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		details.setUserAccount(userAccountService.findByUsername(details.getUserAccount().getUsername()));
	}
	
	@ModelAttribute(value = "isLoggedIn")
	public Boolean isLoggedIn() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof SecurityUserDetails) {
			return true;
		}
		return false;
	}
}
