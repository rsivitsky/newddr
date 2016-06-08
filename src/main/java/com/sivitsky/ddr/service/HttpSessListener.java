package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessListener implements HttpSessionListener {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;

    public void sessionCreated(HttpSessionEvent e) {
        System.out.println("!session created");
    }

    public void sessionDestroyed(HttpSessionEvent e) {
        HttpSession session = e.getSession();
        if (session.getAttribute("anonym") != null) {
            cartService.removeCart(cartService.getCartByUser((User) session.getAttribute("anonym")));
            userService.removeUser((User) session.getAttribute("anonym"));
            session.removeAttribute("anonym");
            System.out.println("anonym!!!destroy");
        } else {
            System.out.println("!!!destroy");
        }
    }
}
