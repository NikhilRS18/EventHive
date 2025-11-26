package com.event.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int bookingId = Integer.parseInt(req.getParameter("bookingId"));

        // (Future) Save payment record, update booking status

        resp.sendRedirect("Success.jsp?bid=" + bookingId);
    }
}
