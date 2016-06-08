package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

@Controller
public class HttpSessAttrListener implements HttpSessionAttributeListener {

    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;

    public void attributeAdded(HttpSessionBindingEvent e) {

    }

    public void attributeRemoved(HttpSessionBindingEvent e) {
        System.out.println("I'm here! " + e.getName());
        String currentAttributeName = e.getName();
        if (currentAttributeName == "anonym") {
            cartService.removeCart(cartService.getCartByUser((User) e.getValue()));
            userService.removeUser((User) e.getValue());
            System.out.println("anonym!!!destroy");
        }
    }

    public void attributeReplaced(HttpSessionBindingEvent e) {

    }
}
