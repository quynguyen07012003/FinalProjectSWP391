package controller;

import entity.Account;
import entity.Cart;
import util.EmailSender;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.MessagingException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sendOrderEmail")
public class SendOrderEmail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request hoặc session
        String recipientEmail = (String) request.getSession().getAttribute("recipientEmail");
        
        String fullName = (String) request.getSession().getAttribute("fullName");
        String phoneNumber = (String) request.getSession().getAttribute("phoneNumber");
        String address = (String) request.getSession().getAttribute("address");
        int totalItems = (int) request.getSession().getAttribute("totalItems");
        double totalPrice = (double) request.getSession().getAttribute("totalPrice");
        List<Cart> cartItems = (List<Cart>) request.getSession().getAttribute("cartItems");

        // Kiểm tra thông tin cần thiết đã có đủ chưa
        if (recipientEmail == null || fullName == null || cartItems == null) {
            response.getWriter().println("Thông tin đơn hàng không đủ để gửi email.");
            return;
        }

        try {
            // Gọi phương thức sendOrderEmail từ lớp EmailSender để gửi email
            EmailSender.sendOrderEmail(recipientEmail, fullName, phoneNumber, address, totalItems, totalPrice, cartItems);
            response.sendRedirect("confirmPayment");
            //response.getWriter().println("Email đơn hàng đã được gửi thành công.");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("Đã xảy ra lỗi khi gửi email: " + e.getMessage());
        }
    }
}
