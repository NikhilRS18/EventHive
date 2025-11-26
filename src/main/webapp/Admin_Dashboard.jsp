<%@page import="java.util.List"%>
<%@page import="com.event.dto.Event"%>
<%@page import="com.event.dao.EventDAOImpl"%>
<%@page import="com.event.dao.UserDAOImpl"%>
<%@page import="com.event.dto.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    User admin = (User) session.getAttribute("currentUser");
    if (admin == null || !"admin".equalsIgnoreCase(admin.getRole())) {
        session.setAttribute("login-error", "Please login as Admin");
        response.sendRedirect("Login.jsp");
        return;
    }

    EventDAOImpl evdao = new EventDAOImpl();
    List<Event> pendingEvents  = evdao.getEventsByStatus("pending");
    List<Event> allEvents      = evdao.getAllEvents();

    UserDAOImpl udao = new UserDAOImpl();
    List<User> users = udao.getAllUsers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel | EventHive</title>

    <%@ include file="component/allcss.jsp" %>

    <!-- Updated CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/AdminDashboard.css?v=<%=System.currentTimeMillis()%>">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="logo">⚙ Admin Panel</div>
    <ul>
        <li class="active" onclick="switchTab('dashboardTab', this)"><i class="fa-solid fa-gauge-high"></i> Dashboard</li>
        <li onclick="switchTab('eventsTab', this)"><i class="fa-solid fa-calendar-check"></i> Events</li>
        <li onclick="switchTab('usersTab', this)"><i class="fa-solid fa-users"></i> Users</li>
        <li onclick="switchTab('settingsTab', this)"><i class="fa-solid fa-gear"></i> Settings</li>

        <li class="logout">
            <a href="LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </li>
    </ul>
</aside>

<!-- MAIN CONTENT -->
<main class="content">

    <h2>Welcome, <%= admin.getUsername() %> 👑</h2>
    <p class="text" style="color: white;">Manage users, approve events, and control access.</p>
    

    <!-- DASHBOARD TAB -->
    <!-- DASHBOARD TAB -->
<section id="dashboardTab" class="section show-section fadeIn">

    <!-- STAT CARDS -->
    <div class="stats-grid">

        <div class="stat-card blue">
            <h3><%= allEvents.size() %></h3>
            <p>Total Events</p>
        </div>

        <div class="stat-card yellow">
            <h3><%= pendingEvents.size() %></h3>
            <p>Pending Approval</p>
        </div>

        <div class="stat-card purple">
            <h3><%= users.size() %></h3>
            <p>Total Users</p>
        </div>
    </div>


    <!-- WIDGET SECTION BELOW CARDS -->
    <div class="dashboard-widgets">

        <!-- Pending Notification -->
        <div class="alert-box">
            <i class="fa-solid fa-bell"></i>
            <span><strong><%= pendingEvents.size() %></strong> event(s) require approval.</span>
        </div>

        <!-- Recent Activity -->
        <div class="card-modern">
            <h5 class="fw-bold mb-3"><i class="fa-solid fa-clock-rotate-left"></i> Recent Activity</h5>
            <ul class="activity-list">

                <% if(pendingEvents.size() > 0) { %>
                <li>
                    <span>⏳ New event submitted: <b><%= pendingEvents.get(0).getEventName() %></b></span>
                    <span class="time">Just now</span>
                </li>
                <% } %>

                <li><span>✔ Admin logged in</span><span class="time">Today</span></li>
                <li><span>📌 Backup Completed</span><span class="time">Yesterday</span></li>
            </ul>
        </div>

        <!-- Latest Users -->
        <div class="card-modern">
            <h5 class="fw-bold mb-3"><i class="fa-solid fa-user-plus"></i> Recent Users</h5>
            <table class="mini-table">
                <tr><th>Name</th><th>Role</th></tr>
                <% for(int i=0; i<users.size() && i<3; i++) { User u = users.get(i); %>
                <tr>
                    <td><%= u.getUsername() %></td>
                    <td><%= u.getRole() %></td>
                </tr>
                <% } %>
            </table>
        </div>

    </div>

</section>
    

    <!-- EVENTS TAB -->
    <section id="eventsTab" class="section fadeIn d-none">
        <h4>Pending Events</h4>
        <table class="glass-table">
            <tr>
                <th>ID</th><th>Event</th><th>Category</th><th>Date</th><th>Cost</th><th>Action</th>
            </tr>

            <% for(Event e : pendingEvents) { %>
            <tr>
                <td><%= e.getEventId() %></td>
                <td><%= e.getEventName() %></td>
                <td><%= e.getCategory() %></td>
                <td><%= e.getEventDate() %></td>
                <td>₹<%= e.getCost() %></td>
                <td>
                    <a class="btn-approve" href="AdminEventAction?action=approve&eid=<%= e.getEventId() %>">Approve</a>
                    <a class="btn-reject" href="AdminEventAction?action=reject&eid=<%= e.getEventId() %>">Reject</a>
                </td>
            </tr>
            <% } %>
        </table>
    </section>

    <!-- USERS TAB -->
    <section id="usersTab" class="section fadeIn d-none">
        <h4>Users List</h4>
        <table class="glass-table">
            <tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th></tr>

            <% for(User u : users) { %>
            <tr>
                <td><%= u.getUserId() %></td>
                <td><%= u.getUsername() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getRole() %></td>

                <td>
                    <a href="AdminUserAction?action=delete&uid=<%= u.getUserId() %>" class="btn-delete">Delete</a>
                    <a href="AdminUserAction?action=block&uid=<%= u.getUserId() %>" class="btn-block">Block</a>
                    <a href="AdminUserAction?action=unblock&uid=<%= u.getUserId() %>" class="btn-unblock">Unblock</a>
                </td>
            </tr>
            <% } %>
        </table>
    </section>

    <!-- SETTINGS -->
    <section id="settingsTab" class="section fadeIn d-none">
        <h4>⚙ Settings</h4>
        <p>Coming soon...</p>
    </section>

</main>

<script>
function switchTab(tabId, element){
    document.querySelectorAll('.section').forEach(s => s.classList.add('d-none'));
    document.getElementById(tabId).classList.remove('d-none');

    document.querySelectorAll('.sidebar ul li').forEach(li => li.classList.remove('active'));
    element.classList.add("active");
}
</script>

</body>
</html>
