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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

@Controller
@SessionAttributes({"cart", "user", "part", "listOrders"})
public class CartController {
    private OrderService orderService;
    private OfferService offerService;
    private UserService userService;
    // private List<Order> listOrders = new ArrayList<Order>();

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
    public String addToCart(@PathVariable("offer_id") Long offer_id, Model model, Cart cart, User user, ArrayList<Order> listOrders) throws ParseException {
        Order order = new Order();

        Offer offer = offerService.getOfferById(offer_id);
        order.setOffer(offer);
        order.setOrder_date(new Date());
        order.setPart(offer.getPart());
        order.setOrder_num(1);
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
            model.addAttribute(listOrders);
        }
        return "redirect:/offers/partinfo/" + offer.getPart().getPart_id();
    }

    @RequestMapping(value = "/cart/info", method = RequestMethod.GET)
    public String cartInfoByUserId(Model model, Principal principal) throws ParseException {
        Long user_id = userService.getUserByName(principal.getName()).getUser_id();
        model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user_id));
        return "cart";
    }

    @RequestMapping(value = "/order/cancel/{order_id}", method = RequestMethod.GET)
    public String cancelCart(HttpServletRequest request, @PathVariable("order_id") Long order_id, Model model, Principal principal){
        orderService.cancelOrder(order_id);
        User user = userService.getUserByName(principal.getName());
        if (user!=null){
            String[] booking_status = new String[2];
            /*booking_status[0] = OrderStatus.NEW.name();
            booking_status[1] = OrderStatus.PAID.name();*/
            model.addAttribute("cartInfo", orderService.getOrderTotalByUserId(user.getUser_id()));
            model.addAttribute("orderListByUser", orderService.getOrdersByUserId(user.getUser_id()));
        }
        return "cart";
    }
}
