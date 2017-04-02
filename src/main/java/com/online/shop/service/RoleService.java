package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.Role;

public interface RoleService {

	public Role save(Role role);
	
	public List<Role> findAll();

}
