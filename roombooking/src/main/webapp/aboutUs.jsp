<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="About Us">
  <style>
    .text-custom-primary {
      color: #5a4fcf;
    }
    .card {
      border-radius: 15px;
      transition: all 0.3s ease;
      background-color: white;
      border: 1px solid grey;
      box-shadow: 0 4px 6px rgba(90, 79, 207, 0.1);
    }
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(90, 79, 207, 0.2) !important;
    }
    .mission-image {
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(90, 79, 207, 0.1);
    }
    .who-we-serve-section {
      background-color: #f8f9fa;
      padding: 3rem 0;
      margin: 2rem 0;
      border-radius: 20px;
    }
    .core-values-section {
      background-color: #eef0ff;
      padding: 3rem 0;
      margin: 2rem 0;
      border-radius: 20px;
    }

    .mission-image{
      padding-left: 75px;
    }
  </style>

  <!-- Hero Section -->
  <div class="container">
    <div class="text-center py-5 bg-light rounded-3 shadow-sm mb-5">
      <h1 class="display-4 fw-bold text-custom-primary mb-3">About StudentBnb</h1>
      <p class="lead mb-2">The ultimate solution for student housing and private rentals!</p>
      <div class="row justify-content-center">
        <div class="col-md-8">
          <p class="text-muted">Connecting students with their perfect homes while providing homeowners with reliable tenants.</p>
        </div>
      </div>
    </div>

    <!-- Mission Section -->
    <div class="row align-items-center mb-5 py-5">
      <div class="col-md-6 pe-md-5">
        <h2 class="fw-bold text-custom-primary mb-4">Our Mission</h2>
        <p class="lead text-muted">At StudentBnb, our mission is to simplify the housing process for students and homeowners alike.</p>
        <p class="text-muted">Whether you're a student seeking affordable accommodation or a homeowner looking to list your property, we're here to connect you seamlessly with the perfect match.</p>
      </div>
      <div class="col-md-6">
        <img src="images/mission.jpeg" alt="Our Mission" class="img-fluid mission-image">
      </div>
    </div>

    <!-- Team Section -->
    <div class="row align-items-center mb-5 py-5">
      <div class="col-md-6 order-md-2 ps-md-5">
        <h2 class="fw-bold text-custom-primary mb-4">Our Team</h2>
        <p class="lead text-muted">A passionate group of innovators dedicated to transforming student housing.</p>
        <p class="text-muted">We are developers and designers committed to creating a user-friendly platform. Our team prioritizes accessibility, efficiency, and transparency in every feature we build.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src="images/team.jpg" alt="Our Team" class="img-fluid mission-image">
      </div>
    </div>

    <!-- Who We Serve Section -->
    <div class="who-we-serve-section">
      <div class="container">
        <h2 class="text-center fw-bold text-custom-primary mb-5">Who We Serve</h2>
        <div class="row g-4">
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-user-graduate fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">For Students</h4>
                <p class="text-muted">Access a wide range of accommodations and enjoy special discounts based on academic performance.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-home fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">For Homeowners</h4>
                <p class="text-muted">Advertise your rooms and houses, manage bookings, and connect with students directly through our platform.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-users-cog fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">For Administrators</h4>
                <p class="text-muted">Effortlessly manage student accounts, approve bookings, and oversee housing availability.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Core Values Section -->
    <div class="core-values-section">
      <div class="container">
        <div class="text-center mb-5">
          <h2 class="fw-bold text-custom-primary">Our Core Values</h2>
          <p class="text-muted">The principles that guide everything we do</p>
        </div>
        <div class="row g-4">
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-heart fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">Customer Focus</h4>
                <p class="text-muted">We prioritize the needs and satisfaction of our customers above all else.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-shield-alt fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">Reliability</h4>
                <p class="text-muted">Our platform is built with trust, ensuring users can rely on us for their housing needs.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card h-100">
              <div class="card-body p-4 text-center">
                <div class="mb-4">
                  <i class="fas fa-lightbulb fs-1 text-custom-primary"></i>
                </div>
                <h4 class="fw-bold mb-3">Innovation</h4>
                <p class="text-muted">We are committed to continuous improvement and introducing new, efficient solutions.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</t:pageTemplate>