package controller;

import DAO.AlbumDAO;
import DAO.GenreDAO;
import DAO.SongDAO;
import entity.Album;
import entity.Genre;
import entity.Song;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/song")
public class SongServlet extends HttpServlet {

    private SongDAO songDAO = new SongDAO();
    private GenreDAO genreDAO = new GenreDAO();
    private AlbumDAO albumDAO = new AlbumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "view";
        if ("edit".equals(action)) {
            try {
                int songID = Integer.parseInt(request.getParameter("id"));
                Song song = songDAO.getSongByID(songID);
                List<Genre> genres = genreDAO.getAllGenres();
                List<Album> albums = albumDAO.getAlbumsByArtist(song.getArtistID());
                request.setAttribute("song", song);
                request.setAttribute("genres", genres);
                request.setAttribute("albums", albums);
                request.getRequestDispatcher("editSong.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SongServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("view".equals(action)) {
            int artistID = Integer.parseInt(request.getParameter("artistID"));
            request.setAttribute("artistID", artistID);
            List<Song> songs = songDAO.getSongsByArtist(artistID);
            request.setAttribute("songs", songs);
            request.getRequestDispatcher("viewSongs.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            try {
                int artistID = Integer.parseInt(request.getParameter("artistID"));
                List<Genre> genres = genreDAO.getAllGenres();
                List<Album> albums = albumDAO.getAlbumsByArtist(artistID);
                request.setAttribute("genres", genres);
                request.setAttribute("albums", albums);
                request.setAttribute("artistID", artistID);
                request.getRequestDispatcher("addSong.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("delete".equals(action)) {
            try {
                int songID = Integer.parseInt(request.getParameter("id"));
                Song song = songDAO.getSongByID(songID);
                songDAO.deleteSong(songID);
                response.sendRedirect("song?action=view&artistID=" + song.getArtistID());
            } catch (Exception e) {
                Logger.getLogger(SongServlet.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            int songID = Integer.parseInt(request.getParameter("songID"));
            String songName = request.getParameter("songName");
            String linkToSong = request.getParameter("linkToSong");
            Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
            int albumID = Integer.parseInt(request.getParameter("albumID"));

            String[] selectedGenreIDs = request.getParameterValues("genreIDs");

            Song song = new Song();
            song.setSongID(songID);
            song.setSongName(songName);
            song.setLinkToSong(linkToSong);
            song.setReleaseDate(releaseDate);
            song.setAlbumID(albumID);
            
            List<Genre> genres = new ArrayList<>();
            if (selectedGenreIDs != null) {
                for (String genreID : selectedGenreIDs) {
                    Genre genre = new Genre();
                    genre.setGenreID(Integer.parseInt(genreID));
                    genres.add(genre);
                }
            }
            song.setGenres(genres);

            songDAO.updateSong(song);
            response.sendRedirect("song?action=view&artistID=" + request.getParameter("artistID"));
        } else if ("add".equals(action)) {
            try {
                String songName = request.getParameter("songName");
                String linkToSong = request.getParameter("linkToSong");
                Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
                int artistID = Integer.parseInt(request.getParameter("artistID"));
                int albumID = Integer.parseInt(request.getParameter("albumID"));
                String[] selectedGenreIDs = request.getParameterValues("genreIDs");
                Song song = new Song();
                song.setSongName(songName);
                song.setLinkToSong(linkToSong);
                song.setReleaseDate(releaseDate);
                song.setArtistID(artistID);
                song.setAlbumID(albumID);

                if (albumID != 0) {
                    song.setAlbumID(albumID);
                }

                List<Genre> genres = new ArrayList<>();
                if (selectedGenreIDs != null) {
                    for (String genreID : selectedGenreIDs) {
                        Genre genre = new Genre();
                        genre.setGenreID(Integer.parseInt(genreID));
                        genres.add(genre);
                    }
                }
                song.setGenres(genres);

                songDAO.addSong(song);
                response.sendRedirect("song?action=view&artistID=" + artistID);
            } catch (Exception e) {
                Logger.getLogger(SongServlet.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

}
