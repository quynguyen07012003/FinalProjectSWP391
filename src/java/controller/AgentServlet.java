/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.AgentDAO;
import com.google.gson.Gson;
import entity.Agent;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet("/getAgents")
public class AgentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        AgentDAO agentDao = new AgentDAO();
        List<Agent> agents = agentDao.getAllAgents();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(agents, response.getWriter()); 
    }
}
