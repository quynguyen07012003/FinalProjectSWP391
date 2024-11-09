/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.NewsDAO;
import entity.Account;
import entity.News;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;



@WebServlet(name = "NewsController", urlPatterns = {"/manage-new"})
public class NewsController extends HttpServlet {

    private NewsDAO newsDAO;

    @Override
    public void init() {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "list";
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteNews(request, response);
                break;
            default:
                listNews(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Gán giá trị mặc định cho action nếu không có
        if (action == null) {
            action = "list"; // Gán giá trị mặc định là "list"
        }

        switch (action) {
            case "insert":
                insertNews(request, response);
                break;
            case "update":
                updateNews(request, response);
                break;
            default:
                listNews(request, response); // Nếu action không phải là insert hay update, thì gọi listNews
                break;
        }
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<News> newsList = newsDAO.getAllNews();
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("manage-new.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("news-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        News existingNews = newsDAO.getNewsByID(id);
        request.setAttribute("news", existingNews);
        request.getRequestDispatcher("news-form.jsp").forward(request, response);
    }

    private void insertNews(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("3"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int authorID = Integer.parseInt(account.getId());
        String status = request.getParameter("status");
        Date createdAt = new Date();
        News news = new News(0, title, content, authorID, status, createdAt);
        newsDAO.addNews(news);
        response.sendRedirect("manage-new");
    }

    private void updateNews(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int authorID = Integer.parseInt(request.getParameter("authorID"));
            String status = request.getParameter("status");
            // Tạo đối tượng News với thông tin từ form, không cần ảnh
            News news = new News(id, title, content, authorID, status, null);
            // Gọi phương thức update của DAO
            newsDAO.updateNews(news);
            // Redirect về trang quản lý tin tức sau khi cập nhật
            response.sendRedirect("manage-new");
        } catch (Exception e) {
            e.printStackTrace();           
        }
    }

    private void deleteNews(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        newsDAO.deleteNews(id);
        response.sendRedirect("manage-new");
    }
}
