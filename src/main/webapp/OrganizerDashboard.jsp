<%@page import="java.util.List"%>
<%@page import="com.event.dto.Event"%>
<%@page import="com.event.dao.EventDAOImpl"%>
<%@page import="com.event.dto.User"%>
<%@ page contentType="text/html;charset=UTF-8"%>



<%
User usr2 = (User) session.getAttribute("currentUser");
if (usr2 == null) {
	session.setAttribute("login-error", "Please Login...");
	response.sendRedirect("Login.jsp");
	return;
}

EventDAOImpl evdao = new EventDAOImpl();
List<Event> myEvents = evdao.getEventsByOrganizer(usr2.getUserId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>EventHive - Organizer Dashboard</title>

<%@ include file="component/allcss.jsp"%>

<link rel="stylesheet" href="css/organizerDashboard.css">

</head>


<body>

	<%@ include file="component/organizerNavbar.jsp"%>

	<!-- PROFILE POPUP OVERLAY -->
	<div id="profileOverlay" onclick="closeProfileBox()"></div>

	<!-- PROFILE POPUP BOX -->
	<div id="profileBox">


		<!-- Profile photo -->
		<div class="profile-photo">
			<%=usr2.getUsername().substring(0, 1).toUpperCase()%>
		</div>


		<h3 class="text-center mt-3"><%=usr2.getUsername()%></h3>
		<hr>

		<p>
			<b>Email:</b>
			<%=usr2.getEmail()%></p>
		<p>
			<b>Mobile:</b>
			<%=usr2.getMobile()%></p>
		<p>
			<b>Role:</b>
			<%=usr2.getRole()%></p>
		<p>
			<b>Address:</b>
			<%=usr2.getAddress()%></p>

		<hr>

		<div class="text-center">
			<a href="EditProfile.jsp" class="btn btn-warning px-4"> <i
				class="fa-solid fa-pen-to-square me-1"></i> Edit Profile
			</a>
		</div>

	</div>

	<div class="container mt-4">

		<!-- HEADER SECTION -->
		<div class="dashboard-header mb-4">
			<h2 class="fw-bold mb-1">
				Welcome,
				<%=usr2.getUsername()%>
				👋
			</h2>
			<p class="mb-0">Manage your events, bookings, reports & tools
				from one place.</p>
		</div>
<form method="get" action="OrganizerDashboard.jsp" class="mb-4">
    <div class="input-group">
        <input type="text" name="keyword" class="form-control"
               placeholder="Search events (name/category/location)"
               value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">

        <button class="btn btn-primary">Search</button>
    </div>
</form>

		<!-- CREATE EVENT BUTTON -->
		<div class="text-end mb-4">
			<a href="CreateEvent.jsp" class="btn btn-primary btn-create"> +
				Create New Event </a>
		</div>
		

		<!-- EVENTS SECTION -->
		<h4 class="fw-bold mb-3">Your Events</h4>

		<div class="row g-4">

			<%
			if (myEvents.size() == 0) {
			%>
			<div class="col-12 text-center text-muted">
				<h5>No events created yet.</h5>
				<p>Create your first event using the "Create Event" button.</p>
			</div>
			<%
			}
			%>

			<%
			for (Event e : myEvents) {
			%>

			<div class="col-md-4">
				<div class="event-card">
					<img src="<%=e.getImageUrl()%>" class="event-img">

					<div class="p-3">
						<h5 class="fw-bold"><%=e.getEventName()%></h5>

						<!-- STATUS BADGE -->
						<%
						String status = e.getStatus();
						String badgeClass = "status-pending";
						if ("approved".equals(status))
							badgeClass = "status-approved";
						else if ("rejected".equals(status))
							badgeClass = "status-rejected";
						%>

						<span class="badge-status <%=badgeClass%>"> <%=status.substring(0, 1).toUpperCase() + status.substring(1)%>
						</span>

						<p class="mt-2 mb-1">
							<b>Cost:</b> ₹<%=e.getCost()%></p>
						<p class="mb-3">
							<b>Date:</b>
							<%=e.getEventDate()%></p>

						<div class="d-flex justify-content-between">

               <a href="ViewEvent?eid=<%= e.getEventId() %>" 
                 class="btn btn-success btn-sm">View</a>

              <a href="EditEvent?eid=<%= e.getEventId() %>" 
                 class="btn btn-warning btn-sm">Edit</a>

                <a href="DeleteEvent?eid=<%= e.getEventId() %>" 
                  class="btn btn-danger btn-sm"
                 onclick="return confirm('Are you sure you want to delete this event?')">
                    Delete
                 </a>

                      </div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<!-- TOOLS SECTION -->
		<h4 class="fw-bold mt-5 mb-3">Tools & Utilities</h4>

		<div class="row g-4 mb-5">

			<div class="col-md-4">
				<div class="tool-card">
					<h5>QR Ticket Scanner</h5>
					<p>Scan tickets for quick entry verification.</p>
					<a href="#" class="btn btn-dark btn-sm">Open Scanner</a>
				</div>
			</div>

			<div class="col-md-4">
				<div class="tool-card">
					<h5>Booking Reports</h5>
					<p>Download sales, customer, and revenue reports.</p>
					<a href="#" class="btn btn-dark btn-sm">View Reports</a>
				</div>
			</div>

		</div>

	</div>

	<%@include file="component/footer.jsp"%>

	<script>
function openProfileBox() {
    document.getElementById("profileOverlay").style.display = "block";
    const box = document.getElementById("profileBox");
    box.style.display = "block";
    setTimeout(() => {
        box.style.transform = "translate(-50%, -50%) scale(1)";
        box.style.opacity = "1";
    }, 10);
}

function closeProfileBox() {
    const box = document.getElementById("profileBox");
    box.style.transform = "translate(-50%, -50%) scale(0.7)";
    box.style.opacity = "0";
    setTimeout(() => {
        document.getElementById("profileOverlay").style.display = "none";
        box.style.display = "none";
    }, 250);
}
</script>

</body>
</html>

