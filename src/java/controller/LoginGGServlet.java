
package controller;

import DAO.ClientDAO;
import util.GoogleLogin;
import DAO.UserDAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 */
public class LoginGGServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        Account acc = gg.getUserInfo(accessToken);
        System.out.println(acc);
        UserDAO udao = new UserDAO();
        ClientDAO cdao = new ClientDAO();
        try {

            int userID = udao.getUserIDByEmail(acc.getEmail());

            if (cdao.getClientByUserID(acc.getEmail()) == null) {
                cdao.addClient("", "", "", acc.getEmail(), "", userID);
                System.out.println("Thông tin Client đã được thêm vào cơ sở dữ liệu.");
            } else {
                System.out.println("Client đã tồn tại trong cơ sở dữ liệu.");
            }

            // Đặt thuộc tính phiên
            HttpSession session = request.getSession();
            session.setAttribute("acc", acc);
            System.out.println("Quá trình đăng nhập hoàn tất.");
        } catch (Exception e) {
            System.out.println("Lỗi khi xử lý thông tin người dùng: " + e.getMessage());
        }
        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
