package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    RestaurantDAOImpl dao = new RestaurantDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantId(
                Integer.parseInt(request.getParameter("restaurantId")));

        restaurant.setRestaurantName(
                request.getParameter("restaurantName"));

        restaurant.setCuisineType(
                request.getParameter("cuisineType"));

        restaurant.setDeliveryTime(
                Integer.parseInt(request.getParameter("deliveryTime")));

        restaurant.setAddress(
                request.getParameter("address"));

        restaurant.setRating(
                Float.parseFloat(request.getParameter("rating")));

        restaurant.setActive(
                Boolean.parseBoolean(request.getParameter("isActive")));

        restaurant.setImagePath(
                request.getParameter("imagePath"));

        dao.updateRestaurant(restaurant);

        response.sendRedirect("admin/restaurants.jsp");
    }
}