<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">

    <style>
        .titlu{
            margin-bottom: 50px;
        }
    </style>
    <div class="col text-center">
    </div>
    <!-- Pending Users Section -->
    <div class="container text-center">
        <div class="titlu">
            <h2>Pending Users</h2>
        </div>
        <div class="row">
            <div class="col"><h5>Username</h5></div>
            <div class="col"><h5>Email</h5></div>
            <div class="col"><h5>Phone</h5></div>
            <div class="col"><h5>Role</h5></div>
            <div class="col"><h5>Actions</h5></div>
        </div>
        <div class="row my-2">
            <div class="col">
                <hr class="my-4" style="border-top: 1px solid #6b6b7b;">
            </div>
        </div>
        <c:forEach var="user" items="${pendingUsers}">
            <div class="row align-items-center">
                <div class="col">${user.username}</div>
                <div class="col">${user.email}</div>
                <div class="col">${user.phone}</div>
                <div class="col">${user.role}</div>
                <div class="col">
                    <!-- Approve Button -->
                    <form action="approveUser" method="post" style="display:inline;">
                        <input type="hidden" name="userId" value="${user.id}" />
                        <button type="submit" class="btn btn-success btn-sm">APPROVE</button>
                    </form>
                    <!-- Delete Button -->
                    <c:if test="${user.username != 'admin'}"> <!-- If you are an admin your account cannot be deleted -->
                        <form action="deleteUser" method="post" style="display:inline;">
                            <input type="hidden" name="userId" value="${user.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">DELETE</button>
                        </form>
                    </c:if>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <hr class="my-4" style="border-top: 1px solid #6b6b7b;">
                </div>
            </div>
        </c:forEach>
    </div>

    <br><hr><br>

    <!-- Approved Users Section -->
    <div class="container text-center">
        <div class="titlu">
            <h2>Approved Users</h2>
        </div>
        <div class="row">
            <div class="col"><h5>Username</h5></div>
            <div class="col"><h5>Email</h5></div>
            <div class="col"><h5>Phone</h5></div>
            <div class="col"><h5>Role</h5></div>
            <div class="col"><h5>Actions</h5></div>
        </div>
        <div class="row my-2">
            <div class="col">
                <hr class="my-4" style="border-top: 1px solid #6b6b7b;">
            </div>
        </div>
        <c:forEach var="user" items="${approvedUsers}">
            <div class="row align-items-center">
                <div class="col">${user.username}</div>
                <div class="col">${user.email}</div>
                <div class="col">${user.phone}</div>
                <div class="col">${user.role}</div>
                <div class="col">
                    <!-- Delete Button -->
                    <c:if test="${user.username != 'admin'}">
                        <form action="deleteUser" method="post" style="display:inline;">
                            <input type="hidden" name="userId" value="${user.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">DELETE</button>
                        </form>
                    </c:if>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <hr class="my-4" style="border-top: 1px solid #6b6b7b;">
                </div>
            </div>
        </c:forEach>
    </div>
</t:pageTemplate>