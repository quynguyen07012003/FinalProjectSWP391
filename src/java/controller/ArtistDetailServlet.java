package controller;

import DAO.ArtistDAO;
import entity.Artist;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArtistDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("aid");
            ArtistDAO artistDAO = new ArtistDAO();
            Artist artist = artistDAO.getArtistByID(id);
            request.setAttribute("detail", artist);
            request.getRequestDispatcher("artistDetail.jsp").forward(request, response);   
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
