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
<title>View Event | EventHive</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
    body { background:#f4f6f9; }

    .view-box {
        max-width: 800px;
        margin: 50px auto;
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 6px 30px rgba(0,0,0,0.1);
    }

    .event-img {
        width:100%;
        height:300px;
        border-radius:12px;
        object-fit:cover;
    }

    .badge-status {
        padding: 6px 12px;
        border-radius: 8px;
        font-size: 0.9rem;
    }
</style>

</head>

<body>

<div class="view-box">

    <img src="<%= e.getImageUrl() %>" class="event-img">

    <h2 class="mt-3"><%= e.getEventName() %></h2>

    <!-- STATUS BADGE -->
    <%
        String status = e.getStatus();
        String color = "#ffcc00";
        if ("approved".equals(status)) color = "#28a745";
        else if ("rejected".equals(status)) color = "#dc3545";
    %>
    <span class="badge-status" style="background:<%= color %>; color:white;">
        <%= status.substring(0,1).toUpperCase() + status.substring(1) %>
    </span>

    <hr>

    <p><b>Category:</b> <%= e.getCategory() %></p>
    <p><b>Location:</b> <%= e.getLocation() %></p>
    <p><b>Date:</b> <%= e.getEventDate() %></p>
    <p><b>Time:</b> <%= e.getStartTime() %> - <%= e.getEndTime() %></p>
    <p><b>Cost:</b> ₹<%= e.getCost() %></p>

    <p><b>Description:</b></p>
    <p><%= e.getDescription() %></p>

    <div class="mt-3 d-flex justify-content-between">
        <a href="OrganizerDashboard.jsp" class="btn btn-secondary">Back</a>
        <a href="EditEvent?eid=<%= e.getEventId() %>" class="btn btn-warning">Edit Event</a>
    </div>

</div>

</body>
</html>
