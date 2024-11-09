/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.GenreDAO;
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
import util.EmailSender;
import util.MD5Encryptor;
import util.StringEncoderDecoder;

@WebServlet(name = "SignUp", urlPatterns = {"/register"})
public class SignUp extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Kiểm tra mật khẩu có khớp không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Tạo một DAO để tương tác với cơ sở dữ liệu
        UserDAO dao = new UserDAO();
        GenreDAO genreDAO = new GenreDAO();
        try {
            // Kiểm tra xem tên người dùng đã tồn tại chưa
            if (dao.isUsernameExist(username)) {
                request.setAttribute("errorMessage", "Username already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }
            String clientEmail = request.getParameter("clientEmail");
            String artistEmail = request.getParameter("artistEmail");
            String agentEmail = request.getParameter("agentEmail");

            String userEmail = "";
            if (clientEmail != null && !clientEmail.isEmpty()) {
                userEmail = clientEmail;
            } else if (artistEmail != null && !artistEmail.isEmpty()) {
                userEmail = artistEmail;
            } else if (agentEmail != null && !agentEmail.isEmpty()) {
                userEmail = agentEmail;
            }
            if (dao.isEmailExist(userEmail)) {
                request.setAttribute("errorMessage", "Email already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }

            // Thêm người dùng chung vào bảng User
            String passw = "";
                try {
                    passw = MD5Encryptor.usingMd5(password);
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                } catch (UnsupportedEncodingException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                }
            int userId = dao.addUser(username, passw, userEmail, username, getRoleId(role));

            // Xử lý theo vai trò người dùng
            switch (role) {
                case "client":
                    String clientName = request.getParameter("clientName");
                    String clientPhone = request.getParameter("clientPhone");
                    dao.addClient(clientName, "", clientPhone, clientEmail, "", userId);
                    request.setAttribute("successMessage", "Client registered successfully!");
                    break;
                case "artist":
                    String artistName = request.getParameter("artistName");
                    String stageName = request.getParameter("stageName");
                    String artistPhone = request.getParameter("artistPhone");
                    String artistGenreID =  request.getParameter("genreID");
                    String artistBio = request.getParameter("artistBio");
                    String agentId = request.getParameter("agentID");
                    dao.addArtist(artistName, stageName, artistPhone, artistEmail , artistBio, userId);
                    
                    genreDAO.addArtistGenre(artistGenreID,dao.getArtistID(artistEmail));
                    request.setAttribute("successMessage", "Artist registered successfully!");
                    break;
                case "agent":
                    String agentName = request.getParameter("agentName");
                    String agentPhone = request.getParameter("agentPhone");
                    String agentAddress = request.getParameter("agentAddress");
                    String companyID = request.getParameter("companyID");
                    dao.addAgent(agentName, agentPhone, agentEmail, agentAddress, userId, companyID);
                    request.setAttribute("successMessage", "Agent registered successfully!");
                    break;
                    
                default:
                    request.setAttribute("errorMessage", "Invalid role selected.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                    return;
            }
            String contextPath = request.getContextPath();
            String verificationLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/verify?id=" + StringEncoderDecoder.encode(userId+"");

            EmailSender.sendEmail(userEmail, "Verify account click to link", verificationLink);

            // Chuyển hướng đến trang thành công sau khi đăng ký
            request.getRequestDispatcher("waitting.jsp").forward(request, response);

            // Chuyển hướng đến trang thành công sau khi đăng ký

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

    }
    
    private int getRoleId(String role) {
        switch (role) {
            case "client":
                return 2;
            case "artist":
                return 4;
            case "agent":
                return 3;
            default:
                return 1;
        }
    }

}
