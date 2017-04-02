package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.UserAccount;

public interface UserAccountService {
	
	public UserAccount findByUsername(String username);
	
	public UserAccount save(UserAccount userAccount);
	
	public List<UserAccount> findAll();
	
	public Boolean existsByUsername(String username);
	
	public UserAccount findById(Long id);
}
