package controller;

import DAO.ClientDAO;
import entity.Account;
import entity.Client;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name="UpdateClientServlet", urlPatterns={"/updateClient"})
@MultipartConfig
public class UpdateClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String clientID = request.getParameter("clientID");
        String clientName = request.getParameter("clientName");
        String contactPerson = request.getParameter("contactPerson");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String userID = request.getParameter("userID");
        
        String errorMessage = "";
        if (clientName == null || clientName.isEmpty()) {
            errorMessage += "Client Name is required.<br/>";
        }
        if (contactPerson == null || contactPerson.isEmpty()) {
            errorMessage += "Contact Person is required.<br/>";
        }
        if (email == null || email.isEmpty()) {
            errorMessage += "Email is required.<br/>";
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            errorMessage += "Invalid email format.<br/>";
        }
        if (phonenumber == null || phonenumber.isEmpty()) {
            errorMessage += "Phone Number is required.<br/>";
        }
        if (address == null || address.isEmpty()) {
            errorMessage += "Address is required.<br/>";
        }
        
        if (!errorMessage.isEmpty()) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("client", new Client(clientID, clientName, contactPerson, phonenumber, email, address));
            request.getRequestDispatcher("profileClient.jsp").forward(request, response);
            return;
        }
        Client client = new Client(clientID, clientName, contactPerson, phonenumber, email, address,userID);
        ClientDAO clientDAO = new ClientDAO();
        boolean isUpdated = clientDAO.updateClient(client);
        if (isUpdated) {
            response.sendRedirect("profileClient?pid=" +acc.getId());
        } else {
            response.sendRedirect("error.jsp");
        }
    }

}
