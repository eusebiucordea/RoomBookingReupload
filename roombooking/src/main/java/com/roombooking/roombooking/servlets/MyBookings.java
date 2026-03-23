package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.BookingBean;
import com.roombooking.roombooking.entities.Room;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyBookings", value = "/MyBookings")
public class MyBookings extends HttpServlet {
    @Inject
    BookingBean bookingBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        if (username != null) {
            List<Room> bookedRooms = bookingBean.findBookedRoomsByUsername(username);
            request.setAttribute("rooms", bookedRooms);
            request.setAttribute("activePage", "MyBookings");
            request.getRequestDispatcher("/WEB-INF/pages/myBookings.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
    }
}