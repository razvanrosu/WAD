package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.UserDetails;

public interface UserService {
	
	public List<UserDetails> findAll();
	
	public UserDetails save(UserDetails user);
	
	public UserDetails findUserById(Long id);

}
