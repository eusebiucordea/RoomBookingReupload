package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.RoomPhotoDto;
import com.roombooking.roombooking.ejb.RoomBean;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RoomPhotos", value = "/RoomPhoto")
public class RoomPhotos extends HttpServlet {

    @Inject
    RoomBean roomBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomIdParam = request.getParameter("id");
        if (roomIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing room ID");
            return;
        }

        Long roomId = Long.parseLong(roomIdParam);
        RoomPhotoDto roomPhoto = roomBean.findRoomPhotoByRoomId(roomId);

        if (roomPhoto == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No photo found for room ID " + roomId);
            return;
        }

        response.setContentType(roomPhoto.getFileType());
        response.getOutputStream().write(roomPhoto.getFileContent());
    }
}
