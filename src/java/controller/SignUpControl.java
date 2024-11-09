package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import controller.SignUp;
import entity.Account;
import DAO.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MD5Encryptor;


@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO d = new DAO();
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("create_password");
        String re_pass = request.getParameter("confirm_password");
        boolean isEmailRegistered = d.isEmailRegistered(email);
        boolean isUserRegistered = d.isUserRegistered(username);
        boolean isPasswordValid = d.isPasswordValid(password);
        if (!password.equals(re_pass)) {
            request.setAttribute("mess", "Confirm_password must be same password");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
         else {
            if (isUserRegistered) {
                request.setAttribute("mess", "Username is existed");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }else if (isEmailRegistered){
                request.setAttribute("mess", "Email is existed");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }else if(!isPasswordValid){
                request.setAttribute("mess", "The password must be between 8 and 16 characters.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
             else {
                String passw = "";
                try {
                    passw = MD5Encryptor.usingMd5(password);
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                } catch (UnsupportedEncodingException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                }

                d.signUpAccount(username,passw, email, fullname);
                request.setAttribute("mess", "Sign up account successfully");
                request.getRequestDispatcher("logingg.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
