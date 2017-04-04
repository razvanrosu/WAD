package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends DefaultController {

	@RequestMapping(value = {"/login.html" }, method = RequestMethod.GET)
	public String getLoginPage(Model model) {		
		model.addAttribute("contentTemplate", "login.jsp");
		return "index";
	}
}
