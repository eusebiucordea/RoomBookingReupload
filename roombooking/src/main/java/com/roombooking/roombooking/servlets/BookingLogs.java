package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.BookingLogsDto;
import com.roombooking.roombooking.ejb.BookingLogsBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookingLogs", value = "/BookingLogs")
public class BookingLogs extends HttpServlet {
    @Inject
    BookingLogsBean bookingLogsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BookingLogsDto> bookings = bookingLogsBean.findAllBookingLogs();
        request.setAttribute("bookings", bookings);
        request.setAttribute("activePage", "BookingLogs");
        request.getRequestDispatcher("/WEB-INF/pages/bookingLogs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long roomId = Long.parseLong(request.getParameter("room_id"));
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("user_id");

        bookingLogsBean.createBookingLog(roomId, userId);
        response.sendRedirect(request.getContextPath() + "/BookingLogs");
    }
}