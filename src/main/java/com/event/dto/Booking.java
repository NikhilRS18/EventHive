package com.event.dto;

public class Booking {

    private int bookingId;
    private int eventId;
    private int customerId;
    private int numberOfTickets;
    private int totalPrice;
    private String status;

    public Booking() {}

    public Booking(int bookingId, int eventId, int customerId, int numberOfTickets, int totalPrice) {
        this.bookingId = bookingId;
        this.eventId = eventId;
        this.customerId = customerId;
        this.numberOfTickets = numberOfTickets;
        this.totalPrice = totalPrice;
        this.status = "booked";
    }

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getEventId() { return eventId; }
    public void setEventId(int eventId) { this.eventId = eventId; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public int getNumberOfTickets() { return numberOfTickets; }
    public void setNumberOfTickets(int numberOfTickets) { this.numberOfTickets = numberOfTickets; }

    public int getTotalPrice() { return totalPrice; }
    public void setTotalPrice(int totalPrice) { this.totalPrice = totalPrice; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
