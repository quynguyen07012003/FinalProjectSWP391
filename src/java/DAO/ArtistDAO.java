/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Artist;
import entity.Genre;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pheva
 */
public class ArtistDAO extends DBContext {

    public List<Artist> listAllArtist() throws SQLException {
        List<Artist> list = new ArrayList<>();
        String sql = "select * from Artist";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.executeQuery();
        ResultSet rs = pre.getResultSet();
        GenreDAO genreDAO = new GenreDAO();
        while (rs.next()) {

            List<Genre> genres = genreDAO.getGenresByArtistId(rs.getInt("ArtistID"));
            Artist artist = new Artist();
            artist.setArtistID(rs.getInt("ArtistID"));
            artist.setArtistName(rs.getString("ArtistName"));
            artist.setStageName(rs.getString("StageName"));
            artist.setBio(rs.getString("Bio"));
            artist.setDateOfBirth(rs.getString("DateOfBirth"));
            artist.setPhoneNumber(rs.getString("PhoneNumber"));
            artist.setEmail(rs.getString("Email"));
            artist.setImage(rs.getString("Image"));
            artist.setFacebook(rs.getString("facebook"));
            artist.setTiktok(rs.getString("tiktok"));
            artist.setInstagram(rs.getString("instagram"));
            artist.setWebsite(rs.getString("website"));
            artist.setTwitter(rs.getString("twitter"));
            artist.setUserId(rs.getInt("UserID"));
            artist.setGenres(genres);
            list.add(artist);
        }
        return list;
    }

    public List<Artist> searchArtistsByName(String search) throws SQLException {
        List<Artist> list = new ArrayList<>();
        String sql = "SELECT * FROM Artist WHERE ArtistName LIKE ? OR StageName LIKE ?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, "%" + search + "%");
        pre.setString(2, "%" + search + "%");
        ResultSet rs = pre.executeQuery();
        GenreDAO genreDAO = new GenreDAO();

        while (rs.next()) {
            List<Genre> genres = genreDAO.getGenresByArtistId(rs.getInt("ArtistID"));
            Artist artist = new Artist();
            artist.setArtistID(rs.getInt("ArtistID"));
            artist.setArtistName(rs.getString("ArtistName"));
            artist.setStageName(rs.getString("StageName"));
            artist.setBio(rs.getString("Bio"));
            artist.setDateOfBirth(rs.getString("DateOfBirth"));
            artist.setPhoneNumber(rs.getString("PhoneNumber"));
            artist.setEmail(rs.getString("Email"));
            artist.setImage(rs.getString("Image"));
            artist.setFacebook(rs.getString("facebook"));
            artist.setTiktok(rs.getString("tiktok"));
            artist.setInstagram(rs.getString("instagram"));
            artist.setWebsite(rs.getString("website"));
            artist.setTwitter(rs.getString("twitter"));
            artist.setUserId(rs.getInt("UserID"));
            artist.setGenres(genres);
            list.add(artist);
        }
        return list;
    }

    public Artist getArtistByID(String id) {

        String sql = "select * from Artist where ArtistID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                GenreDAO genreDAO = new GenreDAO();
                List<Genre> genres = genreDAO.getGenresByArtistId(Integer.parseInt(id));
                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                artist.setStageName(rs.getString("StageName"));
                artist.setBio(rs.getString("Bio"));
                artist.setDateOfBirth(rs.getString("DateOfBirth"));
                artist.setPhoneNumber(rs.getString("PhoneNumber"));
                artist.setEmail(rs.getString("Email"));
                artist.setImage(rs.getString("Image"));
                artist.setFacebook(rs.getString("facebook"));
                artist.setTiktok(rs.getString("tiktok"));
                artist.setInstagram(rs.getString("instagram"));
                artist.setWebsite(rs.getString("website"));
                artist.setTwitter(rs.getString("twitter"));
                artist.setUserId(rs.getInt("UserID"));
                artist.setGenres(genres);
                return artist;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Artist getArtistByUserID(String id) {

        String sql = "select * from Artist where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                GenreDAO genreDAO = new GenreDAO();
                List<Genre> genres = genreDAO.getGenresByArtistId(Integer.parseInt(id));
                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                artist.setStageName(rs.getString("StageName"));
                artist.setBio(rs.getString("Bio"));
                artist.setDateOfBirth(rs.getString("DateOfBirth"));
                artist.setPhoneNumber(rs.getString("PhoneNumber"));
                artist.setEmail(rs.getString("Email"));
                artist.setImage(rs.getString("Image"));
                artist.setFacebook(rs.getString("facebook"));
                artist.setTiktok(rs.getString("tiktok"));
                artist.setInstagram(rs.getString("instagram"));
                artist.setWebsite(rs.getString("website"));
                artist.setTwitter(rs.getString("twitter"));
                artist.setUserId(rs.getInt("UserID"));
                artist.setGenres(genres);
                return artist;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Artist> getAllArtistsByAgencyID(int agencyID) {
        List<Artist> artists = new ArrayList<>();
        String query = "SELECT * FROM Artist WHERE AgencyID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, agencyID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                artist.setStageName(rs.getString("StageName"));
                artist.setBio(rs.getString("Bio"));
                artist.setDateOfBirth(rs.getString("DateOfBirth"));
                artist.setPhoneNumber(rs.getString("PhoneNumber"));
                artist.setEmail(rs.getString("Email"));
                artist.setImage(rs.getString("Image"));
                artist.setFacebook(rs.getString("facebook"));
                artist.setTiktok(rs.getString("tiktok"));
                artist.setInstagram(rs.getString("instagram"));
                artist.setWebsite(rs.getString("website"));
                artist.setTwitter(rs.getString("twitter"));
                artists.add(artist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artists;
    }

    public boolean updateArtist(Artist artist) {
        String sql = "UPDATE Artist SET artistName=?, stageName=?, bio=?, dateOfBirth=?, email=?, image=? WHERE artistID=?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, artist.getArtistName());
            ps.setString(2, artist.getStageName());
            ps.setString(3, artist.getBio());
            ps.setString(4, artist.getDateOfBirth());
            ps.setString(5, artist.getEmail());
            ps.setString(6, artist.getImage());
            ps.setInt(7, artist.getArtistID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Artist> getArtistsByCompany(int companyID) {
        List<Artist> artists = new ArrayList<>();
        String query = "SELECT a.* FROM Artist a "
                + "JOIN Agent ag ON a.AgencyID = ag.AgentID "
                + "WHERE ag.CompanyID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, companyID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                artist.setStageName(rs.getString("StageName"));
                artist.setBio(rs.getString("Bio"));
                artist.setDateOfBirth(rs.getString("DateOfBirth"));
                artist.setPhoneNumber(rs.getString("PhoneNumber"));
                artist.setEmail(rs.getString("Email"));
                artist.setImage(rs.getString("Image"));
                artist.setFacebook(rs.getString("facebook"));
                artist.setTiktok(rs.getString("tiktok"));
                artist.setInstagram(rs.getString("instagram"));
                artist.setWebsite(rs.getString("website"));
                artist.setTwitter(rs.getString("twitter"));
                artists.add(artist);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return artists;
    }

    public static void main(String[] args) throws SQLException {
        ArtistDAO a = new ArtistDAO();
        List<Artist> list = a.listAllArtist();
        for (Artist r : list) {
            System.out.println(r.toString());
        }
    }

    public List<Artist> getAllArtists() throws SQLException {
        List<Artist> artists = new ArrayList<>();
        String query = "SELECT * FROM Artist";
        try (PreparedStatement stmt = connection.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Artist artist = new Artist();
                artist.setArtistID(rs.getInt("ArtistID"));
                artist.setArtistName(rs.getString("ArtistName"));
                artist.setStageName(rs.getString("StageName"));
                artist.setBio(rs.getString("Bio"));
                artist.setDateOfBirth(rs.getString("DateOfBirth"));
                artist.setPhoneNumber(rs.getString("PhoneNumber"));
                artist.setEmail(rs.getString("Email"));
                artist.setImage(rs.getString("Image"));
                artist.setFacebook(rs.getString("facebook"));
                artist.setTiktok(rs.getString("tiktok"));
                artist.setInstagram(rs.getString("instagram"));
                artist.setWebsite(rs.getString("website"));
                artist.setTwitter(rs.getString("twitter"));
                artists.add(artist);
            }
        }
        return artists;
    }

    public void updateArtistSocial(Artist artist) throws SQLException {
        String query = "UPDATE Artist SET facebook = ?, tiktok = ?, instagram = ?, website = ?, twitter = ? WHERE ArtistID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, artist.getFacebook());
            stmt.setString(2, artist.getTiktok());
            stmt.setString(3, artist.getInstagram());
            stmt.setString(4, artist.getWebsite());
            stmt.setString(5, artist.getTwitter());
            stmt.setInt(6, artist.getArtistID());
            stmt.executeUpdate();
        }
    }

}
