package com.online.shop.controller;

import com.online.shop.domain.Address;
import com.online.shop.domain.CartItem;
import com.online.shop.domain.Order;
import com.online.shop.domain.UserAccount;
import com.online.shop.service.AddressService;
import com.online.shop.service.OrderService;
import com.online.shop.service.UserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * Created by razvan on 4/4/2017.
 */
@Controller
public class CheckoutController extends DefaultController {

    @Autowired
    private AddressService addressService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserAccountService userAccountService;

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model){
        Set<Address> addresses = new HashSet<Address>();
        if (super.isLoggedIn()) {
            addresses = super.getCurrentUser().getUserDetails().getAddresses();
        }

        double total = 0;
        List<Order> orders = new ArrayList<Order>();
        if(super.isLoggedIn()) {
            orders = orderService.findByUserAccountIdAndDone(super.getCurrentUser().getId(), 0);
        }
        else {
            UserAccount userAccount = userAccountService.findByUsername(getIpAddress());
            if(userAccount != null) {
                orders = orderService.findByUserAccountIdAndDone(userAccount.getId(), 0);
            }
        }
        List <CartItem> cartItems= new ArrayList<>();
        orders.get(0).getOrderItems().forEach(orderItem -> cartItems.add(new CartItem(orderItem.getId(),orderItem.getProduct(), orderItem.getQuantity())));
        for (CartItem cartItem: cartItems) {
            total += cartItem.getQuantity()* cartItem.getProduct().getPrice();
        }
        model.addAttribute("total", total);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("addresses", addresses);
        model.addAttribute("contentTemplate", "checkout.jsp");
        return "index";
    }
}
