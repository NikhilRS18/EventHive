package com.event.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import com.event.dao.EventDAO;
import com.event.dao.EventDAOImpl;
import com.event.dto.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Eventservlet")
public class Eventservlet extends HttpServlet {

    EventDAO dao = new EventDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("create".equals(action)) {
            handleCreateEvent(req, resp);
        }
    }

    private void handleCreateEvent(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int organizerId = Integer.parseInt(req.getParameter("organizerId"));
            String name = req.getParameter("event_name");
            String category = req.getParameter("category");
            String location = req.getParameter("location");

            String dateStr = req.getParameter("event_date");
            java.util.Date eventDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            String start = req.getParameter("start_time");
            String end = req.getParameter("end_time");

            int cost = Integer.parseInt(req.getParameter("cost"));
            String desc = req.getParameter("description");
            String image = req.getParameter("image_url");

            Event e = new Event(organizerId, name, category, location, eventDate, start, end, cost, desc, image);

            boolean saved = dao.createEvent(e);

            if (saved) {
				resp.sendRedirect("OrganizerDashboard.jsp?success=1");
			} else {
				resp.sendRedirect("CreateEvent.jsp?error=1");
			}

        } catch (Exception ex) {
            ex.printStackTrace();
            resp.sendRedirect("CreateEvent.jsp?error=1");
        }
    }
}
