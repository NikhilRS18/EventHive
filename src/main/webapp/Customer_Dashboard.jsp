<%@page import="java.util.List"%>
<%@page import="com.event.dto.Event"%>
<%@page import="com.event.dao.EventDAOImpl"%>
<%@page import="com.event.dto.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    User cust = (User) session.getAttribute("currentUser");
    if (cust == null || !"customer".equalsIgnoreCase(cust.getRole())) {
        session.setAttribute("login-error", "Please login as Customer");
        response.sendRedirect("Login.jsp");
        return;
    }

    EventDAOImpl evdao = new EventDAOImpl();

    // Category filter (if user selects category)
    String categoryFilter = request.getParameter("category");

    List<Event> approvedEvents = null;
    if (categoryFilter != null && !categoryFilter.trim().equals("")) {
        approvedEvents = evdao.getApprovedEventsByCategory(categoryFilter);
    } else {
        approvedEvents = evdao.getApprovedEvents();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventHive - Customer Dashboard</title>

    <%@ include file="component/allcss.jsp" %>
    <link rel="stylesheet" href="css/CustomerDashboard.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark my-bg-color">
    <div class="container-fluid">
        <button class="btn btn-outline-light me-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#customerSidebar">
            <i class="fas fa-bars"></i>
        </button>

        <a class="navbar-brand fw-bold" href="CustomerDashboard.jsp">EventHive</a>

        <div>
            <span class="text-white me-3">
                <i class="fas fa-user-circle"></i> <%= cust.getUsername() %>
            </span>
            <a href="LogoutServlet" class="btn btn-sm btn-light">Logout</a>
        </div>
    </div>
</nav>

<!-- SIDEBAR CATEGORY FILTER -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="customerSidebar">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title">Categories</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="list-unstyled">
            <li><a href="CustomerDashboard.jsp?category=Marriage">💍 Marriage Events</a></li>
            <li><a href="CustomerDashboard.jsp?category=Birthday">🎈 Birthday Parties</a></li>
            <li><a href="CustomerDashboard.jsp?category=Corporate">💼 Corporate Events</a></li>
            <li><a href="CustomerDashboard.jsp?category=Concert">🎤 Concerts</a></li>
            <li><a href="CustomerDashboard.jsp">🔄 Reset Filter</a></li>
        </ul>

        <hr>

        <h6>Your Area</h6>
        <ul class="list-unstyled">
            <li><a href="CustomerBookings.jsp">My Bookings</a></li>
            <li><a href="CustomerPayments.jsp">Payment History</a></li>
            <li><a href="CustomerProfile.jsp">Profile Settings</a></li>
        </ul>
    </div>
</div>

<div class="container mt-4">

    <!-- HERO SEARCH -->
    <div class="card-modern p-4 mb-4">
        <h2>Welcome, <%= cust.getUsername() %> 👋</h2>
        <p>Book Events, Venues, Services & Tickets Easily!</p>

        <form action="SearchEventsServlet" method="get" class="row g-2">
            <div class="col-md-6">
                <input type="text" class="form-control form-control-modern" name="keyword" placeholder="Search events...">
            </div>
            <div class="col-md-3">
                <select name="mainCategory" class="form-control form-control-modern">
                    <option value="">All Categories</option>
                    <option>Marriage</option>
                    <option>Birthday</option>
                    <option>Corporate</option>
                    <option>Concert</option>
                </select>
            </div>
            <div class="col-md-3">
                <button class="btn btn-modern w-100">Search</button>
            </div>
        </form>
    </div>

    <!-- DYNAMIC RECOMMENDED EVENTS -->
    <h4 class="fw-bold mb-3">Available Events</h4>

    <div class="row g-4">
        <% if(approvedEvents.isEmpty()) { %>
            <div class="col-12 text-center text-danger">
                <h5>No events found for this category.</h5>
            </div>
        <% } %>

        <% for(Event e : approvedEvents) { %>
            <div class="col-md-3">
                <div class="card-modern">
                    <img src="<%= e.getImageUrl() %>" class="card-img-top" style="height:170px; object-fit:cover;">

                    <div class="p-3">
                        <h6 class="fw-bold"><%= e.getEventName() %></h6>
                        <p class="small text-muted"><%= e.getLocation() %></p>
                        <p><b>₹ <%= e.getCost() %></b></p>

                        <a href="ViewEvent?eid=<%= e.getEventId() %>" class="btn btn-sm btn-modern w-100">
                            View & Book
                        </a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

</div>

<%@ include file="component/footer.jsp" %>

</body>
</html>
