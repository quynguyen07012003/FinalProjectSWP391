/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Genre;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author HP
 */

public class GenreDAO extends DBContext {

    public List<Genre> getGenresByArtistId(int artistID) {
        List<Genre> genres = new ArrayList<>();
        Connection conn = connection;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT g.genre_id, g.genre_name FROM Genres g "
                    + "JOIN ArtistGenres ag ON g.genre_id = ag.genre_id "
                    + "WHERE ag.ArtistID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, artistID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Genre genre = new Genre(rs.getInt("genre_id"), rs.getString("genre_name"));
                genres.add(genre);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return genres;
    }

    public boolean addArtistGenre(String genreID,int artisID) {
        String query = "INSERT INTO [dbo].[ArtistGenres]\n" +
"           ([ArtistID]\n" +
"           ,[genre_id])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, artisID);
            statement.setString(2, genreID);
            
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Genre> getAllGenres() {
        List<Genre> genres = new ArrayList<>();
        String query = "SELECT * FROM Genres";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Genre genre = new Genre();
                genre.setGenreID(rs.getInt("genre_id"));
                genre.setGenreName(rs.getString("genre_name"));
                genres.add(genre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    public boolean addGenre(Genre genre) {
        String query = "INSERT INTO Genres (genre_name) VALUES (?)";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, genre.getGenreName());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Genre getGenreById(int genreID) {
        Genre genre = null;
        String query = "SELECT * FROM Genres WHERE genre_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, genreID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                genre = new Genre();
                genre.setGenreID(rs.getInt("genre_id"));
                genre.setGenreName(rs.getString("genre_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genre;
    }

    public boolean updateGenre(Genre genre) {
        String query = "UPDATE Genres SET genre_name = ? WHERE genre_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, genre.getGenreName());
            statement.setInt(2, genre.getGenreID());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteGenre(int genreID) {
        String query = "DELETE FROM Genres WHERE genre_id = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, genreID);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
