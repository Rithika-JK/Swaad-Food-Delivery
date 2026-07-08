package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get restaurantId from URL
        String restaurantIdStr = request.getParameter("restaurantId");

        List<Menu> menuList;

        if (restaurantIdStr != null) {

            try {

                int restaurantId = Integer.parseInt(restaurantIdStr);

                // Fetch menu for selected restaurant
                menuList = menuDAO.getMenuByRestaurantId(restaurantId);

            } catch (NumberFormatException e) {

                // Invalid restaurant id
                menuList = menuDAO.getAllMenu();
            }

        } else {

            // If no restaurant selected, show all menu items
            menuList = menuDAO.getAllMenu();
        }

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("/menu.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
