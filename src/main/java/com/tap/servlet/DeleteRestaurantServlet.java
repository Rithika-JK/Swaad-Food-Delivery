package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RestaurantDAOImpl dao = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null){
            response.sendRedirect("login.jsp");
            return;
        }

        User admin = (User) session.getAttribute("loggedInUser");

        if(admin == null || !"superAdmin".equals(admin.getRole())){
            response.sendRedirect("restaurant");
            return;
        }

        String id = request.getParameter("restaurantId");

        if(id != null){

            dao.deleteRestaurant(Integer.parseInt(id));

        }

        response.sendRedirect("admin/restaurants.jsp");
    }
}