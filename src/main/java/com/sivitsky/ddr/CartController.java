package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.OfferService;
import com.sivitsky.ddr.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;

@Controller
@SessionAttributes({"cart", "user", "part", "order", "cartInfo"})
public class CartController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OfferService offerService;

    @RequestMapping(value = "/cart/add/{offer_id}", method = RequestMethod.GET)
    public String addToCart(@PathVariable("offer_id") Long offer_id, Cart cart, HttpServletRequest httpRequest) throws ParseException {
        HttpSession session = httpRequest.getSession(true);
        Order order = new Order();
        Offer offer = offerService.getOfferById(offer_id);
        order.setOffer(offer);
        order.setBooking_date(new Date());
        order.setPart(offer.getPart());
        order.setBooking_num(1);
        order.setBooking_sum(offer.getOffer_price().multiply(BigDecimal.valueOf(1)));
        if (cart.getCart_id() != null) {
            order.setCart(cart);
            order.setUser(cart.getUser());
        }
        orderService.saveOrder(order);
        return "redirect:/index?price_from=" + session.getAttribute("price_from") + "&price_to=" + session.getAttribute("price_to");
    }

    @RequestMapping("/cart/order/edit/{order_id}")
    public String editOrder(@PathVariable("order_id") Long order_id, Model model) {
        model.addAttribute("order", this.orderService.getOrderById(order_id));
        return "order_edit";
    }

    @RequestMapping(value = "/cart/order/save", method = RequestMethod.POST)
    public String addOrderPost(@ModelAttribute("order") Order order, BindingResult result) {
        if (!result.hasErrors()) {
            if (order.getBooking_num() > 0) {
                order.setBooking_sum(order.getOffer().getOffer_price().multiply(BigDecimal.valueOf(order.getBooking_num())));
                this.orderService.saveOrder(order);
            }
        }
        return "redirect:/cart/info";
    }

    @RequestMapping(value = "/cart/info", method = RequestMethod.GET)
    public String cartInfoByUserId(Model model, User user, HttpServletRequest httpRequest) throws ParseException {
        HttpSession session = httpRequest.getSession(true);
        if (user.getUser_id() == null) {
            model.addAttribute("orderListByUser", orderService.getOrdersByUserId((User) session.getAttribute("anonym")));
        } else {
            model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user));
        }
        return "cart";
    }
}
