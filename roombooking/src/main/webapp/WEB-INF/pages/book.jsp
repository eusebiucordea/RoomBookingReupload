<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Room Booking">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header text-white" style="background-color: #5a4fcf">
                        <h1 class="mb-0 text-center fs-3">Room Booking Details</h1>
                    </div>

                    <!-- Choose number of students-->
                    <div class="card-body p-5">
                        <form method="post">
                            <div class="row mb-4">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <select class="form-select" id="numberOfStudents" name="numberOfStudents" required>
                                            <option value="" selected disabled>Choose...</option>
                                            <option value="1">1 </option>
                                            <option value="2">2 </option>
                                            <option value="3">3 </option>
                                            <option value="4">4 </option>
                                        </select>
                                        <label for="numberOfStudents">Number of Students</label>
                                    </div>
                                </div>

                                <!-- Start Date-->
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                                        <label for="startDate">Start Date</label>
                                    </div>
                                </div>

                                <!-- End Date-->
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                                        <label for="endDate">End Date</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Email field -->
                            <div id="emailFields" class="mb-4"></div>

                            <div class="alert alert-info mb-4" style="background-color: #f3e5f5; color: #5a4fcf; border-color: #5a4fcf;">
                                <i class="bi bi-info-circle-fill me-2"></i>
                                Your booking will be confirmed after successful payment
                            </div>

                            <!-- Start Payment button / Cancel button-->
                            <div class="d-flex justify-content-end gap-2">
                                <a href="${pageContext.request.contextPath}/Rooms" class="btn btn-light">Cancel</a>
                                <a type="submit" class="btn text-white" style="background-color: #5a4fcf" href="${pageContext.request.contextPath}/Payment">
                                    <i class="bi bi-credit-card me-2"></i>Start Payment
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const startDateInput = document.getElementById('startDate');
            const endDateInput = document.getElementById('endDate');
            const numberOfStudentsSelect = document.getElementById('numberOfStudents');
            const emailFieldsContainer = document.getElementById('emailFields');

            startDateInput.min = new Date().toISOString().split('T')[0];

            startDateInput.addEventListener('change', function() {
                endDateInput.value = '';
                endDateInput.min = startDateInput.value;
            });

            numberOfStudentsSelect.addEventListener('change', function() {
                const count = parseInt(numberOfStudentsSelect.value) || 0;
                emailFieldsContainer.innerHTML = ''; // Șterge emailurile existente

                for (let i = 1; i <= count; i++) {
                    const div = document.createElement('div');
                    div.classList.add('form-floating', 'mb-3');

                    const input = document.createElement('input');
                    input.type = 'email';
                    input.classList.add('form-control');
                    input.id = 'email' + i;
                    input.name = 'studentEmail' + i;
                    input.placeholder = 'Email Student ' + i;
                    input.required = true;

                    const label = document.createElement('label');
                    label.setAttribute('for', input.id);
                    label.textContent = 'Email Student ' + i;

                    div.appendChild(input);
                    div.appendChild(label);
                    emailFieldsContainer.appendChild(div);
                }
            });
        });
    </script>
</t:pageTemplate>
