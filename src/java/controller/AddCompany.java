/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CompanyDAO;
import entity.Company;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author shido
 */
@WebServlet(name = "AddCompany", urlPatterns = {"/addCompany"})
public class AddCompany extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCompany</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCompany at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các giá trị từ form
        String companyName = request.getParameter("companyName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");

        // Tạo đối tượng Company
        Company company = new Company();
        company.setCompanyName(companyName);
        company.setAddress(address);
        company.setPhoneNumber(phoneNumber);
        company.setEmail(email);

        // Gọi DAO để lưu vào cơ sở dữ liệu
        CompanyDAO companyDAO = new CompanyDAO();
        companyDAO.addCompany(company);
        // Chuyển hướng hoặc trả về thông báo
        response.sendRedirect("CompanyManage"); // Chuyển đến trang thành công
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
