<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="StudentBnb">
    <style>
        :root {
            --custom-primary: #5a4fcf;
        }
        .hover-shadow {
            transition: all 0.3s ease;
        }
        .hover-shadow:hover {
            transform: translateY(-5px);
        }
        .bg-custom-primary {
            background-color: #5a4fcf;
        }
        .text-custom-primary {
            color: #5a4fcf;
        }
        .btn-custom-primary {
            background-color: #5a4fcf;
            border: none;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 17px;
            box-shadow: 0 2px 5px rgba(90, 79, 207, 0.3);
        }

        .btn-custom-primary:hover {
            background-color: #4a41ac;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(90, 79, 207, 0.4);
            text-decoration: none;
            color: white;
        }
    </style>

    <div class="container">
        <!-- Hero Section -->
        <div class="text-center py-5 bg-light rounded-3 shadow-sm mb-5">
            <h1 class="display-4 fw-bold text-custom-primary mb-3">Welcome To StudentBnb</h1>
            <p class="lead mb-2">Find Your Perfect Student Home</p>
            <p class="text-muted">Search from hundreds of student accommodations near your university.</p>

        <!-- Why Choose StudentBnb? -->
        <div class="py-5">
            <h2 class="text-center fw-bold mb-5">Why Choose StudentBnb?</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm hover-shadow transition">
                        <div class="card-body text-center p-4">
                            <img src="images/safe.png" class="mb-4" width="80" alt="Safe">
                            <h4 class="fw-bold mb-3">Safe & Verified Listings</h4>
                            <p class="text-muted">All accommodations are verified to ensure safety and security.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm hover-shadow transition">
                        <div class="card-body text-center p-4">
                            <img src="images/affordable.png" class="mb-4" width="80" alt="Affordable">
                            <h4 class="fw-bold mb-3">Affordable Prices</h4>
                            <p class="text-muted">Find budget-friendly options with flexible rental terms.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm hover-shadow transition">
                        <div class="card-body text-center p-4">
                            <img src="images/support.png" class="mb-4" width="80" alt="Support">
                            <h4 class="fw-bold mb-3">24/7 Support</h4>
                            <p class="text-muted">Need help? Our team is here to assist you at any time.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col">
                <hr class="my-0" style="border-top: 2px solid #6b6b7b;">
            </div>
        </div>

        <!-- Latest News & Updates -->
        <div class="py-5 bg-light rounded-3">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <h2 class="text-center fw-bold mb-4">Latest News & Updates</h2>
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <span class="badge bg-custom-primary p-2">UPCOMING</span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="fw-bold mb-1">Student Discount Offers</h5>
                                    <p class="text-muted mb-0">Special discounts available for students with excellent academic performance.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col">
                <hr class="my-0" style="border-top: 2px solid #6b6b7b;">
            </div>
        </div>

        <!-- Student Testimonials -->
        <div class="py-5">
            <h2 class="text-center fw-bold mb-5">What Students Say</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex flex-column align-items-center text-center">
                                <div class="mb-3">
                                    <i class="fas fa-quote-left fs-1 text-custom-primary"></i>
                                </div>
                                <p class="mb-4">"I found my perfect student home within minutes! Thank you, StudentBnb!"</p>
                                <strong class="text-custom-primary">– Bianca</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex flex-column align-items-center text-center">
                                <div class="mb-3">
                                    <i class="fas fa-quote-left fs-1 text-custom-primary"></i>
                                </div>
                                <p class="mb-4">"Affordable, safe, and super easy to use. Highly recommend!"</p>
                                <strong class="text-custom-primary">– Eusebiu</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex flex-column align-items-center text-center">
                                <div class="mb-3">
                                    <i class="fas fa-quote-left fs-1 text-custom-primary"></i>
                                </div>
                                <p class="mb-4">"The best way to find student accommodations. Smooth experience."</p>
                                <strong class="text-custom-primary">– Stefania</strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Section -->
        <div class="py-5 bg-custom-primary text-white rounded-3">
            <div class="row g-4 text-center">
                <div class="col-md-3">
                    <h2 class="display-4 fw-bold mb-0">10,000+</h2>
                    <p class="mb-0">Students helped</p>
                </div>
                <div class="col-md-3">
                    <h2 class="display-4 fw-bold mb-0">5,000+</h2>
                    <p class="mb-0">Verified Listings</p>
                </div>
                <div class="col-md-3">
                    <h2 class="display-4 fw-bold mb-0">50+</h2>
                    <p class="mb-0">Partner Universities</p>
                </div>
                <div class="col-md-3">
                    <h2 class="display-4 fw-bold mb-0">4.8⭐</h2>
                    <p class="mb-0">Average Rating</p>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="py-5">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-5">
                            <h2 class="text-center fw-bold mb-4">📩 Contact Us</h2>
                            <p class="text-center text-muted mb-4">If you have any questions, feel free to reach out to us.</p>
                            <form action="ContactServlet" method="post">
                                <div class="mb-3">
                                    <input type="text" class="form-control form-control-lg" name="name" placeholder="Your Name" required>
                                </div>
                                <div class="mb-3">
                                    <input type="email" class="form-control form-control-lg" name="email" placeholder="Your Email" required>
                                </div>
                                <div class="mb-3">
                                    <textarea class="form-control form-control-lg" name="message" rows="3" placeholder="Your Message" required></textarea>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-custom-primary btn-lg px-5">Send Message</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:pageTemplate>