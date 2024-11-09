package controller;

import DAO.ClientDAO;
import DAO.OrderDAO;
import entity.Account;
import entity.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet("/myOrders")
public class MyOrdersController extends HttpServlet {

    private static final int PAGE_SIZE = 2; 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        String pageParam = request.getParameter("page");
        int page = (pageParam == null || pageParam.isEmpty()) ? 1 : Integer.parseInt(pageParam);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        ClientDAO clientDAO = new ClientDAO();
        if (acc == null) {
            response.sendRedirect("logingg.jsp"); 
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders;

        if (status == null || status.isEmpty()) {
            orders = orderDAO.getOrdersByClientID(clientDAO.ClientID(acc.getId()));
        } else {
            orders = orderDAO.getOrdersByStatusClientID(clientDAO.ClientID(acc.getId()), status);
        }

        int totalOrders = orders.size(); 
        int totalPages = (int) Math.ceil((double) totalOrders / PAGE_SIZE);

        int fromIndex = (page - 1) * PAGE_SIZE;
        int toIndex = Math.min(fromIndex + PAGE_SIZE, totalOrders);
        List<Order> ordersPage = orders.subList(fromIndex, toIndex); 

        request.setAttribute("orders", ordersPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("status", status);

        RequestDispatcher dispatcher = request.getRequestDispatcher("myOrders.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
