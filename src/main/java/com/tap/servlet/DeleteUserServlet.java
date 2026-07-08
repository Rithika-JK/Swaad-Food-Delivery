package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether admin is logged in
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User admin = (User) session.getAttribute("loggedInUser");

        // Allow only super admin
        if (!"superAdmin".equals(admin.getRole())) {

            response.sendRedirect("restaurant");
            return;
        }

        int userId = Integer.parseInt(request.getParameter("userId"));

        User user = userDAO.getUser(userId);

        // Prevent deleting the Super Admin account
        if (user != null && !"superAdmin".equals(user.getRole())) {

            userDAO.deleteUser(userId);
        }

        response.sendRedirect("admin/users.jsp");
    }
}