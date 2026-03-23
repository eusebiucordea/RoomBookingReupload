package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.UserDto;
import com.roombooking.roombooking.ejb.BookingBean;
import com.roombooking.roombooking.ejb.RoomBean;
import com.roombooking.roombooking.ejb.UserBean;
import com.roombooking.roombooking.entities.Booking;
import com.roombooking.roombooking.entities.Room;
import com.roombooking.roombooking.entities.User;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import java.io.IOException;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Book", value = "/Book")
public class Book extends HttpServlet {

    @Inject
    BookingBean bookingBean;

    @Inject
    UserBean userBean;

    @Override
    @Transactional
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserDto> users = userBean.findApprovedUsers();
        request.setAttribute("users", users);
        String roomId = request.getParameter("id");

        // Get username from session
        String username = (String) request.getSession().getAttribute("username");

        if (roomId != null && !roomId.isEmpty() && username != null) {
            bookingBean.createBooking(Long.parseLong(roomId), username);
            request.setAttribute("activePage","Book");
            request.getRequestDispatcher("/WEB-INF/pages/book.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Login");
        }





    }
}
