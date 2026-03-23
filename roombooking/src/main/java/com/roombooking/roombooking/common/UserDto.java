package com.roombooking.roombooking.common;

import com.roombooking.roombooking.entities.Role;

public class UserDto {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private boolean isApproved;
    private String role;


    public UserDto(Long id, String username, String email, String phone, boolean isApproved, String role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.isApproved = isApproved;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public boolean getIsApproved() {
        return isApproved;
    }

    public String getRole() {
        return role;
    }
}