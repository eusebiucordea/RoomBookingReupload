package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.UserBean;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteUser", value = "/deleteUser")
public class DeleteUser extends HttpServlet {
    @Inject
    private UserBean userBean;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdParam = request.getParameter("userId");
        if (userIdParam != null) {
            try {
                Long userId = Long.parseLong(userIdParam);
                userBean.deleteUser(userId);
                response.sendRedirect(request.getContextPath() + "/Users");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
        }
    }
}