package com.event.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import com.event.dao.EventDAOImpl;
import com.event.dto.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateEvent")
public class UpdateEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int eventId = Integer.parseInt(req.getParameter("event_id"));
            String name = req.getParameter("event_name");
            String category = req.getParameter("category");
            String location = req.getParameter("location");
            String eventDate = req.getParameter("event_date");
            String start = req.getParameter("start_time");
            String end = req.getParameter("end_time");
            int cost = Integer.parseInt(req.getParameter("cost"));
            String desc = req.getParameter("description");
            String image = req.getParameter("image_url");

            Event e = new Event();
            e.setEventId(eventId);
            e.setEventName(name);
            e.setCategory(category);
            e.setLocation(location);
            e.setEventDate(new SimpleDateFormat("yyyy-MM-dd").parse(eventDate));
            e.setStartTime(start);
            e.setEndTime(end);
            e.setCost(cost);
            e.setDescription(desc);
            e.setImageUrl(image);

            EventDAOImpl dao = new EventDAOImpl();
            boolean updated = dao.updateEvent(e);

            if (updated) {
                resp.sendRedirect("OrganizerDashboard.jsp?msg=updated");
            } else {
                resp.sendRedirect("EditEvent.jsp?eid=" + eventId + "&error=1");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
