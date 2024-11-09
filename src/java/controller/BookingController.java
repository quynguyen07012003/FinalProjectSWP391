/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.AgentDAO;
import DAO.BookingDAO;
import entity.Account;
import entity.Agent;
import entity.Booking;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@WebServlet("/BookController")
public class BookingController extends HttpServlet {

    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("acc");
        if(account == null) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String action = request.getParameter("action");
        action = action !=  null ? action : "manageBookings";
        if ("viewUserBookings".equals(action)) {
            handleViewUserBookings(request, response);
        } else if ("manageBookings".equals(action)) {
            handleManageBookings(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("bookArtist".equals(action)) {
            handleBookArtist(request, response);
        } else if ("updateBookingStatus".equals(action)) {
            handleUpdateBookingStatus(request, response);
        }
    }

    private void handleBookArtist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int artistID = Integer.parseInt(request.getParameter("artistID"));
        int userID = (int) request.getSession().getAttribute("userID");
        Date bookingDate = new Date();

        Booking booking = new Booking();
        booking.setArtistID(artistID);
        booking.setUserID(userID);
        booking.setBookingDate(bookingDate);
        booking.setStatus("Pending");

        boolean isBooked = bookingDAO.addBooking(booking);
        if (isBooked) {
            response.sendRedirect("bookingSuccess.jsp");
        } else {
            response.sendRedirect("bookingFailure.jsp");
        }
    }

    private void handleViewUserBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (int) request.getSession().getAttribute("userID");
        List<Booking> bookings = bookingDAO.getBookingsByUserID(userID);
        request.setAttribute("bookings", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewUserBookings.jsp");
        dispatcher.forward(request, response);
    }

    private void handleManageBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("acc");
        if(account == null || (account != null && !account.getRole().equals("3")))  {
            response.sendRedirect("logingg.jsp");
            return;
        }
        AgentDAO agentDao= new AgentDAO();
        Agent agent =  agentDao.getAgentByID(account.getId());
        System.err.println(agent.getAgentID());
        List<Booking> bookings = bookingDAO.getAllBookingsWithDetails(Integer.parseInt(agent.getAgentID()));
        request.setAttribute("bookings", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageBookings.jsp");
        dispatcher.forward(request, response);
    }

    private void handleUpdateBookingStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        String status = request.getParameter("status");
        boolean isUpdated = bookingDAO.updateBookingStatus(bookingID, status);
        
        if (isUpdated) {
            response.sendRedirect("BookController?action=manageBookings");
        } else {
            response.sendRedirect("updateFailure.jsp");
        }
    }
}
