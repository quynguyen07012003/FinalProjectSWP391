/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.GenreDAO;
import entity.Genre;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet("/genre")
public class GenreController extends HttpServlet {

    private GenreDAO genreDAO = new GenreDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action  =  action != null ? action : "view";
        if ("view".equals(action)) {
            handleViewGenres(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteGenre(request, response);
        } else if ("edit".equals(action)) {
            handleEditGenre(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            handleAddGenre(request, response);
        } else if ("update".equals(action)) {
            handleUpdateGenre(request, response);
        }
    }

    private void handleViewGenres(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Genre> genres = genreDAO.getAllGenres();
        request.setAttribute("genres", genres);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageGenres.jsp");
        dispatcher.forward(request, response);
    }

    private void handleAddGenre(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String genreName = request.getParameter("genreName");

        if (genreName == null || genreName.trim().isEmpty()) {
            request.setAttribute("error", "Genre name is required.");
            handleViewGenres(request, response);
            return;
        }

        Genre genre = new Genre();
        genre.setGenreName(genreName);

        boolean success = genreDAO.addGenre(genre);
        if (success) {
            response.sendRedirect("genre?action=view");
        } else {
            request.setAttribute("error", "Failed to add genre.");
            handleViewGenres(request, response);
        }
    }

    private void handleDeleteGenre(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int genreID = Integer.parseInt(request.getParameter("id"));
        boolean success = genreDAO.deleteGenre(genreID);
        if (success) {
            response.sendRedirect("genre?action=view");
        } else {
            request.setAttribute("error", "Failed to delete genre.");
            handleViewGenres(request, response);
        }
    }

    private void handleEditGenre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int genreID = Integer.parseInt(request.getParameter("id"));
        Genre genre = genreDAO.getGenreById(genreID);
        request.setAttribute("genre", genre);
        this.handleViewGenres(request, response);
    }

    private void handleUpdateGenre(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int genreID = Integer.parseInt(request.getParameter("id"));
        String genreName = request.getParameter("genreName");

        if (genreName == null || genreName.trim().isEmpty()) {
            request.setAttribute("error", "Genre name is required.");
            handleEditGenre(request, response);
            return;
        }

        Genre genre = new Genre();
        genre.setGenreID(genreID);
        genre.setGenreName(genreName);

        boolean success = genreDAO.updateGenre(genre);
        if (success) {
            response.sendRedirect("genre?action=view");
        } else {
            request.setAttribute("error", "Failed to update genre.");
            handleEditGenre(request, response);
        }
    }
}
