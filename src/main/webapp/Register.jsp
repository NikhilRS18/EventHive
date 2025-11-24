<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>EventHive | Register</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Poppins', sans-serif;
        }
        .register-box {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }
        .btn-register {
            background: #ff9800;
            color: white;
            font-weight: 600;
        }
        .btn-register:hover {
            background: #ff5722;
        }
    </style>
</head>

<body>

<div class="register-box">
    <h3 class="text-center mb-4">Create Your EventHive Account</h3>

    <form action="AuthControllerServlet" method="post">
        <input type="hidden" name="action" value="register">

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Mobile Number</label>
            <input type="text" name="mobile" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <!-- USER ROLE SELECTION -->
        <div class="mb-3">
            <label class="form-label">Register As</label>
            <select name="role" class="form-select" required>
                <option value="customer">Customer</option>
                <option value="organizer">Event Organizer</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control" rows="2"></textarea>
        </div>
        

        <button class="btn btn-register w-100">Register</button>
    </form>

    <p class="mt-3 text-center">
        Already have an account?  
        <a href="Login.jsp">Login</a>
    </p>
</div>

</body>
</html>
