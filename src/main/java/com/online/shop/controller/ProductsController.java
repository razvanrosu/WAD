package com.online.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.online.shop.domain.Product;
import com.online.shop.service.ProductService;

@Controller
public class ProductsController extends DefaultController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/admin/products-management.html", method = RequestMethod.GET)
	public String getProductManagementPage(Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("contentTemplate", "admin/productList.jsp");
		return "index";
	}

	@RequestMapping(value = "/products.html", method = RequestMethod.GET)
	public String getProductList(Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("contentTemplate", "productList.jsp");
		return "index";
	}

	@RequestMapping(value = "/saveProduct.do", method = RequestMethod.POST)
	@ResponseBody
	public Product saveProduct(Product product, BindingResult results) {
		product.setAvailable(true);
		return this.productService.save(product);
	}


	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductPage(@PathVariable("id") long id, Model model){

		Product product = productService.findById(id);
		model.addAttribute("product", product);
		model.addAttribute("contentTemplate", "ProductDetails.jsp");
		return "index";
	}

}
