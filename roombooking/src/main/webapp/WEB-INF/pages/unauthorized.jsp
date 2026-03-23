<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="Unauthorized">
  <div class="container text-center">
    <h1 class="mt-5 text-danger">Access Denied</h1>
    <p class="lead">Sorry, you don't have permission to access this page.</p>
    <a href="${pageContext.request.contextPath}" class="btn btn-primary mt-3">Back to Homepage</a>
  </div>
</t:pageTemplate>