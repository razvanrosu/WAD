package com.online.shop.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.UserAccount;
import com.online.shop.repository.UserAccountRepository;
import com.online.shop.service.UserAccountService;

@Service
public class UserAccountServiceImpl implements UserAccountService {

	@Autowired
	private UserAccountRepository userAccountRepository;

	@Override
	public UserAccount findByUsername(String username) {
		if (username != null) {
			return userAccountRepository.findByUsername(username);
		}
		return null;
	}

	@Override
	public UserAccount save(UserAccount userAccount) {
		return this.userAccountRepository.save(userAccount);
	}

	@Override
	public List<UserAccount> findAll() {
		return this.userAccountRepository.findAll();
	}

	@Override
	public Boolean existsByUsername(String username) {
		return userAccountRepository.existsByUsername(username);
	}

	@Override
	public UserAccount findById(Long id) {
		return userAccountRepository.findOne(id);
	}

}
