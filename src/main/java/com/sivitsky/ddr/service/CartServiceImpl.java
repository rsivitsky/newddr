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
    CartDAO cartDAO;

    @Transactional
    public Cart saveCart(Cart cart) {
        return cartDAO.saveCart(cart);

    }

    @Transactional
    public void removeCart(Long id) {
        cartDAO.removeCart(id);
    }

    @Transactional
    public Cart getCartByUser(User user) {
        return cartDAO.getCartByUser(user);
    }
}
