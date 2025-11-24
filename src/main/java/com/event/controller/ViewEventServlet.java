package com.event.controller;

import java.io.IOException;

import com.event.dao.EventDAOImpl;
import com.event.dto.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewEvent")
public class ViewEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        int eventId = Integer.parseInt(req.getParameter("eid"));

        EventDAOImpl dao = new EventDAOImpl();
        Event event = dao.getEventById(eventId);

        req.setAttribute("event", event);
        req.getRequestDispatcher("ViewEvent.jsp").forward(req, resp);
    }
}
