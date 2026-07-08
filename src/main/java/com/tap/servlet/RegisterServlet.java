package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");

        // Password Match Check
        if (!password.equals(confirmPassword)) {

            response.getWriter().println(
                    "<h2>Passwords do not match!</h2>");

            return;
        }

        // Email Already Exists
        if (userDAO.emailExists(email)) {

            response.getWriter().println(
                    "<h2>Email already registered!</h2>");

            return;
        }

        User user = new User();

        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);

        // Default Role
        user.setRole("customer");

        userDAO.addUser(user);

        response.sendRedirect("login.jsp");
    }
}