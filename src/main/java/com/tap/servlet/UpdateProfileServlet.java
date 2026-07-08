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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAOImpl userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Read updated values
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Update object
        loggedInUser.setUserName(userName);
        loggedInUser.setEmail(email);
        loggedInUser.setAddress(address);

        // Save in database
        userDAO.updateUserWithoutPassword(loggedInUser);

        // Update session
        session.setAttribute("loggedInUser", loggedInUser);

        // Redirect to profile page
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
    }
}