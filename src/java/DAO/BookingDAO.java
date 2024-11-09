/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Account;
import entity.Artist;
import entity.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO extends DBContext {

    // Thêm một booking mới
    public boolean addBooking(Booking booking) {
        String query = "INSERT INTO Booking (ArtistID, UserID, BookingDate, Status) VALUES (?, ?, ?, ?)";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, booking.getArtistID());
            statement.setInt(2, booking.getUserID());
            statement.setTimestamp(3, new Timestamp(booking.getBookingDate().getTime()));
            statement.setString(4, booking.getStatus());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Booking> getAllBookingsWithDetails(int id) {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT b.BookingID, b.BookingDate, b.Status, "
                + "u.UserID, u.FullName AS UserName, u.Email AS UserEmail, "
                + "a.ArtistID, a.ArtistName AS ArtistName "
                + "FROM Booking b "
                + "JOIN [User] u ON b.UserID = u.UserID "
                + "JOIN Artist a ON b.ArtistID = a.ArtistID where AgencyId = ?";

        try  {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setBookingDate(rs.getTimestamp("BookingDate"));
                booking.setStatus(rs.getString("Status"));

                Account user = new Account();
                user.setId(rs.getInt("UserID") + "");
                user.setFullname(rs.getString("UserName"));
                user.setEmail(rs.getString("UserEmail"));
                booking.setUser(user);

                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                booking.setArtist(artist);

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Lấy tất cả các booking của một người dùng
    public List<Booking> getBookingsByUserID(int userID) {
        List<Booking> bookings = new ArrayList<>();
         String query = "SELECT b.BookingID, b.BookingDate, b.Status, "
                + "u.UserID, u.FullName AS UserName, u.Email AS UserEmail, "
                + "a.ArtistID, a.ArtistName AS ArtistName "
                + "FROM Booking b "
                + "JOIN [User] u ON b.UserID = u.UserID "
                + "JOIN Artist a ON b.ArtistID = a.ArtistID where u.UserID = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setArtistID(rs.getInt("ArtistID"));
                booking.setUserID(rs.getInt("UserID"));
                booking.setBookingDate(rs.getTimestamp("BookingDate"));
                booking.setStatus(rs.getString("Status"));
                Account user = new Account();
                user.setId(rs.getInt("UserID") + "");
                user.setFullname(rs.getString("UserName"));
                user.setEmail(rs.getString("UserEmail"));
                booking.setUser(user);

                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                booking.setArtist(artist);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Cập nhật trạng thái của booking
    public boolean updateBookingStatus(int bookingID, String status) {
        String query = "UPDATE Booking SET Status = ? WHERE BookingID = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setInt(2, bookingID);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy tất cả các booking để quản lý
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM Booking";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setArtistID(rs.getInt("ArtistID"));
                booking.setUserID(rs.getInt("UserID"));
                booking.setBookingDate(rs.getTimestamp("BookingDate"));
                booking.setStatus(rs.getString("Status"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
