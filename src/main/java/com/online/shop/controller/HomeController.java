package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController extends DefaultController {

	@RequestMapping(value = { "/","/home.html" }, method = RequestMethod.GET)
	public String getHomePage(Model model) {
		model.addAttribute("contentTemplate", "home.jsp");
		return "index";
	}

}
