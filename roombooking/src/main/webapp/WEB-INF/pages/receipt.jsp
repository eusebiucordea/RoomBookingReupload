<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:pageTemplate pageTitle="Booking Receipt">
  <div class="container my-5">
    <div class="text-center mb-5">
      <h1 class="display-5 fw-bold" style="color: #5a4fcf">Booking Receipt</h1>
      <p class="text-muted">Generated on ${java.time.LocalDate.now()}</p>
    </div>

    <div id="receiptContent" class="card border-0 shadow-lg">
      <div class="card-header text-white text-center py-4" style="background-color: #5a4fcf">
        <h3 class="mb-0">Room Booking Details</h3>
      </div>

      <div class="card-body p-5">
        <!-- Booking Reference -->
        <div class="text-center mb-4">
          <span class="badge bg-light text-dark px-4 py-2 fs-6">
            Booking Reference: #${booking.id}
          </span>
        </div>

        <!-- Room Details -->
        <div class="row">
          <div class="col-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <tbody>
                <tr>
                  <th class="w-25 text-secondary">Room Title</th>
                  <td class="fw-bold">${booking.room.title}</td>
                </tr>
                <tr>
                  <th class="text-secondary">Location</th>
                  <td>${booking.room.location}</td>
                </tr>
                <tr>
                  <th class="text-secondary">Description</th>
                  <td>${booking.room.description}</td>
                </tr>
                <tr class="table-light">
                  <th class="text-secondary">Price (per month)</th>
                  <td class="fw-bold fs-5">RON${booking.room.price}</td>
                </tr>
                <tr>
                  <th class="text-secondary">Room Owner</th>
                  <td>${booking.room.user.username}</td>
                </tr>
                <tr>
                  <th class="text-secondary">Booked By</th>
                  <td>${booking.user.username}</td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Terms & Contact -->
        <div class="mt-5 pt-4 border-top">
          <div class="row">
            <div class="col-md-6">
              <h6 class="text-secondary">Terms & Conditions</h6>
              <p class="small text-muted">
                Please refer to our terms of service for cancellation and refund policies.
              </p>
            </div>
            <div class="col-md-6 text-md-end">
              <h6 class="text-secondary">Need Help?</h6>
              <p class="small text-muted">
                Contact us at studentbnb@gmail.com
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- Receipt Footer -->
      <div class="card-footer bg-light text-center py-3">
        <small class="text-muted">Thank you for choosing our service!</small>
      </div>
    </div>

    <!-- Action Buttons -->
    <div class="text-center mt-5">
      <button class="btn btn-lg me-3 px-4" style="background-color: #5a4fcf; color: white;" onclick="printReceipt()">
        <i class="bi bi-printer me-2"></i>Print Receipt
      </button>
      <a href="${pageContext.request.contextPath}/MyBookings" class="btn btn-outline-secondary btn-lg px-4">
        <i class="bi bi-arrow-left-circle me-2"></i>Back to Bookings
      </a>
    </div>
  </div>

  <script>
    function printReceipt() {
      const printContent = document.getElementById('receiptContent').innerHTML;
      const originalContent = document.body.innerHTML;

      // Create a print-specific stylesheet
      const style = document.createElement('style');
      style.innerHTML = `
        @media print {
          body { padding: 20px; }
          .card { border: none !important; }
          .card-header { background-color: #f8f9fa !important; color: #000 !important; }
          .badge { border: 1px solid #dee2e6 !important; }
          .table td, .table th { padding: 12px !important; }
        }
      `;

      document.head.appendChild(style);
      document.body.innerHTML = printContent;
      window.print();
      document.body.innerHTML = originalContent;
    }
  </script>
</t:pageTemplate>