package com.roombooking.roombooking.entities;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "user")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "id", nullable = false)
  private Long id;

  @Column(name = "username", nullable = false)
  private String username;

  @Column(name = "password", nullable = false)
  private String password;

  @Column(name = "email", nullable = false)
  private String email;

  @Column(name = "phone", nullable = false)
  private String phone;

  @OneToMany(mappedBy = "user", orphanRemoval = true)
  private Collection<Booking> bookings = new ArrayList<>();

  private boolean isApproved;

  @OneToMany(mappedBy = "user", orphanRemoval = true)
  private Collection<Room> rooms = new ArrayList<>();

  @ManyToOne
  @JoinColumn(name = "role_id")
  private Role role;

  public Role getRole() {
    return role;
  }

  public void setRole(Role role) {
    this.role = role;
  }

  public Collection<Room> getRooms() {
    return rooms;
  }

  public void setRooms(Collection<Room> rooms) {
    this.rooms = rooms;
  }

  public Collection<Booking> getBookings() {
    return bookings;
  }

  public void setBookings(Collection<Booking> bookings) {
    this.bookings = bookings;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public boolean getIsApproved() {
    return isApproved;
  }

  public void setIsApproved(boolean approved) {
    isApproved = approved;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public void setPhone(String phone) { this.phone = phone; }

  public String getPhone() { return phone; }

}