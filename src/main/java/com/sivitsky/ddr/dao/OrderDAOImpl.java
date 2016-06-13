package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.OrderStatus;
import com.sivitsky.ddr.model.User;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {

    private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public Order saveOrder(Order order) {
        sessionFactory.getCurrentSession().saveOrUpdate(order);
        logger.info("Order updated successfully, Order id=" + order.getBooking_id());
        return order;
    }

    @SuppressWarnings("unchecked")
    public List<Order> listOrder() {
        return sessionFactory.getCurrentSession().createQuery("from Order").list();
    }

    public Order getOrderById(Long id) {
        return (Order) this.sessionFactory.getCurrentSession().get(Order.class, id);
    }

    public void removeOrder(Long id) {
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        if (null != order) {
            sessionFactory.getCurrentSession().delete(order);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Order> listOrderByUserId(User user) {
        String[] booking_status = {OrderStatus.NEW.toString(), OrderStatus.ORDERED.toString(), OrderStatus.PAID.toString()};
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getOrderesByUserId")
                .setParameter("user", user)
                .setParameter("booking_status", booking_status)
                .list();
    }

    @SuppressWarnings("unchecked")
    public Object getOrderTotalByUserId(User user) {
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getCountAndSumOrdersByUserId")
                .setParameter("user", user)
                .uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<Order> getOrdersByUserId(User user) {
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getOrdersByUserId")
                .setParameter("user", user)
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Order> getNewOrdersByUserId(User user) {
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getOrdersByUserId")
                .setParameter("user", user)
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Order> getOrdersByCart(Cart cart) {
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getOrdersByCart")
                .setParameter("cart", cart)
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Order> getOrdersByVendorId(Long vendor_id) {
        return sessionFactory.getCurrentSession().getNamedQuery("Order.getOrderesByVendorId")
                .setParameter("vendor_id", vendor_id)
                .list();
    }

    public void changeOrderStatus(Long booking_id, String status) {
        sessionFactory.getCurrentSession().createQuery("update Order set booking_status = :status" +
                " where booking_id = :booking_id").setParameter("booking_id", booking_id).setParameter("status", status).executeUpdate();
    }
}
