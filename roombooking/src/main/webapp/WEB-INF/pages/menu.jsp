<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">

<header>
  <style>
    .brand-font {
      font-family: 'Poppins', sans-serif;
      font-size: 1.5rem;
      color: white;
    }
    .nav-item{
      color: white; !important;
    }
    .nav-link{
      color: white; !important;
    }

  </style>

  <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #5a4fcf;">
    <div class="container-fluid">
      <a class="navbar-brand brand-font" href="${pageContext.request.contextPath}"><b>StudentBnb</b></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <!-- Everyone that authenticate can access this pages -->
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/aboutUs.jsp"><b>About</b></a>
          </li>
          <c:if test="${sessionScope.username != null}">
            <li class="nav-item">
              <a class="nav-link" ${activePage eq 'Rooms' ? ' active' : ''}
                 aria-current="page" href="${pageContext.request.contextPath}/Rooms"><b>Rooms</b>
              </a>
            </li>

            <c:if test="${sessionScope.userRole ne 'Owner'}"> <!--Hide for Owner -->
              <li class="nav-item">
                <a class="nav-link" ${activePage eq 'MyBookings' ? ' active' : ''}
                   aria-current="page" href="${pageContext.request.contextPath}/MyBookings"><b>My Bookings</b>
                </a>
              </li>
            </c:if>

            <!-- Only admins can access this pages -->
            <c:if test="${sessionScope.userRole eq 'Admin'}">
              <li class="nav-item">
                <a class="nav-link" ${activePage eq 'Users' ? ' active' : ''}
                   aria-current="page" href="${pageContext.request.contextPath}/Users"><b>Users</b>
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" ${activePage eq 'BookingLogs' ? ' active' : ''}
                   aria-current="page" href="${pageContext.request.contextPath}/BookingLogs"><b>BookingLogs</b>
                </a>
              </li>
            </c:if>
          </c:if>
        </ul>

        <ul class="navbar-nav">
          <li class="nav-item">
            <c:choose>
            <c:when test="${sessionScope.username == null}">
            <a class="nav-link" href="${pageContext.request.contextPath}/Login"><b>Login</b></a>
            </c:when>
            <c:otherwise>
          <li class="nav-item">
            <span class="nav-link"><b>Hello, ${sessionScope.username}</b></span>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/Logout"><b>Logout</b></a>
          </li>
          </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>
</header>
