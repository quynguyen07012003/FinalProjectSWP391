/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ArtistDAO;
import entity.Account;
import entity.Artist;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import util.Upload;

@WebServlet("/updateArtist")
@MultipartConfig
public class UpdateArtistServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int artistID = Integer.parseInt(request.getParameter("artistID"));
        String artistName = request.getParameter("artistName");
        String stageName = request.getParameter("stageName");
        String email = request.getParameter("email");
        String dateOfBirth = request.getParameter("dob");
        String bio = request.getParameter("bio");
        int userID = Integer.parseInt(request.getParameter("userID"));

        String oldImage = request.getParameter("oldImage");

        String errorMessage = "";
        if (artistName == null || artistName.isEmpty()) {
            errorMessage += "Full Name is required.<br/>";
        }
        if (stageName == null || stageName.isEmpty()) {
            errorMessage += "Stage Name is required.<br/>";
        }
        if (email == null || email.isEmpty()) {
            errorMessage += "Email is required.<br/>";
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            errorMessage += "Invalid email format.<br/>";
        }
        if (dateOfBirth == null || dateOfBirth.isEmpty()) {
            errorMessage += "Date of Birth is required.<br/>";
        }

        if (!errorMessage.isEmpty()) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("artist", new Artist(artistID, artistName, stageName, bio, dateOfBirth, null, email, oldImage));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        Part imagePart = request.getPart("image");
        String fileName = extractFileName(imagePart);
        String filePath = "./uploads/artist";
        Upload upload = new Upload();
        String uploadPath = getServletContext().getRealPath(filePath);
        String newFile = upload.uploadFile(imagePart, uploadPath);
        String namePathSaveDB = (newFile != null) ? filePath + "/" + newFile : oldImage;

        Artist artist = new Artist(artistID, artistName, stageName, bio, dateOfBirth, null, email, namePathSaveDB,userID);
        ArtistDAO artistDAO = new ArtistDAO();
        boolean isUpdated = artistDAO.updateArtist(artist);

        if (isUpdated) {
            response.sendRedirect("profileArtist?pid=" + userID);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null || (account != null && !account.getRole().equals("4"))) {
            response.sendRedirect("logingg.jsp");
            return;
        }
        ArtistDAO artistDAO = new ArtistDAO();
        Artist artist = artistDAO.getArtistByUserID(account.getId()+ "");
        if (artist != null) {
            request.setAttribute("artist", artist);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
    
}
