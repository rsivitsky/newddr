package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.Cart;
import com.sivitsky.ddr.model.Order;
import com.sivitsky.ddr.model.User;

import java.util.List;

public interface OrderService {

    Order saveOrder(Order order);

    List<Order> listOrder();

    void removeOrder(Long id);

    Order getOrderById(Long id);

    Object getOrderTotalByUserId(User user);

    List<Order> getOrdersByUserId(User user);

    List<Order> getNewOrdersByUserId(User user);

    List<Order> getOrdersByCart(Cart cart);

    List<Order> getOrdersByVendorId(Long vendor_id);

    void changeOrderStatus(Long booking_id, String status);

}
