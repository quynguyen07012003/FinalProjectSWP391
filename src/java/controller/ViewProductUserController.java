/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProductDAO;
import entity.EventDetails;
import entity.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "ViewProductUserController", urlPatterns = {"/viewProducts"})
public class ViewProductUserController extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleViewProducts(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void handleViewProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchKeyword = request.getParameter("search");
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int itemsPerPage = 12;

        List<Product> allProducts;
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            allProducts = productDAO.searchProducts(searchKeyword); 
            request.setAttribute("search", searchKeyword); 
        } else {
            allProducts = productDAO.getAllProducts(); 
        }

        int totalItems = allProducts.size();
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
        List<Product> pagedProducts = allProducts.subList(startIndex, endIndex);

        request.setAttribute("products", pagedProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProductUser.jsp");
        dispatcher.forward(request, response);
    }

}
