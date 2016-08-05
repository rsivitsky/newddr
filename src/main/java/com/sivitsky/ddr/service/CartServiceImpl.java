package com.sivitsky.ddr.service;

import com.sivitsky.ddr.dao.CartDAO;
import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Transactional
    public Cart saveCart(Cart cart) {
        return cartDAO.saveCart(cart);
    }

    @Transactional
    public void replaceCartInOrder(Cart cart_from, Cart cart_to) {
        cartDAO.replaceCartInOrder(cart_from, cart_to);
    }

    @Transactional
    public void removeCart(Cart cart) {
        if (cart != null) {
            cartDAO.removeCart(cart);
        }
    }

    @Transactional
    public Cart getCartByUser(User user) {
        return cartDAO.getCartByUser(user);
    }
}
