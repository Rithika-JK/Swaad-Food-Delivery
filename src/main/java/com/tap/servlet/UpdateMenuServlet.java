package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    MenuDAOImpl dao=new MenuDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Menu menu=new Menu();

        menu.setMenuId(Integer.parseInt(request.getParameter("menuId")));
        menu.setRestaurantId(Integer.parseInt(request.getParameter("restaurantId")));
        menu.setItemName(request.getParameter("itemName"));
        menu.setDescription(request.getParameter("description"));
        menu.setPrice(Float.parseFloat(request.getParameter("price")));
        menu.setRating(Float.parseFloat(request.getParameter("rating")));
        menu.setAvailable(Boolean.parseBoolean(request.getParameter("isAvailable")));
        menu.setImagePath(request.getParameter("imagePath"));

        dao.updateMenu(menu);

        response.sendRedirect("admin/menu.jsp");
    }
}