<%@page import="com.event.dto.User"%>
<%@page import="com.event.dto.Event"%>
<%@page import="com.event.dao.EventDAOImpl"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String idStr = request.getParameter("eid");
    if(idStr == null){
        response.sendRedirect("Customer_Dashboard.jsp");
        return;
    }

    int eventId = Integer.parseInt(idStr);

    EventDAOImpl evdao = new EventDAOImpl();
    Event event = evdao.getEventById(eventId);

    if(event == null){
        response.sendRedirect("Customer_Dashboard.jsp?err=notfound");
        return;
    }

    User user = (User) session.getAttribute("currentUser");
    boolean loggedIn = (user != null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title><%= event.getEventName() %> | EventHive</title>

    <%@ include file="component/allcss.jsp" %>
    <link rel="stylesheet" href="css/viewEvent.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

<nav class="navbar navbar-dark my-bg-color">
    <div class="container">
        <a class="navbar-brand fw-bold" href="Customer_Dashboard.jsp">⬅ Back</a>
        <span class="text-white">Viewing Event</span>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <div class="row">

        <!-- Left large event image -->
        <div class="col-md-6">
            <img src="<%= event.getImageUrl() %>" class="event-img">
        </div>

        <!-- Right side data -->
        <div class="col-md-6">

            <h2 class="fw-bold"><%= event.getEventName() %></h2>
            <p class="text-muted">📍 <%= event.getLocation() %></p>

            <div class="badge badge-category">
                <%= event.getCategory() %>
            </div>

            <p class="mt-3"><b>Date:</b> <%= event.getEventDate() %></p>

            <p class="mt-2"><b>Price:</b> 
                <span class="price">₹ <%= event.getCost() %></span>
            </p>

            <p class="mt-3"><%= event.getDescription() %></p>

            <hr>

            <% if(loggedIn && "customer".equalsIgnoreCase(user.getRole())) { %>

            <form action="BookEventServlet" method="post" class="mt-3">

                <input type="hidden" name="eventId" value="<%= eventId %>">

                <label class="form-label">Select Tickets</label>
                <input type="number" name="tickets" value="1" min="1" 
                       class="form-control" required>

                <button class="btn btn-modern w-100 mt-3">
                    Book Now
                </button>

            </form>

            <% } else { %>

            <div class="alert alert-warning mt-3">
                Please login as customer to book this event.
            </div>

            <a href="Login.jsp" class="btn btn-dark w-100">Login</a>

            <% } %>

        </div>
    </div>

</div>

<script>
<% if(request.getParameter("success") != null) { %>
    Swal.fire({
        icon: "success",
        title: "Booking Successful!",
        text: "Redirecting to payment...",
        timer: 2000,
        showConfirmButton: false
    });
<% } %>
</script>

</body>
</html>
