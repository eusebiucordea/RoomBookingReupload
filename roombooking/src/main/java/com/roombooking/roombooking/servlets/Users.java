package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.UserDto;
import com.roombooking.roombooking.ejb.UserBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Users", value = "/Users")
public class Users extends HttpServlet {
    @Inject
    UserBean usersBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserDto> pendingUsers = usersBean.findPendingUsers();
        List<UserDto> approvedUsers = usersBean.findApprovedUsers();
        request.setAttribute("pendingUsers", pendingUsers);
        request.setAttribute("approvedUsers", approvedUsers);
        request.setAttribute("activePage", "Users");
        request.getRequestDispatcher("/WEB-INF/pages/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}