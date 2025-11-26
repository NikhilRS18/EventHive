package com.event.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.event.dao.UserDAOImpl;

@WebServlet("/AdminUserAction")
public class AdminUserActionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String action = req.getParameter("action");
        int uid = Integer.parseInt(req.getParameter("uid"));

        UserDAOImpl dao = new UserDAOImpl();
        boolean result = false;

        switch (action) {

            case "delete":
                result = dao.deleteUser(uid);
                break;

            case "block":
                result = dao.updateUserStatus(uid, "blocked");
                break;

            case "unblock":
                result = dao.updateUserStatus(uid, "active");
                break;


        }

        resp.sendRedirect("Admin_Dashboard.jsp?msg=" + (result ? "success" : "fail"));
    }
}
