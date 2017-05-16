package com.online.shop.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.List;

import com.online.shop.domain.UserAccount;
import com.online.shop.service.UserAccountService;
import com.sun.deploy.nativesandbox.comm.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.online.shop.domain.Product;
import com.online.shop.service.ProductService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ProductsController extends DefaultController {

	@Autowired
	private ProductService productService;
	@Autowired
	private UserAccountService userAccountService;

	@RequestMapping(value = "/admin/products-management.html", method = RequestMethod.GET)
	public String getProductManagementPage(Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("contentTemplate", "admin/productList.jsp");
		return "index";
	}

	@RequestMapping(value = "/products.html", method = RequestMethod.GET)
	public String getProductList(Model model , HttpServletRequest request, HttpServletResponse response) {


		SecureRandom random = new SecureRandom();
		if(!super.isLoggedIn()){
			final boolean[] ok = new boolean[1];
			ok[0] = false;
			if (request.getCookies() != null) {
				Arrays.asList(request.getCookies()).forEach(
						cookie -> {
							if (cookie.getName().equals("CookieUser"))
								ok[0] = true;
						}
				);
			}
			if(ok[0] == false){
				Cookie cookie = new Cookie("CookieUser", new BigInteger(130, random).toString(32) + getIpAddress());
				response.addCookie(cookie);
				UserAccount userAccount = new UserAccount();
				userAccount.setUsername(cookie.getValue());
				userAccount.setPassword(cookie.getName());
//                userAccount.setRecoverTokenExpireDate();
				userAccountService.save(userAccount);
			}
		}
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
