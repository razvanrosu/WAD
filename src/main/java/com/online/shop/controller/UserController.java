package com.online.shop.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.online.shop.domain.Address;
import com.online.shop.domain.Role;
import com.online.shop.domain.RoleType;
import com.online.shop.domain.UserAccount;
import com.online.shop.domain.UserDetails;
import com.online.shop.service.AddressService;
import com.online.shop.service.RoleService;
import com.online.shop.service.UserAccountService;

@Controller
@RequestMapping(value = "/users")
public class UserController extends DefaultController {

	@Autowired
	private UserAccountService userAccountService;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AddressService addressService;

	@Secured(value = { "ROLE_ADMIN" })
	@RequestMapping(value = "/admin/users-management.html", method = RequestMethod.GET)
	public String getUserList(Model model) {

		List<UserAccount> userAccounts = this.userAccountService.findAll();
		userAccounts.removeIf(userAccount -> {
			return userAccount.getUserDetails() == null;
		});
		model.addAttribute("userAccounts", userAccounts);
		model.addAttribute("contentTemplate", "admin/userList.jsp");
		return "index";
	}
	
	@Secured(value = { "ROLE_ADMIN" })
	@RequestMapping(value = "/admin/disableUser.do", method = RequestMethod.GET)
	@ResponseBody
	public Boolean disableUser(
			@RequestParam(value = "id", required = true) Long id,
			@RequestParam(value = "active", required = true) Boolean active) {
		UserAccount account = this.userAccountService.findById(id);
		account.setActive(active);
		this.userAccountService.save(account);
		return true;
	}
	
	@RequestMapping(value = "/account.html", method = RequestMethod.GET)
	public String getAccountDetails(Model model) {

		model.addAttribute("account", super.getCurrentUser());
		model.addAttribute("addresses", super.getCurrentUser().getUserDetails().getAddresses());
		model.addAttribute("contentTemplate", "account.jsp");
		return "index";
	}
	
	@RequestMapping(value="/updateAccount.do", method = RequestMethod.POST)
	public RedirectView updateAccount(Model model, UserAccount account, BindingResult result) {
		UserAccount toUpdate = this.userAccountService.findByUsername(account.getUsername());
		toUpdate.setUsername(account.getUsername());
		toUpdate.setPassword(account.getPassword());
		toUpdate.getUserDetails().setFirstName(account.getUserDetails().getFirstName());
		toUpdate.getUserDetails().setLastName(account.getUserDetails().getLastName());
		this.userAccountService.save(toUpdate);
		
		return new RedirectView("/users/account.html", true);
	}
	
	@RequestMapping(value="/updateAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean updateAddress(Address address, BindingResult result) {
		address.setAccount(super.getCurrentUser().getUserDetails());
		this.addressService.save(address);
		return true;
	}
	
	@RequestMapping(value="/deleteAddress.do", method = RequestMethod.GET)
	@ResponseBody
	public Boolean deleteAddress(@RequestParam(value = "id", required = true) Long id) {
		this.addressService.delete(id);
		return true;
	}
	
	@RequestMapping(value="/saveAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public Address saveAddress(Address address, BindingResult result) {
		address.setAccount(super.getCurrentUser().getUserDetails());		
		return this.addressService.save(address);
	}
	
	@RequestMapping(value = "/save.html", method = RequestMethod.POST)
	public RedirectView createUser(Model model, @RequestParam(value = "username", required = true) String username, @RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "firstName", required = true) String firstName, @RequestParam(value = "lastName", required = true) String lastName) {
		List<Role> roles = roleService.findAll();

		UserAccount account = new UserAccount();
		account.setActive(true);
		account.setUsername(username);
		account.setPassword(password);
		account.setRoles(roles.stream().filter(role -> role.getType().equals(RoleType.ROLE_USER)).collect(Collectors.toSet()));

		UserDetails user = new UserDetails();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUserAccount(account);
		account.setUserDetails(user);

		account = this.userAccountService.save(account);

		return new RedirectView("/login.html", true);
	}

	@RequestMapping(value = "/checkUsername.do", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checkUserNameAvailability(@RequestParam(value = "username", required = true) String username) {
		return this.userAccountService.existsByUsername(username);
	}
}
