package com.event.dto;
import java.util.Date;

public class Event {

    private int eventId;
    private int organizerId;
    private String eventName;
    private String category;
    private String location;
    private Date eventDate;
    private String startTime;
    private String endTime;
    private int cost;
    private String description;
    private String imageUrl;
    private String status;
    private Date createdAt;

    public Event() {}


    public Event(int organizerId, String eventName, String category, String location, Date eventDate,
                 String startTime, String endTime, int cost, String description, String imageUrl) {
        this.organizerId = organizerId;
        this.eventName = eventName;
        this.category = category;
        this.location = location;
        this.eventDate = eventDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cost = cost;
        this.description = description;
        this.imageUrl = imageUrl;
    }


	public int getEventId() {
		return eventId;
	}


	public void setEventId(int eventId) {
		this.eventId = eventId;
	}


	public int getOrganizerId() {
		return organizerId;
	}


	public void setOrganizerId(int organizerId) {
		this.organizerId = organizerId;
	}


	public String getEventName() {
		return eventName;
	}


	public void setEventName(String eventName) {
		this.eventName = eventName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public Date getEventDate() {
		return eventDate;
	}


	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


}
