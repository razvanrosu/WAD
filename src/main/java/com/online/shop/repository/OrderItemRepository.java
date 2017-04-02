package com.online.shop.repository;

import com.online.shop.domain.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by razvan on 3/25/2017.
 */
public interface OrderItemRepository extends JpaRepository<OrderItem, Long>{

    public OrderItem save(OrderItem orderItem);
}
