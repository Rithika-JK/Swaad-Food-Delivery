package com.tap.filter;

import java.io.IOException;

import com.tap.model.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        String uri = request.getRequestURI();

        HttpSession session = request.getSession(false);

        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("loggedInUser");
        }

        // Static resources
        if (uri.contains("/css/")
                || uri.contains("/images/")
                || uri.contains("/js/")) {

            chain.doFilter(request, response);
            return;
        }

        // Public pages
        boolean publicPage =
                uri.endsWith("index.jsp") ||
                uri.endsWith("login.jsp") ||
                uri.endsWith("register.jsp") ||
                uri.endsWith("/login") ||
                uri.endsWith("/register");

        // User already logged in
        if (user != null) {

            // Prevent opening login/register again
            if (uri.endsWith("login.jsp")
                    || uri.endsWith("register.jsp")) {

                response.sendRedirect(request.getContextPath()
                        + "/restaurant");

                return;
            }

            chain.doFilter(request, response);
            return;
        }

        // User NOT logged in
        if (publicPage) {

            chain.doFilter(request, response);

        } else {

            response.sendRedirect(request.getContextPath()
                    + "/login.jsp");
        }
    }
}