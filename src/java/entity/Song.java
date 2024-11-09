/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author HP
 */
public class Song {
    private int songID;
    private String songName;
    private String linkToSong;
    private Date releaseDate;
    private int artistID;
    private int albumID;
    private int genreID;
    private List<Genre> genres;

    public Song() {
    }

    public Song(int songID, String songName, String linkToSong, Date releaseDate, int artistID, int albumID, int genreID) {
        this.songID = songID;
        this.songName = songName;
        this.linkToSong = linkToSong;
        this.releaseDate = releaseDate;
        this.artistID = artistID;
        this.albumID = albumID;
        this.genreID = genreID;
    }

    
    public int getSongID() {
        return songID;
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getLinkToSong() {
        return linkToSong;
    }

    public void setLinkToSong(String linkToSong) {
        this.linkToSong = linkToSong;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public int getAlbumID() {
        return albumID;
    }

    public void setAlbumID(int albumID) {
        this.albumID = albumID;
    }

    public int getGenreID() {
        return genreID;
    }

    public void setGenreID(int genreID) {
        this.genreID = genreID;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }
    
     public String getGenreString() {
        if (genres == null || genres.isEmpty()) {
            return "No genres";
        }
        return genres.stream()
                     .map(Genre::getGenreName)
                     .collect(Collectors.joining(", ")); 
    }
}
