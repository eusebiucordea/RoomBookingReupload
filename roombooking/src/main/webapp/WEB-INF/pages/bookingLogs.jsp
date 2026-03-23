<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Booking Logs">
    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold" style="color: #5a4fcf">Booking Logs</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Location</th>
                            <th scope="col">Price (RON/month)</th>
                            <th scope="col">Owner</th>
                            <th scope="col">Booked By</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.title}</td>
                                <td>${booking.location}</td>
                                <td>${booking.price}</td>
                                <td>${booking.ownerUsername}</td>
                                <td>${booking.bookingUsername}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</t:pageTemplate>