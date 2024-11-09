/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.ClientDAO;
import entity.Client;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name="ProfileClientServlet", urlPatterns={"/profileClient"})
public class ProfileClientServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String id = request.getParameter("pid");
            ClientDAO clientDAO = new ClientDAO();
            Client client = clientDAO.getClientByUserID(id);
            request.setAttribute("profileC", client);
            request.getRequestDispatcher("profileClient.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    } 

}
