package com.tap.servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAOImpl dao = new MenuDAOImpl();

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

        String id = request.getParameter("menuId");

        if(id != null){

            dao.deleteMenu(Integer.parseInt(id));

        }

        response.sendRedirect("admin/menu.jsp");
    }
}