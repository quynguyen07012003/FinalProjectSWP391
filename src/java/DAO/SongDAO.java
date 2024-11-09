/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author HP
 */
import entity.Genre;
import entity.Song;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO extends DBContext {

    public List<Song> getSongs() {
        List<Song> songs = new ArrayList<>();
        String query = "SELECT * FROM Song order by SongId desc";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Song song = new Song();
                song.setSongID(rs.getInt("SongID"));
                song.setSongName(rs.getString("SongName"));
                song.setLinkToSong(rs.getString("LinkToSong"));
                song.setReleaseDate(rs.getDate("ReleaseDate"));
                song.setArtistID(rs.getInt("ArtistID"));
                song.setAlbumID(rs.getInt("AlbumID"));
                song.setGenreID(rs.getInt("genre_id"));
                song.setGenres(this.getGenresBySongID(rs.getInt("SongID")));
                songs.add(song);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }

    public List<Song> getSongsByArtistID(int artistID) {
        List<Song> songs = new ArrayList<>();
        String query = "SELECT * FROM Song where ArtistID=? order by SongId desc";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, artistID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Song song = new Song();
                song.setSongID(rs.getInt("SongID"));
                song.setSongName(rs.getString("SongName"));
                song.setLinkToSong(rs.getString("LinkToSong"));
                song.setReleaseDate(rs.getDate("ReleaseDate"));
                song.setArtistID(rs.getInt("ArtistID"));
                song.setAlbumID(rs.getInt("AlbumID"));
                song.setGenreID(rs.getInt("genre_id"));
                song.setGenres(this.getGenresBySongID(rs.getInt("SongID")));
                songs.add(song);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }

    private List<Genre> getGenresBySongID(int songID) throws SQLException {
        List<Genre> genres = new ArrayList<>();
        String genreQuery = "SELECT g.genre_id, g.genre_name FROM SongGenres sg "
                + "JOIN Genres g ON sg.genre_id = g.genre_id WHERE sg.SongID = ?";

        try (PreparedStatement genreStmt = connection.prepareStatement(genreQuery)) {
            genreStmt.setInt(1, songID);
            ResultSet genreRs = genreStmt.executeQuery();

            while (genreRs.next()) {
                Genre genre = new Genre();
                genre.setGenreID(genreRs.getInt("genre_id"));
                genre.setGenreName(genreRs.getString("genre_name"));
                genres.add(genre);
            }
        }
        return genres;
    }

    // Lấy tất cả các bài hát của một nghệ sĩ
    public List<Song> getSongsByArtist(int artistID) {
        List<Song> songs = new ArrayList<>();
        String query = "SELECT * FROM Song WHERE ArtistID = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, artistID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Song song = new Song();
                song.setSongID(rs.getInt("SongID"));
                song.setSongName(rs.getString("SongName"));
                song.setLinkToSong(rs.getString("LinkToSong"));
                song.setReleaseDate(rs.getDate("ReleaseDate"));
                song.setArtistID(rs.getInt("ArtistID"));
                song.setAlbumID(rs.getInt("AlbumID"));
                song.setGenreID(rs.getInt("genre_id"));
                song.setGenres(this.getGenresBySongID(rs.getInt("SongID")));
                songs.add(song);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }

    public List<Song> getSongsByAlbumId(int albumID) throws SQLException {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT * FROM Song WHERE AlbumID = ?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setInt(1, albumID);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            Song song = new Song();
            song.setSongID(rs.getInt("SongID"));
            song.setSongName(rs.getString("SongName"));
            song.setLinkToSong(rs.getString("LinkToSong"));
            song.setReleaseDate(rs.getDate("ReleaseDate"));
            song.setArtistID(rs.getInt("ArtistID"));
            song.setAlbumID(rs.getInt("AlbumID"));
            song.setGenreID(rs.getInt("genre_id"));
            song.setGenres(this.getGenresBySongID(rs.getInt("SongID")));
            songs.add(song);
        }
        return songs;
    }

    // Cập nhật thông tin bài hát
    public boolean updateSong(Song song) {
    String updateSongQuery = "UPDATE Song SET SongName = ?, LinkToSong = ?, ReleaseDate = ?, AlbumID = ? WHERE SongID = ?";
    try (PreparedStatement statement = connection.prepareStatement(updateSongQuery)) {
        connection.setAutoCommit(false);

        statement.setString(1, song.getSongName());
        statement.setString(2, song.getLinkToSong());
        statement.setDate(3, new java.sql.Date(song.getReleaseDate().getTime()));
        statement.setInt(4, song.getAlbumID());  // Added to update the AlbumID
        statement.setInt(5, song.getSongID());
        statement.executeUpdate();

        // Update genres as before
        removeGenresForSong(song.getSongID());
        List<Integer> genreIDs = new ArrayList<>();
        for (Genre genre : song.getGenres()) {
            genreIDs.add(genre.getGenreID());
        }
        addGenresForSong(song.getSongID(), genreIDs);

        connection.commit();
        return true;
    } catch (SQLException e) {
        e.printStackTrace();
        try {
            connection.rollback();
        } catch (SQLException rollbackEx) {
            rollbackEx.printStackTrace();
        }
    }
    return false;
}


    // Xóa tất cả các thể loại liên kết với bài hát
    private void removeGenresForSong(int songID) throws SQLException {
        String deleteGenreQuery = "DELETE FROM SongGenres WHERE SongID = ?";

        try (PreparedStatement statement = connection.prepareStatement(deleteGenreQuery)) {
            statement.setInt(1, songID);  // Đặt ID của bài hát vào truy vấn
            statement.executeUpdate();     // Thực thi câu lệnh xoá
        }
    }

    // Thêm các thể loại mới cho bài hát
    private void addGenresForSong(int songID, List<Integer> genreIDs) throws SQLException {
        String insertGenreQuery = "INSERT INTO SongGenres (SongID, genre_id) VALUES (?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(insertGenreQuery)) {
            for (int genreID : genreIDs) {
                statement.setInt(1, songID);
                statement.setInt(2, genreID);
                statement.executeUpdate();
            }
        }
    }

    // Lấy bài hát theo ID
    public Song getSongByID(int songID) {
        Song song = null;
        String query = "SELECT * FROM Song WHERE SongID = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, songID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                song = new Song();
                song.setSongID(rs.getInt("SongID"));
                song.setSongName(rs.getString("SongName"));
                song.setLinkToSong(rs.getString("LinkToSong"));
                song.setReleaseDate(rs.getDate("ReleaseDate"));
                song.setArtistID(rs.getInt("ArtistID"));
                song.setAlbumID(rs.getInt("AlbumID"));
                song.setGenreID(rs.getInt("genre_id"));
                song.setGenres(this.getGenresBySongID(rs.getInt("SongID")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return song;
    }

    public boolean deleteSong(int songID) {
        boolean rowDeleted = false;

        try {
            deleteGenresForSong(songID);
            String query = "DELETE FROM Song WHERE SongID = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, songID);
                rowDeleted = statement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }

    private void deleteGenresForSong(int songID) throws SQLException {
        String deleteGenreQuery = "DELETE FROM SongGenres WHERE SongID = ?";
        try (PreparedStatement statement = connection.prepareStatement(deleteGenreQuery)) {
            statement.setInt(1, songID);
            statement.executeUpdate();
        }
    }

    public int addSong(Song song) {
        String query = "INSERT INTO Song (SongName, LinkToSong, ReleaseDate, ArtistID, AlbumID, genre_id) VALUES (?, ?, ?, ?, ?, ?)";
        int generatedSongID = -1;

        try (
                PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, song.getSongName());
            statement.setString(2, song.getLinkToSong());
            statement.setDate(3, new java.sql.Date(song.getReleaseDate().getTime()));
            statement.setInt(4, song.getArtistID());
            statement.setInt(5, song.getAlbumID());
            statement.setInt(6, song.getGenreID());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedSongID = generatedKeys.getInt(1);
                    }
                }

                if (generatedSongID > 0 && song.getGenres() != null) {
                    List<Integer> listGenres = new ArrayList<>();
                    for (Genre genre : song.getGenres()) {
                        listGenres.add(genre.getGenreID());
                    }
                    addGenresForSong(generatedSongID, listGenres);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedSongID;
    }

}
