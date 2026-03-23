<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:pageTemplate pageTitle="Login">
    <section class="h-100 gradient-form" style="background-color: white;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-5">
                    <div class="card rounded-0 text-black">
                        <div class="col-lg-12">
                            <div class="card-body p-md-5 mx-md-4">
                                <!-- Logo -->
                                <div class="text-center">
                                    <img src="images/logoStudentBnb.png" style="width: 200px;" alt="logo">
                                </div>

                                <c:if test="${not empty message}">
                                    <div class="alert alert-danger" role="alert">
                                            ${message}
                                    </div>
                                </c:if>

                                <form class="form-signing" method="POST" action="${pageContext.request.contextPath}/Login">
                                    <p>Please login to your account</p>
                                    <!-- Username-->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="username">Username</label>
                                        <input type="text" id="username" name="j_username" class="form-control"
                                               placeholder="Username" required />
                                    </div>
                                    <!--Password -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="password">Password</label>
                                        <input type="password" id="password" name="j_password" class="form-control"
                                               placeholder="Password" required/>
                                    </div>
                                    <!-- Login Button -->
                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button class="btn btn-lg btn-primary btn-block" type="submit"><b>Login</b></button>
                                    </div>
                                    <!--Register Button -->
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Don't have an account?</p>
                                        <a type="button" class="btn btn-outline-danger"
                                           href="${pageContext.request.contextPath}/Register"><b>Create new</b></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</t:pageTemplate>