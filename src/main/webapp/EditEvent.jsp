<%@page import="com.event.dto.Event"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
    Event e = (Event) request.getAttribute("event");
    if (e == null) {
        response.sendRedirect("OrganizerDashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Event | EventHive</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
    body { background:#f4f6f9; }
    .edit-box {
        max-width: 600px;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }
</style>

</head>

<body>

<div class="edit-box">
    <h3 class="text-center mb-3">Edit Event</h3>

    <form action="UpdateEvent" method="post">

        <!-- Hidden eventId -->
        <input type="hidden" name="event_id" value="<%= e.getEventId() %>">

        <div class="mb-3">
            <label class="form-label">Event Name</label>
            <input type="text" name="event_name" class="form-control" required
                   value="<%= e.getEventName() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control" required
                   value="<%= e.getCategory() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Location</label>
            <input type="text" name="location" class="form-control" required
                   value="<%= e.getLocation() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Event Date</label>
            <input type="date" name="event_date" class="form-control" required
                   value="<%= e.getEventDate() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Start Time</label>
            <input type="text" name="start_time" class="form-control"
                   value="<%= e.getStartTime() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">End Time</label>
            <input type="text" name="end_time" class="form-control"
                   value="<%= e.getEndTime() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Cost (₹)</label>
            <input type="number" name="cost" class="form-control" required
                   value="<%= e.getCost() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="3"><%= e.getDescription() %></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Image URL</label>
            <input type="text" name="image_url" class="form-control"
                   value="<%= e.getImageUrl() %>">
        </div>

        <!-- Update Button -->
        <button class="btn btn-primary w-100">Update Event</button>

    </form>
</div>

</body>
</html>
