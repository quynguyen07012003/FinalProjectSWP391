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
import java.util.List;
import java.math.BigDecimal;
import com.google.gson.JsonObject;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String action = request.getParameter("action");
        action = action != null ? action : "view";

        if ("view".equals(action)) {
            handleViewCart(request, response);
        } else if ("remove".equals(action)) {
            handleRemoveFromCart(request, response);
        } else if ("add".equals(action)) {
            handleAddToCart(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        String action = request.getParameter("action");
        action = action != null ? action : "";

        if ("add".equals(action)) {
            handleAddToCart(request, response);
        } else if ("update".equals(action)) {
            handleUpdateQuantity(request, response); 
        }
    }

    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        ClientDAO client = new ClientDAO();
        int clientID = Integer.parseInt(client.ClientID(account.getId()));
        

        int productID = Integer.parseInt(request.getParameter("id"));
        int quantity = 1;

        boolean added = cartDAO.addToCart(clientID, productID, quantity);

        if (added) {
            response.sendRedirect("cart?action=view");
        } else {
            response.sendRedirect("product?error=addToCartFailed");
        }
    }

    private void handleViewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account == null || (account != null && !account.getRole().equals("2"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        ClientDAO client = new ClientDAO();
        int clientID = Integer.parseInt(client.ClientID(account.getId()));
        
        List<Cart> cartItems = cartDAO.getCartItemsWithProductDetails(clientID);
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

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewCart.jsp");
        dispatcher.forward(request, response);
    }

    private void handleRemoveFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));

        cartDAO.removeFromCart(cartID);
        response.sendRedirect("cart?action=view");
    }

    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        boolean success = cartDAO.updateQuantity(cartID, quantity);

        JsonObject jsonResponse = new JsonObject();
        if (success) {
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("quantity", quantity);
        } else {
            jsonResponse.addProperty("status", "error");
        }

        response.getWriter().write(jsonResponse.toString());
    }
}
