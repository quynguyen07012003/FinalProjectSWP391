/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import util.EmailSender;


@WebServlet(name = "EnterEmailController", urlPatterns = {"/EnterEmailController"})
public class EnterEmailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get ve gia tri mail ma nguoi dung nhap
        String mail = request.getParameter("email");
        //kiem tra xem mail co tn tai o DB hay ko
        boolean isExistMail = true;
String http = " http://localhost:9999/SWP/ChangePass.jsp ";
        try {
            //gui mail

            EmailSender.sendEmail(mail, "doi mat khau tai day:" , http );
            
            
        } catch (MessagingException ex) {
            Logger.getLogger(EnterEmailController.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        //get ve gia tri mail ma nguoi dung nhap
        String mail = request.getParameter("email");
        //kiem tra xem mail co tn tai o DB hay ko
        boolean isExistMail = true;
String http = " http://localhost:8080/SWP_MUSIC/ChangePass.jsp  ";
        try {
            //gui mail

            EmailSender.sendEmail(mail, "doi mat khau tai day:" , http );
            
            
        } catch (MessagingException ex) {
            Logger.getLogger(EnterEmailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EnterEmailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnterEmailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
