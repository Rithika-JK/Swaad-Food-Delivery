package com.tap.dao;

import java.util.List;
import com.tap.model.Order;

public interface OrderDAO {

    // Create
    int addOrder(Order order);

    // Read Single Order
    Order getOrder(int orderId);

    // Read All Orders
    List<Order> getAllOrders();

    // Update
    void updateOrder(Order order);

    // Delete
    void deleteOrder(int orderId);
}