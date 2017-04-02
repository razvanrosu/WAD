package com.online.shop.controller;

import com.online.shop.domain.CartItem;
import com.online.shop.domain.Order;
import com.online.shop.domain.OrderItem;
import com.online.shop.domain.Product;
import com.online.shop.repository.OrderItemRepository;
import com.online.shop.service.OrderService;
import com.online.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by razvan on 3/25/2017.
 */
@Controller
public class CartController extends DefaultController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @RequestMapping(value = "/add/{id}/{quantity}", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void addToCart(@PathVariable("id") long id, @PathVariable("quantity") int quantity){

        List<Order> orders = orderService.findByUserAccountIdAndDone(super.getCurrentUser().getId(), 0);
        Order order;
        OrderItem orderItem = new OrderItem();

        if(orders.size() == 0){
            order = new Order();
            order.setDone(0);
            order.setAccount(super.getCurrentUser());
            order.setDelivered(false);
            orderService.save(order);
            orderItem.setProduct(productService.findById(id));
            orderItem.setQuantity(quantity);
            orderItem.setId(id);
            orderItem.setOrder(order);
            orderItemRepository.save(orderItem);
        }
        else{
            boolean ok = true;
            order = orders.get(0);
            for (OrderItem existingOrderItem : order.getOrderItems()){
                if(existingOrderItem.getProduct().getId() == id){
                    existingOrderItem.setQuantity(existingOrderItem.getQuantity() + quantity);
                    ok = false;
                    break;
                }
            }

            if (ok == true){
                orderItem.setProduct(productService.findById(id));
                orderItem.setQuantity(quantity);
                orderItem.setId(id);
                orderItem.setOrder(order);
                order.getOrderItems().add(orderItem);
            }
            orderService.save(order);
        }
    }


    @RequestMapping(value = "/displayCart", method=RequestMethod.GET, produces="application/json")
    public @ResponseBody List<CartItem> getOrderItems(){
        List<Order> orders = orderService.findByUserAccountIdAndDone(super.getCurrentUser().getId(), 0);
        List <CartItem> cartItems= new ArrayList<>();
        orders.get(0).getOrderItems().forEach(orderItem -> cartItems.add(new CartItem(orderItem.getId(),orderItem.getProduct(), orderItem.getQuantity())));
        return  cartItems;
    }


    @RequestMapping(value = "/deleteOrderItem/{id}", method=RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteOrderItem(@PathVariable("id") long id){

        orderItemRepository.delete(id);

    }

    @RequestMapping(value = "/viewCart", method = RequestMethod.GET)
    public String viewCart(Model model){

        double total = 0;
        List<Order> orders = orderService.findByUserAccountIdAndDone(super.getCurrentUser().getId(), 0);
        List <CartItem> cartItems= new ArrayList<>();
        orders.get(0).getOrderItems().forEach(orderItem -> cartItems.add(new CartItem(orderItem.getId(),orderItem.getProduct(), orderItem.getQuantity())));
        for (CartItem cartItem: cartItems) {
            total += cartItem.getQuantity()* cartItem.getProduct().getPrice();
        }
        model.addAttribute("total", total);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("contentTemplate", "viewCart.jsp");
        return "index";
    }
}
