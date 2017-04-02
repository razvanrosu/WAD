package com.online.shop.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.UserDetails;
import com.online.shop.repository.UserRepository;
import com.online.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails findUserById(Long id) {
		if (id != null) {
			return userRepository.findOne(id);
		}
		return null;
	}

	@Override
	public List<UserDetails> findAll() {
		return userRepository.findAll();
	}

	@Override
	public UserDetails save(UserDetails user) {
		return userRepository.save(user);
	}

}
