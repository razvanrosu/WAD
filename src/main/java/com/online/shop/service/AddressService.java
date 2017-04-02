package com.online.shop.service;

import com.online.shop.domain.Address;

public interface AddressService {
	public Address findById(Long id);

	public Address save(Address address);
	
	public void delete(Long id);
}
