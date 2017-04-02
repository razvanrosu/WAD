package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.Product;

public interface ProductService {
	
	public Product save(Product product);
	
	public Product findById(Long id);
	
	public void delete(Long productId);
	
	public List<Product> findAll();
}
