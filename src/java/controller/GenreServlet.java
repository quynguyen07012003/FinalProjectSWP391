package controller;

import DAO.GenreDAO;
import com.google.gson.Gson;
import entity.Genre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;



@WebServlet("/getGenre")
public class GenreServlet extends HttpServlet {

     private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        GenreDAO genreDAO = new GenreDAO(); 
        List<Genre> genres = genreDAO.getAllGenres();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String json = new Gson().toJson(genres);
        response.getWriter().write(json);
    }

}