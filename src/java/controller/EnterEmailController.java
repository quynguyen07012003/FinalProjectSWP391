package controller;


import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import util.EmailSender;
import util.MD5Encryptor;
import util.GeneratePassword;


@WebServlet(name = "EnterEmailController", urlPatterns = {"/EnterEmailController"})
public class EnterEmailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {       
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String mail = request.getParameter("email");
        String newpass = new String(GeneratePassword.generatePassword()) ;
         String passw = "";
         try{
             passw = MD5Encryptor.usingMd5(newpass);
         } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                } catch (UnsupportedEncodingException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                }
         
         
          UserDAO dao = new UserDAO();
        try {

            EmailSender.sendEmail(mail, "mat khau moi cua ban la:" , newpass );
            dao.updatePasswordByEmail(mail, passw);
            
        } catch (MessagingException ex) {
            Logger.getLogger(EnterEmailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
