package controller;

import DAO.ArtistDAO;
import entity.Artist;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArtistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String search = request.getParameter("search");
        ArtistDAO artistDAO = new ArtistDAO();
        List<Artist> list;
        try {
            if (search != null && !search.trim().isEmpty()) {
                list = artistDAO.searchArtistsByName(search.trim());
            } else {
                list = artistDAO.listAllArtist();
            }
            request.setAttribute("listOfArtist", list);
            request.setAttribute("search", search);
        } catch (Exception ex) {
            Logger.getLogger(ArtistServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("artist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ArtistServlet handles artist listing and search functionality";
    }
}
