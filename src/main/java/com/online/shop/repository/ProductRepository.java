package com.online.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
