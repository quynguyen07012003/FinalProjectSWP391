
package controller;

import entity.Account;
import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MD5Encryptor;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        String passw = "";
        try {
            passw = MD5Encryptor.usingMd5(password);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        DAO d = new DAO();
        Account acc = d.login(username, passw);
        
        if (acc == null || username.isEmpty() || passw.isEmpty()) {
            request.setAttribute("mess", "Username or password is incorrect");
            request.getRequestDispatcher("logingg.jsp").forward(request, response);
        } else if(acc.getRole().equals("1")){
            request.getRequestDispatcher("sidebar.jsp").forward(request, response);
        } else{
            if (!acc.isVerified_email()) {  // Nếu tài khoản bị vô hiệu
                request.setAttribute("mess", "Your account has been disabled. You cannot log in.");
                request.getRequestDispatcher("logingg.jsp").forward(request, response);
                return; // Ngăn không cho tiếp tục xử lý
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", acc);
                response.sendRedirect("home.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
