package com.event.controller;

import java.io.IOException;

import com.event.dao.EventDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminEventAction")
public class AdminEventActionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Object userObj = session.getAttribute("currentUser");

        // basic check: only admin
        if (userObj == null || !"admin".equalsIgnoreCase(((com.event.dto.User)userObj).getRole())) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        String action = req.getParameter("action");  // "approve" or "reject"
        String idStr = req.getParameter("eid");

        if (action == null || idStr == null) {
            resp.sendRedirect("Admin_Dashboard.jsp?msg=invalid");
            return;
        }

        int eventId = Integer.parseInt(idStr);

        String newStatus = null;
        if ("approve".equalsIgnoreCase(action)) {
            newStatus = "approved";
        } else if ("reject".equalsIgnoreCase(action)) {
            newStatus = "rejected";
        }

        if (newStatus != null) {
            EventDAOImpl dao = new EventDAOImpl();
            boolean updated = dao.updateEventStatus(eventId, newStatus);

            if (updated) {
                resp.sendRedirect("Admin_Dashboard.jsp?msg=success");
            } else {
                resp.sendRedirect("Admin_Dashboard.jsp?msg=fail");
            }
        } else {
            resp.sendRedirect("Admin_Dashboard.jsp?msg=invalidAction");
        }
    }
}
