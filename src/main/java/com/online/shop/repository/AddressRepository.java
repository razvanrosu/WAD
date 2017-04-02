package com.online.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.Address;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {

}
