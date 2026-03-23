package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.UserBean;
import com.roombooking.roombooking.entities.Role;
import com.roombooking.roombooking.entities.User;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Inject
    UserBean userBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activePage", "Register");
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("registerUsername");
        String email = request.getParameter("registerEmail");
        String password = request.getParameter("registerPassword");
        String phone = request.getParameter("registerPhone");
        String roleName = request.getParameter("registerRole");

        try {
            userBean.createUser(username, password, email, phone, roleName);
            response.sendRedirect(request.getContextPath() + "/Login");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while registering. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}
