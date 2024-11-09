/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ArtistDAO;
import entity.Account;
import entity.Artist;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "ArtistMangeController", urlPatterns = {"/ArtistMangeController"})
public class ArtistMangeController extends HttpServlet {

    private ArtistDAO artistDAO = new ArtistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account == null || !account.getRole().equals("4")) {
            response.sendRedirect("logingg.jsp");
            return;
        }

        try {
            Artist artist = artistDAO.getArtistByUserID(account.getId());
            if (artist != null) {
                request.setAttribute("artist", artist);
            } else {
                System.out.println("Không tìm thấy nghệ sĩ cho User ID: " + account.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String action = request.getParameter("action");
        if (action != null && action.equals("editSocial")) {
            String artistID = request.getParameter("artistID");
            Artist artist = artistDAO.getArtistByID(artistID);
            request.setAttribute("artist", artist);
            request.getRequestDispatcher("updateArtistSocial.jsp").forward(request, response);
            return;
        }

        // Chuyển hướng đến trang quản lý nghệ sĩ
        request.getRequestDispatcher("artists-manage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("updateSocial")) {
            int artistID = Integer.parseInt(request.getParameter("artistID"));
            String facebook = request.getParameter("facebook");
            String tiktok = request.getParameter("tiktok");
            String instagram = request.getParameter("instagram");
            String website = request.getParameter("website");
            String twitter = request.getParameter("twitter");

            Artist artist = new Artist();
            artist.setArtistID(artistID);
            artist.setFacebook(facebook);
            artist.setTiktok(tiktok);
            artist.setInstagram(instagram);
            artist.setWebsite(website);
            artist.setTwitter(twitter);

            try {
                artistDAO.updateArtistSocial(artist);
                response.sendRedirect("ArtistMangeController?action=editSocial&artistID="+artistID);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error updating social media information");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }
}
