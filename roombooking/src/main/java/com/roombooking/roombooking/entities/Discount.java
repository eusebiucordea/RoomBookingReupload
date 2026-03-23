package com.roombooking.roombooking.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "discount")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    private DiscountType discountType;
    @Column(name = "isActive", nullable = false)
    private boolean isActive;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isActive() {
        return isActive;
    }

    public DiscountType getDiscountType() {
        return discountType;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Long getId() {
        return id;
    }

    enum DiscountType {
        NINETY_PERCENT("90%"),
        FIFTY_PERCENT("50%");

        private final String label;

        DiscountType(String label) {
            this.label = label;
        }

        public String getLabel() {
            return label;
        }
    }
}
