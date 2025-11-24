package com.event.dto;

import java.util.Date;

public class User {

    private int userId;
    private String username;
    private String password;
    private String email;
    private String mobile;
    private String role;      // admin / organizer / customer
    private String address;
    private Date createdAt;


    public User() {}

    public User(int userId, String username, String password, String email, String mobile,
                String role, String address, Date createdAt) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
        this.role = role;
        this.address = address;
        this.createdAt = createdAt;
    }
    public User(String username, String password, String email, String mobile, String role, String address) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
        this.role = role;
        this.address = address;
    }



    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
