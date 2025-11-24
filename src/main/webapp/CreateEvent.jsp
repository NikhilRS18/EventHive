<%@page import="com.event.dto.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    User usr = (User) session.getAttribute("currentUser");
    if (usr == null || !"organizer".equalsIgnoreCase(usr.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Create Event</title>
<link rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3>Create New Event</h3>
        <hr>

        <form action="Eventservlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="organizerId" value="<%=usr.getUserId() %>">

            <div class="mb-3">
                <label>Event Name</label>
                <input type="text" name="event_name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Category</label>
                <input type="text" name="category" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Location</label>
                <input type="text" name="location" class="form-control" required>
            </div>

            <div class="row">
                <div class="col-md-4 mb-3">
                    <label>Event Date</label>
                    <input type="date" name="event_date" class="form-control" required>
                </div>

                <div class="col-md-4 mb-3">
                    <label>Start Time</label>
                    <input type="time" name="start_time" class="form-control">
                </div>

                <div class="col-md-4 mb-3">
                    <label>End Time</label>
                    <input type="time" name="end_time" class="form-control">
                </div>
            </div>

            <div class="mb-3">
                <label>Ticket Cost (₹)</label>
                <input type="number" name="cost" class="form-control">
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label>Event Image URL</label>
                <input type="text" name="image_url" class="form-control">
            </div>

            <button class="btn btn-primary">Create Event</button>
            <a href="OrganizerDashboard.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

</body>
</html>
