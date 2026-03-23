<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Edit Room">
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Edit Room</h1>
        <form class="needs-validation" novalidate method="post" action="${pageContext.request.contextPath}/EditRoom">
            <div class="row mb-3">
                <!-- Room Title-->
                <div class="col-md-6">
                    <label for="title" class="form-label">Room Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="${room.title}" required>
                    <div class="invalid-feedback">Please provide a title for the room.</div>
                </div>

                <!-- Room Location-->
                <div class="col-md-6">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" value="${room.location}" required>
                    <div class="invalid-feedback">Please provide the location of the room.</div>
                </div>
            </div>

            <!-- Room Description-->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <input class="form-control" id="description" name="description" rows="3" value="${room.description}" required>
                <div class="invalid-feedback">Please provide a description of the room.</div>
            </div>

            <!-- Room Price-->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="price" class="form-label">Price (per month)</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" value="${room.price}" required>
                    <div class="invalid-feedback">Please provide a price for the room.</div>
                </div>

                <!-- Availability-->
                <div class="col-md-6">
                    <label for="available" class="form-label">Availability</label>
                    <select class="form-select" id="available" name="available" required>
                        <option value="" selected disabled>Choose...</option>
                        <option value="true">Available</option>
                        <option value="false">Not Available</option>
                    </select>
                    <div class="invalid-feedback">Please select the availability status.</div>
                </div>
            </div>
                <!-- Room Owner-->
                <div class="mb-3">
                    <label for="user_id" class="form-label">Room Owner</label>
                    <select class="form-select" id="user_id" name="user_id" required>
                        <c:forEach var="user" items="${users}">
                            <option value="${user.id}"${room.user eq user.username ? 'selected' : ''}>${user.username}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">Please select a owner for this room.</div>
                </div>

                    <!-- Save / Cancel -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="${pageContext.request.contextPath}/Rooms" class="btn btn-secondary">Cancel</a>
                </div>
            <input type="hidden" name="room_id" value="${room.id}" />
        </form>
    </div>
    <br>
</t:pageTemplate>