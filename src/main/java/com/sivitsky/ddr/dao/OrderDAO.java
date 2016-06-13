package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;

import java.util.List;

public interface OrderDAO {

    List<Order> listOrder();

    Order saveOrder(Order order);

    Order getOrderById(Long id);

    void removeOrder(Long id);

    List<Order> listOrderByUserId(User user);

    Object getOrderTotalByUserId(User user);

    List<Order> getOrdersByUserId(User user);

    List<Order> getNewOrdersByUserId(User user);

    List<Order> getOrdersByCart(Cart cart);

    List<Order> getOrdersByVendorId(Long vendor_id);

    void changeOrderStatus(Long booking_id, String status);

}
