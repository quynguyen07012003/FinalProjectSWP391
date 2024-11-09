package controller;

import DAO.EventDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.JSONArray;

public class EventServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        EventDAO eventDAO = new EventDAO();
        PrintWriter out = response.getWriter(); 
        
        try {
            JSONArray eventsArray = eventDAO.getAllEvents();
            out.print(eventsArray.toString()); 
            out.flush(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
