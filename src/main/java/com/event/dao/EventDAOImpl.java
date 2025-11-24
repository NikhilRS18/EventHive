package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.event.dto.Event;
import com.event.util.DBConnection;


public class EventDAOImpl implements EventDAO {
	Connection con=null;
	

    @Override
    public boolean createEvent(Event e) {
    	con = DBConnection.ProvideConnection();
        String sql = "INSERT INTO events(organizer_id, event_name, category, location, event_date, start_time, end_time, cost, description, image_url) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, e.getOrganizerId());
            ps.setString(2, e.getEventName());
            ps.setString(3, e.getCategory());
            ps.setString(4, e.getLocation());
            ps.setDate(5, new java.sql.Date(e.getEventDate().getTime()));
            ps.setString(6, e.getStartTime());
            ps.setString(7, e.getEndTime());
            ps.setInt(8, e.getCost());
            ps.setString(9, e.getDescription());
            ps.setString(10, e.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Event> getEventsByOrganizer(int organizerId) {
        List<Event> list = new ArrayList<>();
        con = DBConnection.ProvideConnection();
        String sql = "SELECT * FROM events WHERE organizer_id = ? ORDER BY created_at DESC";

        try (
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, organizerId);
            Event e=null;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                e = new Event();
                e.setEventId(rs.getInt("event_id"));
                e.setEventName(rs.getString("event_name"));
                e.setCategory(rs.getString("category"));
                e.setLocation(rs.getString("location"));
                e.setEventDate(rs.getDate("event_date"));
                e.setStartTime(rs.getString("start_time"));
                e.setEndTime(rs.getString("end_time"));
                e.setCost(rs.getInt("cost"));
                e.setDescription(rs.getString("description"));
                e.setImageUrl(rs.getString("image_url"));
                e.setStatus(rs.getString("status"));

                list.add(e);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }

	@Override
	public Event getEventById(int eventId) {
		 con = DBConnection.ProvideConnection();
		 String Esql = "SELECT * FROM events WHERE event_id=?";
		 Event ev = null;
		 try {
			PreparedStatement ps = con.prepareStatement(Esql);
			 ps.setInt(1, eventId);
			 ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            ev = new Event();
		            ev.setEventId(rs.getInt("event_id"));
		            ev.setOrganizerId(rs.getInt("organizer_id"));
	                ev.setEventName(rs.getString("event_name"));
	                ev.setCategory(rs.getString("category"));
	                ev.setLocation(rs.getString("location"));
	                ev.setEventDate(rs.getDate("event_date"));
	                ev.setStartTime(rs.getString("start_time"));
	                ev.setEndTime(rs.getString("end_time"));
	                ev.setCost(rs.getInt("cost"));
	                ev.setDescription(rs.getString("description"));
	                ev.setImageUrl(rs.getString("image_url"));
	                ev.setStatus(rs.getString("status"));
		        }
		        }catch (SQLException e) {
			e.printStackTrace();
		}
		return ev;
	}
	
	@Override
	public boolean updateEvent(Event ev) {

	    con = DBConnection.ProvideConnection();
	    String sql = "UPDATE events SET event_name=?, category=?, location=?, event_date=?, start_time=?, end_time=?, cost=?, description=?, image_url=? WHERE event_id=?";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, ev.getEventName());
	        ps.setString(2, ev.getCategory());
	        ps.setString(3, ev.getLocation());
	        ps.setDate(4, new java.sql.Date(ev.getEventDate().getTime()));
	        ps.setString(5, ev.getStartTime());
	        ps.setString(6, ev.getEndTime());
	        ps.setInt(7, ev.getCost());
	        ps.setString(8, ev.getDescription());
	        ps.setString(9, ev.getImageUrl());
	        ps.setInt(10, ev.getEventId());

	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	@Override
	public boolean deleteEvent(int eventId) {

	    con = DBConnection.ProvideConnection();
	    String sql = "DELETE FROM events WHERE event_id=?";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, eventId);
	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	@Override
	public List<Event> searchEventsByOrganizer(int organizerId, String keyword, int offset, int limit) {

	    List<Event> list = new ArrayList<>();

	    con = DBConnection.ProvideConnection();

	    String sql = "SELECT * FROM events WHERE organizer_id = ? AND "
	               + "(event_name LIKE ? OR category LIKE ? OR location LIKE ?) "
	               + "ORDER BY created_at DESC LIMIT ? OFFSET ?";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, organizerId);
	        ps.setString(2, "%" + keyword + "%");
	        ps.setString(3, "%" + keyword + "%");
	        ps.setString(4, "%" + keyword + "%");
	        ps.setInt(5, limit);
	        ps.setInt(6, offset);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Event e = new Event();
	            e.setEventId(rs.getInt("event_id"));
	            e.setEventName(rs.getString("event_name"));
	            e.setCategory(rs.getString("category"));
	            e.setLocation(rs.getString("location"));
	            e.setEventDate(rs.getDate("event_date"));
	            e.setStartTime(rs.getString("start_time"));
	            e.setEndTime(rs.getString("end_time"));
	            e.setCost(rs.getInt("cost"));
	            e.setDescription(rs.getString("description"));
	            e.setImageUrl(rs.getString("image_url"));
	            e.setStatus(rs.getString("status"));

	            list.add(e);
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return list;
	}
	

}
