package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.Order;

public interface OrderService {
	
	public Order save(Order order);
	
	public List<Order> findAll(Long accountId);
	
	public List<Order> findAll();

    public List<Order> findByUserAccountIdAndDone(Long accountId, int done);
}
