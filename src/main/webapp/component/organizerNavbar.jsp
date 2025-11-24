<%@page import="com.event.dto.User"%>

<%
    User navUser= (User) session.getAttribute("currentUser");
    if (navUser == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<link rel="stylesheet" 
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" 
     style="background: linear-gradient(90deg,#ff9800,#ff5722);
            box-shadow: 0 3px 10px rgba(0,0,0,0.25);">

  <div class="container d-flex justify-content-between">

    <!-- Brand -->
    <a class="navbar-brand fw-bold d-flex align-items-center" href="OrganizerDashboard.jsp">
        <img src="img/eventhive_logo.png" height="42" class="me-2">
        <span style="font-size: 1.4rem;">EventHive Organizer</span>
    </a>

    <!-- NAV CONTENT -->
    <div class="d-flex align-items-center">

        <!-- Dashboard -->
        <a class="nav-link text-white fw-semibold me-3" href="OrganizerDashboard.jsp">
            <i class="fa-solid fa-gauge-high me-1"></i> Dashboard
        </a>

        <!-- Create Event -->
        <a class="nav-link text-white fw-semibold me-3" href="CreateEvent.jsp">
            <i class="fa-solid fa-calendar-plus me-1"></i> Create Event
        </a>

       <!-- PROFILE BUTTON (OPEN POPUP) -->
<button class="btn text-white fw-semibold d-flex align-items-center" 
        onclick="openProfileBox()" style="border:none;">

    <div style="
        width: 38px; 
        height: 38px; 
        border-radius: 50%; 
        background:white; 
        display:flex; 
        align-items:center; 
        justify-content:center;
        color:#ff5722;
        font-size:18px;
        box-shadow:0 3px 8px rgba(0,0,0,0.2);
        ">
        <i class="fa-solid fa-user"></i>
    </div>

    <span class="ms-2"><%= navUser.getUsername() %></span>
</button>


        <!-- LOGOUT -->
        <a class="btn btn-light text-danger fw-semibold px-3" href="LogoutServlet">
            <i class="fa-solid fa-right-from-bracket"></i>
        </a>

    </div>

  </div>
</nav>

<div style="height: 85px;"></div>
