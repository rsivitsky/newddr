package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.User;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessListener implements HttpSessionListener {

    private CartService cartService;
    private UserService userService;

    public void sessionCreated(HttpSessionEvent e) {
        if (userService == null || cartService == null) {
            obtainUserAndCartService(e);
        }
        System.out.println("session created, beans obtained!");
    }

    public void sessionDestroyed(HttpSessionEvent e) {
        User userForDelete = (User) e.getSession().getAttribute("anonym");
        cartService.removeCart(cartService.getCartByUser(userForDelete));
        userService.removeUser(userForDelete);
        System.out.println("anonym!!!destroy");
    }

    private void obtainUserAndCartService(HttpSessionEvent e) {
        HttpSession session = e.getSession();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        userService = (UserService) ctx.getBean("userServiceImpl");
        cartService = (CartService) ctx.getBean("cartServiceImpl");
    }
}
