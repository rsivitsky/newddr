package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

    private static final Logger logger = LoggerFactory.getLogger(CartDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public Cart saveCart(Cart cart) {
        sessionFactory.getCurrentSession().saveOrUpdate(cart);
        logger.info("Cart updated successfully, cart id=" + cart.getCart_id());
        return cart;
    }

    @SuppressWarnings("unchecked")
    public Cart getCartByUser(User user) {
        return (Cart) sessionFactory.getCurrentSession().createQuery("from Cart where user = :user")
                .setParameter("user", user).uniqueResult();
    }

    public void removeCart(Cart cart) {
        sessionFactory.getCurrentSession().delete(cart);
    }

    public void replaceCartInOrder(Cart cart_from, Cart cart_to) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Order set cart = :cart_to" +
                ", user = :user where cart = :cart_from");
        query.setParameter("cart_to", cart_to);
        query.setParameter("cart_from", cart_from);
        query.setParameter("user", cart_to.getUser());
        int result = query.executeUpdate();
        logger.info("Cart updated successfully, new cart id=" + cart_to.getCart_id());
    }
}
