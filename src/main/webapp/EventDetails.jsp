<%@page import="com.event.dto.Event"%>
<%@page import="com.event.dao.EventDAOImpl"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    int eventId = Integer.parseInt(request.getParameter("eid"));
    EventDAOImpl dao = new EventDAOImpl();
    Event event = dao.getEventById(eventId);

    if(event == null){
        response.sendRedirect("Customer_Dashboard.jsp?error=notfound");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title><%=event.getEventName()%> - EventHive</title>
    <%@ include file="component/allcss.jsp" %>
</head>
<body>



<div class="container mt-4">

    <div class="row">
        <div class="col-md-6">
            <img src="<%= event.getImageUrl() %>" class="img-fluid rounded shadow" />
        </div>

        <div class="col-md-6">
            <h2><%= event.getEventName() %></h2>
            <p class="text-muted"><%= event.getCategory() %> | <%= event.getLocation() %></p>

            <h4 class="text-success">₹ <%= event.getCost() %></h4>

            <p class="mt-3">
                <b>Date:</b> <%= event.getEventDate() %><br>
                <b>Time:</b> <%= event.getStartTime() %> - <%= event.getEndTime() %>
            </p>

            <p><%= event.getDescription() %></p>

            <form action="BookEventServlet" method="post">
                <input type="hidden" name="eventId" value="<%=event.getEventId()%>">

                <label class="mt-2">Number of Tickets</label>
                <input type="number" class="form-control" name="tickets" min="1" required>

                <button class="btn btn-modern mt-3 w-100">Book Now</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
