<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:pageTemplate pageTitle="Register">
    <section class="h-100 gradient-form" style="background-color: white;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-5">
                    <div class="card rounded-0 text-black">
                        <div class="col-lg-12">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <img src="images/logoStudentBnb.png"
                                         style="width: 200px;" alt="logo">
                                </div>
                                <form action="${pageContext.request.contextPath}/Register" method="post">
                                    <p>Create a new account</p>

                                    <!-- Role Selection -->
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="registerRole">Role</label>
                                        <select id="registerRole" name="registerRole" class="form-control" required>
                                            <option value="" selected disabled>Choose...</option>
                                            <option value="Student">Student</option>
                                            <option value="Owner">Owner</option>
                                        </select>
                                    </div>

                                    <!-- Username -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="registerUsername">Username</label>
                                        <input type="text" id="registerUsername" name="registerUsername"
                                               class="form-control" placeholder="Enter your username" required />
                                    </div>

                                    <!-- Email -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="registerEmail">Email</label>
                                        <input type="email" id="registerEmail" name="registerEmail"
                                               class="form-control" placeholder="Enter your email address" required />
                                    </div>

                                    <!-- Password -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="registerPassword">Password</label>
                                        <input type="password" id="registerPassword" name="registerPassword"
                                               class="form-control" placeholder="Enter your password" required />
                                    </div>

                                    <!-- Phone -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="registerPhone">Phone</label>
                                        <input type="text" id="registerPhone" name="registerPhone"
                                               class="form-control" placeholder="Enter your phone number" required />
                                    </div>

                                    <!-- Register Button -->
                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button data-mdb-button-init data-mdb-ripple-init
                                                class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
                                                type="submit"><b>Register</b></button>
                                    </div>

                                    <!-- Redirect to Login -->
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Already have an account?</p>
                                        <a type="button" data-mdb-button-init data-mdb-ripple-init
                                           class="btn btn-outline-danger"
                                           href="${pageContext.request.contextPath}/Login"><b>Log in</b></a>
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
