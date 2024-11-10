package controller;

import DAO.CompanyDAO;
import com.google.gson.Gson;
import entity.Company;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet("/getCompanies")
public class CompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        CompanyDAO companyDAO = new CompanyDAO(); 
        List<Company> companies = companyDAO.getAllCompanies();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String json = new Gson().toJson(companies);
        response.getWriter().write(json);
    }
}
