package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;

public interface CartService {
    Cart saveCart(Cart cart);

    void removeCart(Cart cart);
    Cart getCartByUser(User user);

    void replaceCartInOrder(Cart cart_from, Cart cart_to);
}
