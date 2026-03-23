package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.AuthenticationBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {

    @Inject
    AuthenticationBean authBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "Login");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("j_username");
        String password = request.getParameter("j_password");

        if (authBean.authenticate(username, password)) {
            request.getSession().setAttribute("username", username);
            String userRole = authBean.getUserRole(username);
            request.getSession().setAttribute("userRole", userRole);
            response.sendRedirect(request.getContextPath());
        } else {
            request.setAttribute("message", "Invalid credentials or account not approved yet");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}