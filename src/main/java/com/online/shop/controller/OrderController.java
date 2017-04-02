package com.online.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.service.OrderService;

@Controller
public class OrderController extends DefaultController {
		
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/users/orders.html", method = RequestMethod.GET)
	public String getOrderList(Model model) {
		model.addAttribute("account", super.getCurrentUser());
		model.addAttribute("orders", orderService.findAll(super.getCurrentUser().getId()));
		model.addAttribute("contentTemplate", "orderList.jsp");
		return "index";
	}

	@RequestMapping(value = "/admin/orders-management.html", method = RequestMethod.GET)
	public String getAllOrdersList(Model model) {
		model.addAttribute("account", super.getCurrentUser());
		model.addAttribute("orders", orderService.findAll());
		model.addAttribute("contentTemplate", "orderList.jsp");
		return "index";
	}
}
