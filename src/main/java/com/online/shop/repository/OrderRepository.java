package com.online.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
	
	public List<Order> findByAccountId(Long accountId);

    public List<Order> findByAccountIdAndDone(Long accountId, int done);

    public Order save(Order order);
}
