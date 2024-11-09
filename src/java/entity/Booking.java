/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

import java.util.Date;

public class Booking {
    private int bookingID;
    private int artistID;
    private int userID;
    private Date bookingDate;
    private String status;
    private Artist artist;
    private Account user;

    // Constructor không tham số
    public Booking() {}

    // Constructor đầy đủ tham số
    public Booking(int bookingID, int artistID, int userID, Date bookingDate, String status) {
        this.bookingID = bookingID;
        this.artistID = artistID;
        this.userID = userID;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters và Setters
    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }
    
}
