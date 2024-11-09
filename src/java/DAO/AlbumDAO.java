/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// AlbumDAO.java
package DAO;

import entity.Album;
import entity.Song;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AlbumDAO extends DBContext {

    // Get all albums for an artist
    public List<Album> getAlbumsByArtist(int artistID) throws SQLException {
        List<Album> albums = new ArrayList<>();
        String sql = "SELECT * FROM Album WHERE ArtistID = ?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setInt(1, artistID);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            Album album = new Album(
                    rs.getInt("AlbumID"),
                    rs.getString("AlbumName"),
                    rs.getDate("ReleaseDate"),
                    rs.getInt("ArtistID"),
                    rs.getDate("CreatedAt")
            );
            albums.add(album);
        }
        return albums;
    }

    public Album getAlbumById(int albumID) throws SQLException {
        String sql = "SELECT * FROM Album WHERE AlbumID = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, albumID);
            SongDAO songDAO = new SongDAO();
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    int artistID = rs.getInt("ArtistID");
                    String albumName = rs.getString("AlbumName");
                    Date releaseDate = rs.getDate("ReleaseDate");
                    Date createdAt = rs.getDate("CreatedAt");
                    List<Song> songs = songDAO.getSongsByAlbumId(albumID);
                    Album album = new Album(albumID, albumName, releaseDate, artistID, createdAt);
                    album.setListSong(songs);
                    return album;
                }
            }
        }
        return null;
    }

    // Create a new album
    public void createAlbum(Album album) throws SQLException {
        String sql = "INSERT INTO Album (AlbumName, ReleaseDate, ArtistID, CreatedAt) VALUES (?, ?, ?, ?)";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, album.getAlbumName());
        pre.setDate(2, new java.sql.Date(album.getReleaseDate().getTime()));
        pre.setInt(3, album.getArtistID());
        pre.setDate(4, new java.sql.Date(album.getCreatedAt().getTime()));
        pre.executeUpdate();
    }

    // Update an album
    public void updateAlbum(Album album) throws SQLException {
        String sql = "UPDATE Album SET AlbumName = ?, ReleaseDate = ? WHERE AlbumID = ?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, album.getAlbumName());
        pre.setDate(2, new java.sql.Date(album.getReleaseDate().getTime()));
        pre.setInt(3, album.getAlbumID());
        pre.executeUpdate();
    }

    // Delete an album
    public void deleteAlbum(int albumID) throws SQLException {
        String sql = "DELETE FROM Album WHERE AlbumID = ?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setInt(1, albumID);
        pre.executeUpdate();
    }
}
