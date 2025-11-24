package com.event.controller;

import java.io.IOException;
import com.event.dao.EventDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteEvent")
public class DeleteEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        int eventId = Integer.parseInt(req.getParameter("eid"));

        EventDAOImpl dao = new EventDAOImpl();
        boolean deleted = dao.deleteEvent(eventId);

        if (deleted) {
            resp.sendRedirect("OrganizerDashboard.jsp?msg=deleted");
        } else {
            resp.sendRedirect("OrganizerDashboard.jsp?error=delete");
        }
    }
}
