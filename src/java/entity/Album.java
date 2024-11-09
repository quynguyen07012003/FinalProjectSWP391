/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;


import java.util.Date;
import java.util.List;

public class Album {
    private int albumID;
    private String albumName;
    private Date releaseDate;
    private int artistID;
    private Date createdAt;
     private List<Song> listSong; 

    public Album() {
    }

    public Album(int albumID, String albumName, Date releaseDate, int artistID, Date createdAt) {
        this.albumID = albumID;
        this.albumName = albumName;
        this.releaseDate = releaseDate;
        this.artistID = artistID;
        this.createdAt = createdAt;
    }

    public int getAlbumID() {
        return albumID;
    }

    public void setAlbumID(int albumID) {
        this.albumID = albumID;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public List<Song> getListSong() {
        return listSong;
    }

    public void setListSong(List<Song> listSong) {
        this.listSong = listSong;
    }
}