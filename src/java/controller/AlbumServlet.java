package controller;

import DAO.AlbumDAO;
import entity.Album;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AlbumServlet", urlPatterns = {"/album"})
public class AlbumServlet extends HttpServlet {

    private AlbumDAO albumDAO;

    @Override
    public void init() {
        albumDAO = new AlbumDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "view";
        String err = "";
        try {
            if ("view".equals(action)) {
                try {
                    int artistID = Integer.parseInt(request.getParameter("artistID"));
                    List<Album> albums = albumDAO.getAlbumsByArtist(artistID);
                    request.setAttribute("albums", albums);
                    request.getRequestDispatcher("album_list.jsp").forward(request, response);
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }

            } else if ("edit".equals(action)) {
                try {
                    int albumID = Integer.parseInt(request.getParameter("albumID"));
                    Album album = albumDAO.getAlbumById(albumID);
                    if (album != null) {
                        request.setAttribute("album", album);
                        request.setAttribute("artistID", album.getArtistID());
                        request.getRequestDispatcher("album_form.jsp").forward(request, response);
                    } else {
                        request.setAttribute("Album not found", err);
                    }
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            } else if ("delete".equals(action)) {
                try {
                    int albumID = Integer.parseInt(request.getParameter("albumID"));
                    albumDAO.deleteAlbum(albumID);
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            } else if ("detail".equals(action)) {
                try {
                    int albumID = Integer.parseInt(request.getParameter("albumID"));
                    Album album = albumDAO.getAlbumById(albumID);
                    if (album != null) {
                        request.setAttribute("album", album);
                        request.getRequestDispatcher("album_detail.jsp").forward(request, response);
                    } else {
                        request.setAttribute("Album not found", err);
                    }
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            } else {
                try {
                    request.getRequestDispatcher("album_form.jsp").forward(request, response);
                } catch (Exception e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("create".equals(action)) {
                try {
                    String albumName = request.getParameter("albumName");
                    String releaseDateStr = request.getParameter("releaseDate"); 
                    int artistID = Integer.parseInt(request.getParameter("artistID"));
                    Album album = new Album(0, albumName, java.sql.Date.valueOf(releaseDateStr), artistID, new Date());
                    albumDAO.createAlbum(album);
                    response.sendRedirect("album?action=view&artistID=" + artistID);
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            } else if ("update".equals(action)) {
                try {
                    int albumID = Integer.parseInt(request.getParameter("albumID"));
                    String albumName = request.getParameter("albumName");
                    String releaseDateStr = request.getParameter("releaseDate"); 

                    Album album = new Album(albumID, albumName, java.sql.Date.valueOf(releaseDateStr), 0, null);
                    albumDAO.updateAlbum(album);
                    response.sendRedirect("album?action=view&artistID=" + request.getParameter("artistID"));
                } catch (SQLException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                } catch (NumberFormatException e) {
                    Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(AlbumServlet.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
