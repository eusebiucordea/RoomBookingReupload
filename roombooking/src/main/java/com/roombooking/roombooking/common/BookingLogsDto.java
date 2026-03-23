package com.roombooking.roombooking.common;

public class BookingLogsDto {
    private Long id;
    private String title;
    private String location;
    private float price;
    private String ownerUsername;
    private String bookingUsername;
    private Long roomId;

    public BookingLogsDto(Long id, String title, String location, float price, String ownerUsername, String bookingUsername, Long roomId) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.price = price;
        this.ownerUsername = ownerUsername;
        this.bookingUsername = bookingUsername;
        this.roomId = roomId;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getLocation() {
        return location;
    }

    public float getPrice() {
        return price;
    }

    public String getOwnerUsername() {
        return ownerUsername;
    }

    public String getBookingUsername() {
        return bookingUsername;
    }

    public Long getRoomId() {
        return roomId;
    }
}