package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    RestaurantDAOImpl dao = new RestaurantDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantName = request.getParameter("restaurantName");
        String cuisineType = request.getParameter("cuisineType");
        int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
        String address = request.getParameter("address");
        float rating = Float.parseFloat(request.getParameter("rating"));
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String imagePath = request.getParameter("imagePath");

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantName(restaurantName);
        restaurant.setCuisineType(cuisineType);
        restaurant.setDeliveryTime(deliveryTime);
        restaurant.setAddress(address);
        restaurant.setRating(rating);
        restaurant.setActive(isActive);
        restaurant.setImagePath(imagePath);

        dao.addRestaurant(restaurant);

        response.sendRedirect("admin/restaurants.jsp");
    }
}