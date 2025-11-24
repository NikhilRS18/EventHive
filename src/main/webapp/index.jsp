<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EventHive | Welcome</title>

<%@include file="component/allcss.jsp" %>

<style>
:root {
    --primary-color: #ff9800;
    --secondary-color: #ff5722;
    --dark-color: #212121;
    --light-color: #f5f5f5;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--light-color);
    color: #444;
    margin: 0;
}

/* HERO SECTION WITH VIDEO + SLIDESHOW */
.hero-section {
    height: 85vh;
    width: 100%;
    position: relative;
    overflow: hidden;
}
.navbar-brand img:hover {
    filter: drop-shadow(0 0 8px rgba(0, 0, 150, 0.6));
    transform: scale(1.05);
    transition: 0.3s;
}
/* Background Video */
.hero-video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    filter: brightness(0.65);
}

/* Slideshow Images */
.slide-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    z-index: 2;
    animation: slideShow 18s infinite;
}

/* Delay for each slide */
.slide-img:nth-child(2) { animation-delay: 6s; }
.slide-img:nth-child(3) { animation-delay: 12s; }

/* Slideshow animation */
@keyframes slideShow {
    0% { opacity: 0; }
    10% { opacity: 1; }
    35% { opacity: 1; }
    45% { opacity: 0; }
    100% { opacity: 0; }
}

/* Dark Gradient Overlay */
.hero-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        rgba(0, 0, 0, 0.3),
        rgba(0, 0, 0, 0.7)
    );
    z-index: 3;
}

/* Center Text */
.hero-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
    z-index: 4;
    text-shadow: 0 4px 15px rgba(0,0,0,0.6);
}

.hero-text h1 {
    font-size: 3.7rem;
    font-weight: 700;
}

.hero-text p {
    font-size: 1.3rem;
    margin: 15px 0;
}


.btn-explore {
    background: var(--secondary-color);
    color: white;
    padding: 12px 30px;
    border-radius: 30px;
    font-weight: 600;
    border: none;
    transition: all 0.3s;
}

.btn-explore:hover {
    background: var(--primary-color);
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

/* FEATURES */
.features-section {
    padding: 80px 0;
}

.feature-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    text-align: center;
    transition: all 0.3s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}

.feature-icon {
    font-size: 3rem;
    color: var(--primary-color);
    margin-bottom: 20px;
}

.feature-card h5 {
    font-weight: 600;
    font-size: 1.2rem;
}

/* CTA SECTION */
.cta-section {
    background: linear-gradient(rgba(255, 87, 34, 0.9), rgba(255, 152, 0, 0.9));
    padding: 80px 0;
    color: white;
    text-align: center;
}

.cta-section h2 {
    font-weight: 700;
    margin-bottom: 20px;
    font-size: 2.5rem;
}

.cta-section p {
    font-size: 1.2rem;
    margin-bottom: 30px;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<%@include file="component/navbar.jsp" %>

<!-- HERO SECTION -->
<section class="hero-section">

    <!-- Background Video -->
    <video class="hero-video" autoplay muted loop playsinline>
        <source src="video/event_bg.mp4" type="video/mp4">
    </video>

    <!-- Image Slideshow Layer -->
    <img src="img/event1.jpg" class="slide-img">
    <img src="img/event2.jpg" class="slide-img">
    <img src="img/event3.jpg" class="slide-img">

    <!-- Overlay Dark Gradient -->
    <div class="hero-overlay"></div>

    <!-- Text + Button -->
    <div class="hero-text">
        <h1>Discover Amazing Events</h1>
        <p>Concerts • Tech Conferences • Workshops • Festivals • Sports</p>
        <a href="events.jsp" class="btn-explore">Explore Events</a>
    </div>
</section>


<!-- FEATURES -->
<section class="features-section">
    <div class="container">
        <h2 class="text-center mb-5">Why Choose EventHive?</h2>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-calendar-check"></i></div>
                    <h5>Easy Event Booking</h5>
                    <p>Book events in seconds with a smooth user experience.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-qrcode"></i></div>
                    <h5>QR-Based Entry</h5>
                    <p>Instant digital passes with secure QR verification.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-credit-card"></i></div>
                    <h5>Secure Payments</h5>
                    <p>Fast online payments with instant confirmation.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA SECTION -->
<section class="cta-section">
    <div class="container">
        <h2>Host Your Event with EventHive</h2>
        <p>Register as an organizer and start managing events effortlessly.</p>
        <a href="organizer_register.jsp" class="btn btn-light btn-lg">Become an Organizer</a>
    </div>
</section>

<!-- FOOTER -->
<%@include file="component/footer.jsp" %>

</body>
</html>
