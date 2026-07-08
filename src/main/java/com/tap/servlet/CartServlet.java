package com.tap.servlet;

import java.io.IOException;

import com.tap.model.Cart;
import com.tap.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String menuIdStr = request.getParameter("menuId");

        if (action == null || menuIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Missing parameters");
            return;
        }

        int menuId;

        try {
            menuId = Integer.parseInt(menuIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Menu ID");
            return;
        }

        switch (action) {

        // ================= ADD ITEM =================

        case "add": {

            String restaurantIdStr = request.getParameter("restaurantId");
            String itemName = request.getParameter("itemName");
            String priceStr = request.getParameter("price");
            String imagePath = request.getParameter("imagePath");   // NEW

            if (restaurantIdStr == null ||
                itemName == null ||
                priceStr == null) {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Missing Item Details");
                return;
            }

            int restaurantId;
            float price;

            try {

                restaurantId = Integer.parseInt(restaurantIdStr);
                price = Float.parseFloat(priceStr);

            } catch (NumberFormatException e) {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid Price");
                return;
            }

            CartItem item = new CartItem();

            item.setMenuId(menuId);
            item.setRestaurantId(restaurantId);
            item.setItemName(itemName);
            item.setPrice(price);
            item.setQuantity(1);
            item.setImagePath(imagePath);     // NEW

            System.out.println("Image Path = " + imagePath);

            cart.addItem(item);

            break;
        }

        // ================= REMOVE =================

        case "remove":

            cart.removeItem(menuId);

            break;

        // ================= UPDATE =================

        case "update": {

            String qtyStr = request.getParameter("quantity");

            if (qtyStr == null) {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Quantity Missing");

                return;
            }

            int quantity;

            try {

                quantity = Integer.parseInt(qtyStr);

            } catch (NumberFormatException e) {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid Quantity");

                return;
            }

            cart.updateItem(menuId, quantity);

            break;
        }

        default:

            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Action");
            return;
        }

        // ================= REDIRECT =================

        if ("add".equals(action)) {

            String restaurantId = request.getParameter("restaurantId");

            response.sendRedirect(request.getContextPath()
                    + "/menu?restaurantId=" + restaurantId);

        } else {

            response.sendRedirect(request.getContextPath()
                    + "/cart.jsp");
        }
    }
}