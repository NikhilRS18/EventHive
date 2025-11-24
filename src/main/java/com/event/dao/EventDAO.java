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
}
