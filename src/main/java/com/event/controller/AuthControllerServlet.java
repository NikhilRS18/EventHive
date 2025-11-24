package com.event.controller;

import java.io.IOException;

import com.event.dao.UserDAO;
import com.event.dao.UserDAOImpl;
import com.event.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/AuthControllerServlet")
public class AuthControllerServlet extends HttpServlet {
	UserDAO udao = null;

	public AuthControllerServlet() {
		udao = new UserDAOImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		if ("login".equals(action)) {
			handleLogin(req, resp);
		} else if ("register".equals(action)) {
			handleRegister(req, resp);
		}

	}

	private void handleRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String role = req.getParameter("role");
		String address = req.getParameter("address");

		User user = new User(username, password, email, mobile, role, address);
		boolean isRegistered = udao.registerUser(user);
		if (isRegistered) {
			resp.sendRedirect("Login.jsp?success=register");
		} else {

			req.setAttribute("error", "Registration failed. Email might already exist.");
			RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
			rd.forward(req, resp);
		}

	}


		private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");

	        User user = udao.loginUser(email, password);

	        if (user != null) {
	            HttpSession session = req.getSession();
	            session.setAttribute("currentUser", user);

	            String role = user.getRole();

	            if ("admin".equalsIgnoreCase(role)) {
	                resp.sendRedirect("Admin_Dashboard.jsp");
	            } else if ("organizer".equalsIgnoreCase(role)) {
	                resp.sendRedirect("OrganizerDashboard.jsp");
	            } else if ("customer".equalsIgnoreCase(role)) {
	                resp.sendRedirect("UserDashboard.jsp");
	            } else {
	                resp.sendRedirect("index.jsp");
	            }

	        } else {
	            req.setAttribute("error", "Invalid email or password.");

	            RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
	            rd.forward(req, resp);
	        }
	    }

	}


