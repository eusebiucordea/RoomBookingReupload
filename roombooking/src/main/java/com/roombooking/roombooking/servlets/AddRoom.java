package com.roombooking.roombooking.servlets;

import com.roombooking.roombooking.common.RoomPhotoDto;
import com.roombooking.roombooking.common.UserDto;
import com.roombooking.roombooking.ejb.RoomBean;
import com.roombooking.roombooking.ejb.UserBean;
import com.roombooking.roombooking.entities.RoomPhoto;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(name="AddRoom", value="/AddRoom")

public class AddRoom extends HttpServlet {

    @Inject
    UserBean userBean;
    @Inject
    RoomBean roomBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<UserDto> users=userBean.findApprovedUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/pages/addRoom.jsp").forward(request, response);
    }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            Long userId = Long.parseLong(request.getParameter("user_id"));
            String location = request.getParameter("location");
            float price = Float.parseFloat(request.getParameter("price"));
            Part photoPart = request.getPart("file");

            RoomPhotoDto roomPhotoDto = null;
            if (photoPart != null && photoPart.getSize() > 0) {
                String fileName = photoPart.getSubmittedFileName();
                String fileType = photoPart.getContentType();
                byte[] fileContent = photoPart.getInputStream().readAllBytes();
                photoPart.getInputStream().read(fileContent);
                roomPhotoDto = new RoomPhotoDto(null, fileName, fileType, fileContent, null);
            }

            roomBean.createRoom(title, description, location, price, true, userId, roomPhotoDto);
            response.sendRedirect(request.getContextPath() + "/Rooms");
        }
}
