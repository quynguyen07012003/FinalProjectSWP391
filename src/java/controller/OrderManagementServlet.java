package controller;

import DAO.OrderDAO;
import entity.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/orderManagement")
public class OrderManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getAllOrders();
        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order_management.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        String status = request.getParameter("status");

        boolean isUpdated = orderDAO.updateOrderStatus(orderID, status);
        if (isUpdated) {
            response.sendRedirect("orderManagement");
        } 
    }

}
