package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {
	private static final String INSERT_QUERY = "INSERT INTO orders(userId, restaurantId, orderDate, totalAmount, status, paymentMode) VALUES(?,?,?,?,?,?)";
    private static final String GET_QUERY ="SELECT * FROM orders WHERE orderId=?";
    private static final String GET_ALL_QUERY ="SELECT * FROM orders";
	private static final String UPDATE_QUERY ="UPDATE orders SET userId=?, restaurantId=?, orderDate=?, totalAmount=?, status=?, paymentMode=? WHERE orderId=?";		
	private static final String DELETE_QUERY = "DELETE FROM orders WHERE orderId=?";

	@Override
	public int addOrder(Order order) {

	    Connection connection = DBConnection.getConnection();

	    int orderId = 0;

	    try {

	        PreparedStatement pstmt =connection.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);

	        pstmt.setInt(1, order.getUserId());
	        pstmt.setInt(2, order.getRestaurantId());
	        pstmt.setTimestamp(3, order.getOrderDate());
	        pstmt.setFloat(4, order.getTotalAmount());
	        pstmt.setString(5, order.getStatus());
	        pstmt.setString(6, order.getPaymentMode());

	        pstmt.executeUpdate();

	        ResultSet rs = pstmt.getGeneratedKeys();

	        if (rs.next()) {

	            orderId = rs.getInt(1);

	        }

	        rs.close();
	        pstmt.close();

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return orderId;
	}	
	@Override
	public Order getOrder(int orderId) {

	    Order order = null;

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

	        pstmt.setInt(1, orderId);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {

	            order = new Order();

	            order.setOrderId(rs.getInt("orderId"));
	            order.setUserId(rs.getInt("userId"));
	            order.setRestaurantId(rs.getInt("restaurantId"));
	            order.setOrderDate(rs.getTimestamp("orderDate"));
	            order.setTotalAmount(rs.getFloat("totalAmount"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMode(rs.getString("paymentMode"));
	        }

	        rs.close();
	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return order;
	}
	
	@Override
	public List<Order> getAllOrders() {

	    List<Order> orderList = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(GET_ALL_QUERY);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Order order = new Order();

	            order.setOrderId(rs.getInt("orderId"));
	            order.setUserId(rs.getInt("userId"));
	            order.setRestaurantId(rs.getInt("restaurantId"));
	            order.setOrderDate(rs.getTimestamp("orderDate"));
	            order.setTotalAmount(rs.getFloat("totalAmount"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMode(rs.getString("paymentMode"));

	            orderList.add(order);
	        }

	        rs.close();
	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderList;
	}
	

	@Override
	public void updateOrder(Order order) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

	        pstmt.setInt(1, order.getUserId());
	        pstmt.setInt(2, order.getRestaurantId());
	        pstmt.setTimestamp(3, order.getOrderDate());
	        pstmt.setFloat(4, order.getTotalAmount());
	        pstmt.setString(5, order.getStatus());
	        pstmt.setString(6, order.getPaymentMode());
	        pstmt.setInt(7, order.getOrderId());

	        int rows = pstmt.executeUpdate();

	        System.out.println("Rows Updated : " + rows);

	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	@Override
	public void deleteOrder(int orderId) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

	        pstmt.setInt(1, orderId);

	        int rows = pstmt.executeUpdate();

	        System.out.println("Rows Deleted : " + rows);

	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}