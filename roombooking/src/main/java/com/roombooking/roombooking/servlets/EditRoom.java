package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.RoomDto;
import com.roombooking.roombooking.common.UserDto;
import com.roombooking.roombooking.ejb.RoomBean;
import com.roombooking.roombooking.ejb.UserBean;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditRoom", value = "/EditRoom")
public class EditRoom extends HttpServlet {
    @Inject
    RoomBean roomBean;

    @Inject
    UserBean userBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<UserDto> users = userBean.findApprovedUsers();
        request.setAttribute("users", users);

        Long roomId = Long.parseLong(request.getParameter("id"));
        RoomDto room = roomBean.findRoomById(roomId);
        request.setAttribute("room", room);

        request.getRequestDispatcher("/WEB-INF/pages/editRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        float price = Float.parseFloat(request.getParameter("price"));
        boolean available = Boolean.parseBoolean(request.getParameter("available"));
        Long userId = Long.parseLong(request.getParameter("user_id"));
        Long roomId = Long.parseLong(request.getParameter("room_id"));


        roomBean.updateRoom(roomId, title, description,location, price, available, userId);
        response.sendRedirect(request.getContextPath() + "/Rooms");
    }
}
