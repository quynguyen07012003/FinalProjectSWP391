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

@WebServlet(name = "SearchNews", urlPatterns = {"/SearchNews"})
public class SearchNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTxt = request.getParameter("txt");

        // Tạo instance của DAO để lấy danh sách account
        NewsDAO dao = new NewsDAO();
        // Nếu không có giá trị tìm kiếm thì lấy tất cả users
        List<News> list = null;
        if (searchTxt == null || searchTxt.trim().isEmpty()) {
            list = dao.getAllNewsPublished(); // Phương thức này lấy tất cả tài khoản
        } else {
            list = dao.searchNew(searchTxt);// Phương thức này tìm kiếm theo username
        }
        // Gán danh sách vào request attribute và chuyển tiếp về JSP
        request.setAttribute("newsList", list);
        request.getRequestDispatcher("news-list-user.jsp").forward(request, response);
    }

}
