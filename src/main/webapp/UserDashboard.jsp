<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventHive - User Dashboard</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body { background: #f4f6f9; }
        .event-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .event-card:hover { transform: translateY(-5px); }
        .dashboard-header {
            background: #4e73df;
            padding: 20px;
            border-radius: 10px;
            color: white;
            margin-bottom: 30px;
        }
        .qr-btn {
            background:#1cc88a;
            color:white;
        }
    </style>
</head>

<body>

<div class="container mt-4">

    <!-- HEADER -->
    <div class="dashboard-header">
        <h2>Welcome, User</h2>
        <p>Your personalized event dashboard</p>
    </div>

    <!-- UPCOMING BOOKINGS -->
    <h4 class="mb-3">Your Upcoming Events</h4>
    <div class="row g-3 mb-5">

        <!-- SAMPLE BOOKING CARD 1 -->
        <div class="col-md-4">
            <div class="card p-3 event-card">
                <h5>Music Night 2025</h5>
                <p>Date: 2025-02-10</p>
                <p>Tickets: 2</p>
                <a href="#" class="btn qr-btn btn-sm">View QR Ticket</a>
            </div>
        </div>

        <!-- SAMPLE BOOKING CARD 2 -->
        <div class="col-md-4">
            <div class="card p-3 event-card">
                <h5>Tech Conference</h5>
                <p>Date: 2025-03-05</p>
                <p>Tickets: 1</p>
                <a href="#" class="btn qr-btn btn-sm">View QR Ticket</a>
            </div>
        </div>

    </div>

    <!-- FEATURED EVENTS -->
    <h4 class="mb-3">Recommended Events</h4>
    <div class="row g-4">

        <!-- Event 1 -->
        <div class="col-md-3">
            <div class="card event-card">
                <img src="https://via.placeholder.com/300" class="card-img-top" 
                     style="height:170px; object-fit:cover;">
                <div class="card-body">
                    <h5 class="card-title">AI Summit</h5>
                    <p class="text-muted">Technology</p>
                    <p><strong>₹499</strong></p>
                    <a href="#" class="btn btn-primary btn-sm w-100">View Details</a>
                </div>
            </div>
        </div>

        <!-- Event 2 -->
        <div class="col-md-3">
            <div class="card event-card">
                <img src="https://via.placeholder.com/300" class="card-img-top"
                     style="height:170px; object-fit:cover;">
                <div class="card-body">
                    <h5 class="card-title">Music Carnival</h5>
                    <p class="text-muted">Music</p>
                    <p><strong>₹299</strong></p>
                    <a href="#" class="btn btn-primary btn-sm w-100">View Details</a>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>
