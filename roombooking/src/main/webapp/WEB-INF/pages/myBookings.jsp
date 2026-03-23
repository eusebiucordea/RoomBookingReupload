<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="My Bookings">

    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold" style="color: #5a4fcf">My Bookings</h1>
    </div>

    <div class="container text-center">
        <c:choose>
        <c:when test="${empty rooms}">
            <div class="alert alert-info" role="alert">
                You currently have no bookings. Browse our available rooms to make a reservation.
            </div>
        </c:when>
        <c:otherwise>
        <c:forEach var="room" items="${rooms}" varStatus="status">
            <!-- 3 rooms per row -->
            <c:if test="${status.index % 3 == 0}">
                <div class="row mt-5">
            </c:if>

            <div class="col-md-4">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/RoomPhoto?id=${room.id}"
                         width="414" height="300" alt="${room.title}">
                    <div class="card-body">
                        <h5 class="card-title">${room.title}</h5>
                        <p class="card-text">Location: ${room.location}</p>
                        <p class="card-text">${room.description}</p>
                        <h5 class="card-title">Price</h5>
                        <p class="card-text">${room.price} RON/month</p>
                        <a class="btn" href="${pageContext.request.contextPath}/Receipt?roomId=${room.id}"
                           style="background-color: #5a4fcf; color: white;">View Receipt</a>
                    </div>
                </div>
            </div>

            <c:if test="${status.index % 3 == 2 || status.last}">
                </div>
            </c:if>
        </c:forEach>
        </c:otherwise>
        </c:choose>
    </div>
</t:pageTemplate>