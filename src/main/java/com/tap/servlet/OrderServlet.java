package com.tap.servlet;

import java.io.IOException;

import com.tap.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String customerName = request.getParameter("customerName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");

        session.setAttribute("customerName", customerName);
        session.setAttribute("phone", phone);
        session.setAttribute("address", address);
        session.setAttribute("payment", payment);

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            cart.clearCart();
        }

        response.sendRedirect(request.getContextPath() + "/orderSuccess.jsp");
    }
}