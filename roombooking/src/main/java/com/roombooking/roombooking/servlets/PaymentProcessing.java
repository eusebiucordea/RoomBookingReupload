package com.roombooking.roombooking.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PaymentProcessing", value = "/PaymentProcessing")
public class PaymentProcessing extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        request.setAttribute("activePage","PaymentProcessing");
        request.getRequestDispatcher("/WEB-INF/pages/paymentprocessing.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
    }
}