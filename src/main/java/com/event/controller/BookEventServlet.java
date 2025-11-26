package com.event.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.event.dao.EventDAOImpl;
import com.event.dto.Event;
import com.event.dao.BookingDAOImpl;
import com.event.dto.Booking;

@WebServlet("/BookEventServlet")
public class BookEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Object userObj = session.getAttribute("currentUser");

        if (userObj == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int eventId = Integer.parseInt(req.getParameter("eventId"));
        int tickets = Integer.parseInt(req.getParameter("tickets"));

        EventDAOImpl eventDao = new EventDAOImpl();
        Event event = eventDao.getEventById(eventId);

        int totalAmount = event.getCost() * tickets;

        Booking booking = new Booking(0, eventId, ((com.event.dto.User)userObj).getUserId(),
                tickets, totalAmount);

        BookingDAOImpl bdao = new BookingDAOImpl();
        int bookingId = bdao.createBooking(booking);

        resp.sendRedirect("Payment.jsp?bid=" + bookingId);
    }
}
