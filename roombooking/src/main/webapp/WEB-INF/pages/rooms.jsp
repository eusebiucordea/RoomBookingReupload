<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    .btn-primary, .btn-danger, .btn-success {
        background-color: #5a4fcf !important;
        border-color: #5a4fcf !important;
    }
    .btn-danger{
        background-color: #DB4949 !important;
        border-color: #DB4949 !important;
    }

    .btn-primary {
        background-color: #5a4fcf;
        border: none;
        color: white;
        padding: 12px 24px;
        text-decoration: none;
        font-size: 16px;
        border-radius: 25px;
        transition: all 0.3s ease;
        display: inline-block;
        margin-top: 20px;
        box-shadow: 0 2px 5px rgba(90, 79, 207, 0.3);
    }

    .btn-primary:hover {
        background-color: #4a41ac;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(90, 79, 207, 0.4);
        text-decoration: none;
        color: white;
    }
</style>

<t:pageTemplate pageTitle="Rooms for rent">
    <div class="col text-center">
        <div class="text-center mb-5">
            <h1 class="display-5 fw-bold" style="color: #5a4fcf">Rooms for rent</h1>
        </div>
        <c:if test="${sessionScope.userRole eq 'Admin' || sessionScope.userRole eq 'Owner'}">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddRoom">Add Room</a>
        </c:if>
    </div>
    <br>
    <div class="container text-center">
        <c:forEach var="room" items="${rooms}" varStatus="status">
            <!-- 3 rooms per row -->
            <c:if test="${status.index % 3 == 0}">
                <div class="row mt-5">
            </c:if>

            <div class="col-md-4">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/RoomPhoto?id=${room.id}" width="414" height="300" alt="${room.title}">
                    <div class="card-body">
                        <h5 class="card-title">${room.title}</h5>
                        <p class="card-text">Location : ${room.location}</p>
                        <p class="card-text">${room.description}</p>
                        <h5 class="card-title">Price</h5>
                        <p class="card-text">${room.price} RON/month</p>
                        <c:choose>
                            <c:when test="${room.available}">
                                <p class="card-text text-success">Room Available</p>
                                <!-- Students and Admins can Book rooms -->
                                <c:if test="${sessionScope.userRole eq 'Student' || sessionScope.userRole eq 'Admin'}">
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/Book?id=${room.id}">Book</a>
                                </c:if>
                                <!-- Owners should log in as Students to Book a room -->
                                <c:if test="${sessionScope.userRole ne 'Student' && sessionScope.userRole ne 'Admin'}">
                                    <button class="btn btn-success" disabled>Login as Student to Book</button>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <p class="card-text text-danger">Room Not Available</p>  <!-- If Room is already Booked -->
                                <button class="btn btn-success" disabled>Booked</button>
                            </c:otherwise>
                        </c:choose>

                        <!-- Owners and Admins can Edit rooms -->
                        <c:if test="${sessionScope.userRole eq 'Admin' || sessionScope.userRole eq 'Owner'}">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditRoom?id=${room.id}">Edit Room</a>
                        </c:if>
                        <!-- Only Admins can Delete a room -->
                        <c:if test="${sessionScope.userRole eq 'Admin'}">
                            <form method="post" action="${pageContext.request.contextPath}/Rooms" style="display:inline;">
                                <input type="hidden" name="room_ids" value="${room.id}">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this room?');">
                                    Delete
                                </button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${status.index % 3 == 2 || status.last}">
                </div>
            </c:if>
        </c:forEach>
    </div>
    <br>
</t:pageTemplate>