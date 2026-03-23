<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Room">
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Add New Room</h1>
        <!-- Form for adding a new room -->
        <form class="needs-validation" novalidate method="post" action="${pageContext.request.contextPath}/AddRoom" enctype="multipart/form-data">
            <div class="row mb-3">
                <!-- Room title -->
                <div class="col-md-6">
                    <label for="title" class="form-label">Room Title</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                    <div class="invalid-feedback">Please provide a title for the room.</div>
                </div>
                <!-- Room location-->
                <div class="col-md-6">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" required>
                    <div class="invalid-feedback">Please provide the location of the room.</div>
                </div>
            </div>

            <div class="mb-3">
                <!-- Room Description -->
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                <div class="invalid-feedback">Please provide a description of the room.</div>
            </div>

            <div class="row mb-3">
                <!-- Room Price -->
                <div class="col-md-6">
                    <label for="price" class="form-label">Price (per month)</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                    <div class="invalid-feedback">Please provide a price for the room.</div>
                </div>

            <div class="mb-3">
                <!-- User Select for the room -->
                <label for="user_id" class="form-label">Room Owner</label>
                <select class="form-select" id="user_id" name="user_id" required>
                    <c:forEach var="user" items="${users}">
                        <option value="${user.id}">${user.username}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select a user for this room.</div>
            </div>
                <!-- Upload Photo -->
            <div class="mb-3">
                <label for="file" class="form-label">Room Photo</label>
                <input type="file" class="form-control" id="file" name="file" accept="image/">
                <div class="invalid-feedback">Please upload a photo of the room.</div>
            </div>

                <!-- Add Room Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Room</button>
                <a href="${pageContext.request.contextPath}/Rooms" class="btn btn-secondary">Cancel</a>
            </div>
            </div>
        </form>
    </div>

</t:pageTemplate>