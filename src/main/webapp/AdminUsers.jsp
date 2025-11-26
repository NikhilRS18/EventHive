<%@page import="java.util.List"%>
<%@page import="com.event.dto.User"%>
<%@page import="com.event.dao.UserDAOImpl"%>
<%@page contentType="text/html;charset=UTF-8" %>

<%
User admin = (User) session.getAttribute("currentUser");
if (admin == null || !"admin".equals(admin.getRole())) {
    response.sendRedirect("Login.jsp");
}

String keyword = request.getParameter("keyword");
UserDAOImpl udao = new UserDAOImpl();
List<User> users = (keyword == null) ? udao.getAllUsers() : udao.searchUsers(keyword);
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Users - Admin Panel</title>
<%@ include file="component/allcss.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

<div class="container mt-4">
    <h3 class="fw-bold mb-3">Manage Users 👥</h3>

    <form method="get" class="mb-3">
        <input type="text" name="keyword" placeholder="Search user…" class="form-control"
               value="<%= keyword != null ? keyword : "" %>">
    </form>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Type</th><th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for(User u : users) { %>
        <tr>
            <td><%=u.getUserId()%></td>
            <td><%=u.getUsername()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getRole()%></td>
            <td>
                <a href="AdminUserAction?action=delete&uid=<%=u.getUserId()%>" 
                   onclick="return confirm('Delete this user?')" 
                   class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
<% if ("success".equals(request.getParameter("msg"))) { %>
Swal.fire("Done!", "User updated successfully", "success");
<% } %>
</script>

</body>
</html>
