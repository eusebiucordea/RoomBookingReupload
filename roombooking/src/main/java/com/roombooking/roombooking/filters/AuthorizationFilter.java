package com.roombooking.roombooking.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        if (path.startsWith("/Users") || path.startsWith("/BookingLogs")) {
            HttpSession session = httpRequest.getSession(false);

            if (session == null || session.getAttribute("username") == null) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login");
                return;
            }

            String userRole = (String) session.getAttribute("userRole");

            if (!"Admin".equals(userRole)) {
                httpRequest.getRequestDispatcher("/WEB-INF/pages/unauthorized.jsp")
                        .forward(request, response);
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}