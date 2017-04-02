package com.online.shop.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.Order;
import com.online.shop.repository.OrderRepository;
import com.online.shop.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public Order save(Order order) {
		return orderRepository.save(order);
	}

	@Override
	public List<Order> findAll(Long accountId) {
		return orderRepository.findByAccountId(accountId);
	}

	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public List<Order> findByUserAccountIdAndDone(Long accountId, int done) {
		return orderRepository.findByAccountIdAndDone(accountId, done);
	}

}
