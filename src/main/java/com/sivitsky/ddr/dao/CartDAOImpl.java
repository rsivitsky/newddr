package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.User;
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

    public Cart saveCart(Cart cart) {
        sessionFactory.getCurrentSession().saveOrUpdate(cart);
        logger.info("Cart updated successfully, cart id=" + cart.getCart_id());
        return cart;
    }

    @SuppressWarnings("unchecked")
    public Cart getCartByUser(User user) {
        return (Cart) sessionFactory.getCurrentSession().createQuery("from Cart cart where cart.user = :user")
                .setParameter("user", user).uniqueResult();
    }

    public void removeCart(Long id) {
        Cart cart = (Cart) sessionFactory.getCurrentSession().load(Cart.class, id);
        if (null != cart) {
            sessionFactory.getCurrentSession().delete(cart);
        }

    }
}
