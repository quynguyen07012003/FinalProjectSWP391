/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.NewsDAO;
import entity.News;
import java.io.IOException;
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
@WebServlet(name="NewsUserController", urlPatterns={"/newsUser"})
public class NewsUserController extends HttpServlet {
   
    private NewsDAO newsDAO;

    @Override
    public void init() {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "view":
                showNewsDetail(request, response);
                break;
            default:
                listNews(request, response);
                break;
        }
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<News> newsList = newsDAO.getAllNewsPublished();
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("news-list-user.jsp").forward(request, response);
    }

    private void showNewsDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int newsId = Integer.parseInt(request.getParameter("id"));
        News news = newsDAO.getNewsByIdPublished(newsId);
        if (news != null) {
            request.setAttribute("news", news);
            request.getRequestDispatcher("news-user-detail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "News not found.");
        }
    }

}
