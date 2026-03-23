package com.roombooking.roombooking.common;

public class RoomDto {
    long id;
    String title;
    String description;
    String location;
    float price;
    boolean available;
    String user;

    public RoomDto(long id, String title, String description, String location, float price, boolean available, String user) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.location = location;
        this.price = price;
        this.available = available;
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getLocation() {
        return location;
    }

    public float getPrice() {
        return price;
    }

    public boolean isAvailable() {
        return available;
    }

    public String getUser() {
        return user;
    }
}
