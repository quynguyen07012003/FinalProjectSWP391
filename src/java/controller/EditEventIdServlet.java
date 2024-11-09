package controller;

import DAO.EventDAO; 
import entity.EventDetails; 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditEventIdServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("id");
        int id = Integer.parseInt(eventId);
        String title = request.getParameter("title");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        EventDAO dao = new EventDAO();
        dao.editEvent(title, startDate, endDate, location, description, id);
        
        response.sendRedirect("event_calendar.jsp");
        
    }
}
