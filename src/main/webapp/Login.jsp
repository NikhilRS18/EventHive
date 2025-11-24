<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>EventHive | Login</title>
    <%@include file="component/allcss.jsp" %>
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Poppins', sans-serif;
        }
        .login-box {
            max-width: 450px;
            margin: 80px auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }
        .btn-login {
            background: #ff5722;
            color: white;
            font-weight: 600;
        }
        .btn-login:hover {
            background: #ff9800;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h3 class="text-center mb-4">Login to EventHive</h3>

    <!-- LOGIN FORM -->
    <form action="AuthControllerServlet" method="post">
        <input type="hidden" name="action" value="login">

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="text" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button class="btn btn-login w-100">Login</button>
    </form>

    <p class="mt-3 text-center">
        Don't have an account?  
        <a href="register.jsp">Register</a>
    </p>
</div>

</body>
</html>
