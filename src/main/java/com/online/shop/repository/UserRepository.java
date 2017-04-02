package com.online.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.UserDetails;

@Repository
public interface UserRepository extends JpaRepository<UserDetails, Long> {
	
	
}
