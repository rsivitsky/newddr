package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;

public interface CartDAO {
    Cart saveCart(Cart cart);

    Cart getCartByUser(User user);

    void removeCart(Cart cart);

    void replaceCartInOrder(Cart cart_from, Cart cart_to);
}
