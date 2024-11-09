/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.ArtistDAO;
import DAO.CompanyDAO;
import entity.Account;
import entity.Artist;
import entity.Company;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet("/company")
public class CompanyController extends HttpServlet {

    private CompanyDAO companyDAO = new CompanyDAO();
    private ArtistDAO artistDAO = new ArtistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if ("viewArtists".equals(action)) {
            handleViewArtistsByCompany(request, response);
        } else {
            handleViewCompanies(request, response);
        }
    }

    // Hiển thị danh sách các công ty
    private void handleViewCompanies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Company> companies = companyDAO.getAllCompanies();
        request.setAttribute("companies", companies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewCompanies.jsp");
        dispatcher.forward(request, response);
    }

    private void handleViewArtistsByCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int companyID = Integer.parseInt(request.getParameter("companyID"));
        List<Artist> artists = artistDAO.getArtistsByCompany(companyID);
        request.setAttribute("artists", artists);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewArtistsByCompany.jsp");
        dispatcher.forward(request, response);
    }
}
