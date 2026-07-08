package com.tap.dao;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {

    // Create
    void addOrderItem(OrderItem orderItem);

    // Read Single Record
    OrderItem getOrderItem(int orderItemId);

    // Read All Records
    List<OrderItem> getAllOrderItems();

    // Update
    void updateOrderItem(OrderItem orderItem);

    // Delete
    void deleteOrderItem(int orderItemId);
}