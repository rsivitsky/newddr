package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.repository.CartRepository;
import com.sivitsky.ddr.service.OfferService;
import com.sivitsky.ddr.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;

@Controller
@SessionAttributes({"cart", "user", "part", "order", "cartInfo"})
public class CartController {
    private OrderService orderService;
    private OfferService offerService;

    @Autowired
    private CartRepository cartRepository;

    @Autowired(required = true)
    public void setOfferService(OfferService offerService) {
        this.offerService = offerService;
    }

    @Autowired(required = true)
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping(value = "/cart/add/{offer_id}", method = RequestMethod.GET)
    public String addToCart(@PathVariable("offer_id") Long offer_id, Cart cart, HttpServletRequest httpRequest) throws ParseException {
        HttpSession session = httpRequest.getSession(true);
        Order order = new Order();
        Offer offer = offerService.getOfferById(offer_id);
        order.setOffer(offer);
        order.setBooking_date(new Date());
        order.setPart(offer.getPart());
        order.setBooking_num(1);
        order.setBooking_sum(1 * offer.getOffer_price());
        if (cart.getCart_id() != null) {
            order.setCart(cart);
        }
        order.setUser((User) session.getAttribute("anonym"));
        orderService.saveOrder(order);
        return "redirect:/index?price_from=" + session.getAttribute("price_from") + "&price_to=" + session.getAttribute("price_to");
    }

    @RequestMapping(value = "/cart/order/save", method = RequestMethod.POST)
    public String addOrderPost(@ModelAttribute("order") Order order, BindingResult result) {
        if (!result.hasErrors()) {
            if (order.getBooking_num() > 0) {
                order.setBooking_sum(order.getBooking_num() * order.getOffer().getOffer_price());
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
