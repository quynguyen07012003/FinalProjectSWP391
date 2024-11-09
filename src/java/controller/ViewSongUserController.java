/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.GenreDAO;
import DAO.SongDAO;
import entity.Genre;
import entity.Song;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "ViewSongUserController", urlPatterns = {"/viewSongs"})
public class ViewSongUserController extends HttpServlet {

    private SongDAO songDAO = new SongDAO();
    private GenreDAO genreDAO = new GenreDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleViewSongsByArtist(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void handleViewSongsByArtist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Song> songs = songDAO.getSongsByArtistID(id);
            request.setAttribute("songs", songs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewSongUser.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("home.jsp");
        }
    }
}
