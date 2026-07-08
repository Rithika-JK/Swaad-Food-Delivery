package com.tap.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    OrderDAOImpl dao=new OrderDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Order order=new Order();

        order.setOrderId(Integer.parseInt(request.getParameter("orderId")));
        order.setUserId(Integer.parseInt(request.getParameter("userId")));
        order.setRestaurantId(Integer.parseInt(request.getParameter("restaurantId")));

        order.setOrderDate(
                Timestamp.valueOf(request.getParameter("orderDate")));

        order.setTotalAmount(
                Float.parseFloat(request.getParameter("totalAmount")));

        order.setPaymentMode(
                request.getParameter("paymentMode"));

        order.setStatus(
                request.getParameter("status"));

        dao.updateOrder(order);

        response.sendRedirect("admin/orders.jsp");
    }
}