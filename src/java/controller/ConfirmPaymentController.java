// ConfirmPaymentServlet.java
package controller;

import DAO.CartDAO;
import DAO.ClientDAO;
import DAO.OrderDAO;
import entity.Account;
import entity.Cart;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import util.EmailSender;
import javax.mail.MessagingException;
import java.io.IOException;

@WebServlet("/confirmPayment")
public class ConfirmPaymentController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ClientDAO client = new ClientDAO();
        String clientIDString = client.ClientID(account.getId());
        if (clientIDString == null || clientIDString.isEmpty()) {
            response.getWriter().println("Không thể lấy Client ID.");
            return;
        }
        int clientID = Integer.parseInt(clientIDString);

        String recipientEmail = (String) session.getAttribute("recipientEmail");
        String fullName = (String) session.getAttribute("fullName");
        String phoneNumber = (String) session.getAttribute("phoneNumber");
        String address = (String) session.getAttribute("address");
        Integer totalItems = (Integer) session.getAttribute("totalItems"); // Dùng Integer
        Double totalPrice = (Double) session.getAttribute("totalPrice");   // Dùng Double

        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartItemsWithProductDetails(clientID);
        session.setAttribute("recipientEmail", account.getEmail());
        session.setAttribute("cartItems", cartItems);

        // Kiểm tra nếu thông tin thiếu
        if (recipientEmail == null || fullName == null || phoneNumber == null || address == null || totalItems == null || totalPrice == null || cartItems == null) {
            response.getWriter().println("Thông tin đơn hàng không đủ để gửi email.");
            return;
        }

        try {
            OrderDAO orderDAO = new OrderDAO();
            EmailSender.sendOrderEmail(recipientEmail, fullName, phoneNumber, address, totalItems, totalPrice, cartItems);
            orderDAO.processOrder(clientID, totalPrice, cartItems);
            response.sendRedirect("thankYou.jsp");
        } catch (SQLException | MessagingException e) {
            e.printStackTrace();
            throw new ServletException("Checkout failed", e);
        }
    }

}
