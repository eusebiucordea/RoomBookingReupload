package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.ContactBean;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ContactServlet", value = "/ContactServlet")
public class ContactServlet extends HttpServlet {

    @Inject
    private ContactBean contactBean;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (name != null && email != null && message != null) {
            contactBean.saveContact(name, email, message);
            request.getRequestDispatcher("/WEB-INF/pages/thankyou.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp?error=All+fields+are+required");
        }
    }
}
