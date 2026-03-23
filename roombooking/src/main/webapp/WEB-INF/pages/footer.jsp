<footer class="bg-light pt-5 pb-3">

  <style>
    .hover-primary:hover {
      color: #5a4fcf !important;
      transition: color 0.3s ease;
    }

    .btn-custom-primary {
      background-color: #5a4fcf;
      border-color: #5a4fcf;
      color: white;
      display: inline-flex;
      align-items: center;
      justify-content: center;
    }

    .btn-custom-primary:hover {
      background-color: #4940b3;
      border-color: #4940b3;
      color: white;
    }

    .text-custom-primary {
      color: #5a4fcf;
    }
  </style>

  <hr class="my-4" style="background-color: #e0e0e0">
  <div class="container">

    <!-- Main Footer Content -->
    <div class="row g-4">
      <!-- Brand Column -->
      <div class="col-lg-4 mb-4">
        <h5 class="fw-bold text-custom-primary mb-4">StudentBnb</h5>
        <p class="text-muted pe-lg-5">The ultimate solution for student housing and private rentals! Making student accommodation search simple and secure.</p>
        <div class="d-flex gap-3 mt-4">
          <a href="#" class="btn btn-sm btn-custom-primary rounded-circle" style="width: 35px; height: 35px;">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="btn btn-sm btn-custom-primary rounded-circle" style="width: 35px; height: 35px;">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="#" class="btn btn-sm btn-custom-primary rounded-circle" style="width: 35px; height: 35px;">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
      </div>

      <!-- Quick Links -->
      <div class="col-lg-2 col-md-6 mb-4">
        <h6 class="fw-bold mb-4">Services</h6>
        <ul class="list-unstyled">
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Student Housing</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Private Rentals</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Accommodation</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Student Deals</a>
          </li>
        </ul>
      </div>

      <!-- Company -->
      <div class="col-lg-2 col-md-6 mb-4">
        <h6 class="fw-bold mb-4">Company</h6>
        <ul class="list-unstyled">
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">About Us</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Terms & Conditions</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Privacy Policy</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-muted text-decoration-none hover-primary">Contact Us</a>
          </li>
        </ul>
      </div>

      <!-- Contact Info -->
      <div class="col-lg-4 col-md-6">
        <h6 class="fw-bold mb-4">Contact Us</h6>
        <div class="text-muted">
          <p class="d-flex align-items-center mb-3">
            <i class="fas fa-map-marker-alt me-3 text-custom-primary"></i>
            Strada Studentilor nr. 12
          </p>
          <p class="d-flex align-items-center mb-3">
            <i class="fas fa-envelope me-3 text-custom-primary"></i>
            studentbnb@gmail.com
          </p>
          <p class="d-flex align-items-center mb-3">
            <i class="fas fa-phone me-3 text-custom-primary"></i>
            + 40 741 122 828
          </p>
        </div>
      </div>
    </div>
    <hr class="my-4" style="background-color: #e0e0e0">
    <!-- Copyright -->
    <div class="row align-items-center">
      <div class="col-md-6 text-center text-md-start">
        <p class="text-muted mb-0">
          &copy; 2025 StudentBnb. All rights reserved.
        </p>
      </div>
      <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
        <img src="${pageContext.request.contextPath}/images/payment.jpg" alt="Payment Methods" height="25">
      </div>
    </div>
  </div>
</footer>