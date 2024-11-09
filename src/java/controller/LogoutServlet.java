package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo session mới nếu không có
        
        if (session != null) {
            session.invalidate(); // Hủy session hiện tại
        }
        
        // Chuyển hướng về trang đăng nhập hoặc trang chủ sau khi logout
        response.sendRedirect("home.jsp");
    } 
}
