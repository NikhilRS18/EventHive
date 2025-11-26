package com.event.dao;

import java.sql.*;
import com.event.dto.Booking;
import com.event.util.DBConnection;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public int createBooking(Booking booking) {

        String sql = "INSERT INTO bookings(event_id, customer_id, number_of_tickets, total_price) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.ProvideConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, booking.getEventId());
            ps.setInt(2, booking.getCustomerId());
            ps.setInt(3, booking.getNumberOfTickets());
            ps.setInt(4, booking.getTotalPrice());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);  // return created booking_id
                }
            }

        } catch (Exception e) { e.printStackTrace(); }

        return -1;
    }
}
