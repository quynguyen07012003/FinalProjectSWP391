/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BookingDAO;
import entity.Account;
import entity.Booking;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "UserBookController", urlPatterns = {"/UserBookController"})
public class UserBookController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String action = request.getParameter("action");
        action = action != null ? action : "viewUserBookings";
        if ("viewUserBookings".equals(action)) {
            handleViewUserBookings(request, response);
        } else if ("bookArtist".equals(action)) {
            handleBookArtists(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String action = request.getParameter("action");
        if ("bookArtist".equals(action)) {
            handleBookArtists(request, response);
        }
    }

    private void handleBookArtists(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BookingDAO bookingDAO = new BookingDAO();
        String[] artistIDs = request.getParameterValues("artistIDs");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int userID = Integer.parseInt(account.getId());
        Date bookingDate = new Date();

        if (artistIDs != null) {
            for (String artistIDStr : artistIDs) {
                int artistID = Integer.parseInt(artistIDStr);
                Booking booking = new Booking();
                booking.setArtistID(artistID);
                booking.setUserID(userID);
                booking.setBookingDate(bookingDate);
                booking.setStatus("Pending");

                bookingDAO.addBooking(booking);
            }
            response.sendRedirect("bookingSuccess.jsp");
        } else {
            response.sendRedirect("bookingFailure.jsp");
        }
    }

    private void handleViewUserBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookingDAO bookingDAO = new BookingDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int userID = Integer.parseInt(account.getId());
        List<Booking> bookings = bookingDAO.getBookingsByUserID(userID);
        request.setAttribute("bookings", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewUserBookings.jsp");
        dispatcher.forward(request, response);
    }

}
