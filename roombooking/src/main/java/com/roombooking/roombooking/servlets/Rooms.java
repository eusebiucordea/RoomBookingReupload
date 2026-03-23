package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.RoomDto;
import com.roombooking.roombooking.ejb.RoomBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Rooms", value = "/Rooms")
public class Rooms extends HttpServlet {
    @Inject
    RoomBean roomsBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<RoomDto> rooms = roomsBean.findAllRooms();
        request.setAttribute("rooms",rooms);
        request.setAttribute("activePage","Rooms");
        request.getRequestDispatcher("/WEB-INF/pages/rooms.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] roomIdsAsString = request.getParameterValues("room_ids");
        if (roomIdsAsString != null) {
            List<Long> roomIds = new ArrayList<Long>();
            for(String roomIdAsString : roomIdsAsString) {
                roomIds.add(Long.parseLong(roomIdAsString));
            }
            roomsBean.deleteRoomsByIds(roomIds);
        }
        response.sendRedirect(request.getContextPath() + "/Rooms");

    }
}