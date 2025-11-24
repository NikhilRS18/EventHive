<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventHive - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body{ background:#eef1f6; }
        .stats-card {
            background:white;
            border-radius:12px;
            padding:20px;
            box-shadow:0 4px 10px rgba(0,0,0,0.1);
            text-align:center;
            font-weight: bold;
        }
        .pending-card {
            padding:18px;
            background:white;
            border-radius:10px;
            box-shadow:0 4px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body>
<div class="container mt-4">

    <h2 class="mb-4">Admin Dashboard</h2>

    <!-- STATS -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="stats-card">
                Total Events<br><span style="font-size:28px;">120</span>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                Organizers<br><span style="font-size:28px;">34</span>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                Customers<br><span style="font-size:28px;">520</span>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                Revenue<br><span style="font-size:28px;">₹6,25,000</span>
            </div>
        </div>
    </div>

    <!-- PENDING APPROVALS -->
    <h4 class="mb-3">Pending Event Approvals</h4>
    <div class="pending-card mb-3">
        <h5>Tech Innovators 2025</h5>
        <p>Organizer: John Events</p>
        <a href="#" class="btn btn-success btn-sm">Approve</a>
        <a href="#" class="btn btn-danger btn-sm">Reject</a>
    </div>

    <div class="pending-card mb-3">
        <h5>Music Fiesta</h5>
        <p>Organizer: Wave Studio</p>
        <a href="#" class="btn btn-success btn-sm">Approve</a>
        <a href="#" class="btn btn-danger btn-sm">Reject</a>
    </div>

    <!-- USER MANAGEMENT -->
    <h4 class="mt-4 mb-3">User Management</h4>
    <div class="row">
        <div class="col-md-4">
            <div class="stats-card">
                <h5>View Organizers</h5>
                <a href="#" class="btn btn-primary btn-sm">Open</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stats-card">
                <h5>View Customers</h5>
                <a href="#" class="btn btn-primary btn-sm">Open</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stats-card">
                <h5>All Events</h5>
                <a href="#" class="btn btn-primary btn-sm">Open</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
