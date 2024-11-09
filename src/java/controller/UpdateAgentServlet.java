package controller;

import DAO.AgentDAO;
import entity.Agent;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateAgentServlet", urlPatterns = {"/updateAgent"})
@MultipartConfig
public class UpdateAgentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String agentID = request.getParameter("agentID");
        String agentName = request.getParameter("agentName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phoneNumber");
        String userID = request.getParameter("userID");

        String errorMessage = "";
        if (agentName == null || agentName.isEmpty()) {
            errorMessage += "Agent Name is required.<br/>";
        }
        if (address == null || address.isEmpty()) {
            errorMessage += "Address is required.<br/>";
        }
        if (email == null || email.isEmpty()) {
            errorMessage += "Email is required.<br/>";
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            errorMessage += "Invalid email format.<br/>";
        }
        if (phonenumber == null || phonenumber.isEmpty()) {
            errorMessage += "Phone Number is required.<br/>";
        }

        if (!errorMessage.isEmpty()) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("agent", new Agent(agentID, agentName, address, phonenumber, email));
            request.getRequestDispatcher("profileAgent.jsp").forward(request, response);
            return;
        }

        Agent agent = new Agent(agentID, agentName, address, phonenumber, email, userID);
        AgentDAO agentDAO = new AgentDAO();
        boolean isUpdated = agentDAO.updateAgent(agent);
        if (isUpdated) {
            response.sendRedirect("profileAgent?pid=" + userID);
        } else {
            response.sendRedirect("error.jsp");
        }

        
    }

}
