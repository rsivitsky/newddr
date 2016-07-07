package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.List;

public class HttpSessListener implements HttpSessionListener {

    private CartService cartService;
    private UserService userService;
    private OrderService orderService;

    public void sessionCreated(HttpSessionEvent e) {
        if (userService == null || cartService == null || orderService == null) {
            obtainUserAndCartService(e);
        }
        System.out.println("session created: " + e.getSession().toString() + ", beans obtained");
    }

    public void sessionDestroyed(HttpSessionEvent e) {
        User userForDelete = (User) e.getSession().getAttribute("anonym");
        List<Order> listOrder = orderService.getOrdersByUserId(userForDelete);
        for (Order aListOrder : listOrder) {
            orderService.removeOrder(aListOrder.getBooking_id());
        }
        cartService.removeCart(cartService.getCartByUser(userForDelete));
        userService.removeUser(userForDelete);
    }

    private void obtainUserAndCartService(HttpSessionEvent e) {
        HttpSession session = e.getSession();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        userService = (UserService) ctx.getBean("userServiceImpl");
        cartService = (CartService) ctx.getBean("cartServiceImpl");
        orderService = (OrderService) ctx.getBean("orderServiceImpl");
    }
}
