package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.getUserByEmail(email);

        // Validate user
        if (user != null && user.getPassword().equals(password)) {

            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            // Update last login time
            userDAO.updateLastLogin(user.getUserId());

            // Redirect based on role
            if ("superAdmin".equals(user.getRole())) {

                response.sendRedirect(request.getContextPath()
                        + "/admin/dashboard.jsp");

            } else {

                response.sendRedirect(request.getContextPath()
                        + "/index.jsp");

            }

        } else {

            request.setAttribute("error", "Invalid Email or Password");

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }
}