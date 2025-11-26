package com.event.dao;

import java.util.List;

import com.event.dto.Event;

public interface EventDAO {
    boolean createEvent(Event e);
    List<Event> getEventsByOrganizer(int organizerId);
    Event getEventById(int eventId);
	boolean updateEvent(Event ev);
	boolean deleteEvent(int eventId);
	List<Event> searchEventsByOrganizer(int organizerId, String keyword, int offset, int limit);
	
	//Customer
	List<Event> getApprovedEvents();
	List<Event> getApprovedEventsByCategory(String category);
	List<Event> searchApprovedEvents(String keyword, String location, String category);
	
	//Admin
	List<Event> getEventsByStatus(String status);
	List<Event> getAllEvents();
	boolean updateEventStatus(int eventId, String status);
}
