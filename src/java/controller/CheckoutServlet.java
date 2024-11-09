package controller;

import DAO.CartDAO;
import DAO.ClientDAO;
import entity.Account;
import entity.Cart;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        CartDAO cartDAO = new CartDAO();
        ClientDAO client = new ClientDAO();
        int clientID = Integer.parseInt(client.ClientID(account.getId()));
        List<Cart> cartItems = cartDAO.getCartItemsWithProductDetails(clientID);
        session.setAttribute("recipientEmail", account.getEmail());
        session.setAttribute("cartItems", cartItems);
        
        BigDecimal totalPrice = BigDecimal.ZERO;
        int totalItems = 0;

        for (Cart item : cartItems) {
            totalItems += item.getQuantity();

            BigDecimal itemTotal = item.getProduct().getPrice().multiply(BigDecimal.valueOf(item.getQuantity()));
            totalPrice = totalPrice.add(itemTotal);
        }

        request.setAttribute("totalItems", totalItems);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("cartItems", cartItems);

        RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null) {
            response.sendRedirect("logingg.jsp");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        int totalItems = Integer.parseInt(request.getParameter("totalItems"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        session.setAttribute("fullName", fullName);
        session.setAttribute("phoneNumber", phoneNumber);
        session.setAttribute("address", address);
        session.setAttribute("totalItems", totalItems);
        session.setAttribute("totalPrice", totalPrice);
        doGet(request, response);
    }
}
