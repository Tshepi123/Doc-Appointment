package com.bean;

import com.bean.custBean;

public class bookingBean {
    
    private int id;
    private String bookingDate;
    private String bookingTime;
    private String reason;   
    
    private custBean customer;
    
    public bookingBean(int id, String bookingDate, String bookingTime, String reason, custBean customer) {
        super();
        this.id = id;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.reason = reason;
        this.customer = customer;
    }
    public bookingBean() {
        super();
    }
    
    // Getters and Setters (shortcut select above and press ctrl + shift + alt + e)
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public custBean getCustomer() {
        return customer;
    }

    public void setCustomer(custBean customer) {
        this.customer = customer;
    }
    
}