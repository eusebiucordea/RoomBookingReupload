package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.ejb.BookingBean;
import com.roombooking.roombooking.entities.Booking;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Receipt", value = "/Receipt")
public class Receipt extends HttpServlet {
    @Inject
    BookingBean bookingBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId = request.getParameter("roomId");
        String username = (String) request.getSession().getAttribute("username");

        if (roomId != null && username != null) {
            Booking booking = bookingBean.findBookingByRoomAndUsername(Long.parseLong(roomId), username);
            if (booking != null) {
                request.setAttribute("booking", booking);
                request.setAttribute("activePage", "Receipt");
                request.getRequestDispatcher("/WEB-INF/pages/receipt.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/MyBookings");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
    }
}