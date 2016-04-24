package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.repository.CartRepository;
import com.sivitsky.ddr.service.OfferService;
import com.sivitsky.ddr.service.OrderService;
import com.sivitsky.ddr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes({"cart", "user", "part", "listOrders"})
public class CartController {
    private OrderService orderService;
    private OfferService offerService;
    private UserService userService;

    @Autowired
    private CartRepository cartRepository;

    @Autowired(required = true)
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired(required = true)
    public void setOfferService(OfferService offerService) {
        this.offerService = offerService;
    }

    @Autowired(required = true)
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping(value = "/cart/add/{offer_id}", method = RequestMethod.GET)
    public String addToCart(@PathVariable("offer_id") Long offer_id, Model model, Cart cart, User user, @ModelAttribute("listOrders") List<Order> listOrders) throws ParseException {
        Order order = new Order();

        Offer offer = offerService.getOfferById(offer_id);
        order.setOffer(offer);
        order.setBooking_date(new Date());
        order.setPart(offer.getPart());
        order.setBooking_num(1);
        order.setBooking_sum(1 * offer.getOffer_price());
        if (user.getUser_id() != null) {
            order.setUser(user);
        }
        if (cart.getCart_id() != null) {
            order.setCart(cart);
        }
        if (user.getUser_id() != null) {
            order.setUser(user);
            orderService.saveOrder(order);
        } else {
            listOrders.add(order);
        }
        return "redirect:/index";
    }

    @RequestMapping(value = "/cart/info", method = RequestMethod.GET)
    public String cartInfoByUserId(Model model, User user) throws ParseException {
        model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user));
        return "cart";
    }

    @RequestMapping(value = "/order/cancel/{order_id}", method = RequestMethod.GET)
    public String cancelCart(HttpServletRequest request, @PathVariable("order_id") Long booking_id, Model model, Principal principal, User user) {
        orderService.cancelOrder(booking_id);
        //User user = userService.getUserByName(principal.getName());
        //if (user!=null){
        model.addAttribute("cartInfo", orderService.getOrderTotalByUserId(user));
        model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user));
        //}
        return "cart";
    }
}
