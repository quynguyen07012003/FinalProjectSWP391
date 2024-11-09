package entity;

import java.util.List;

public class Artist {
    private int artistID;
    private String artistName;
    private String stageName;
    private String bio;
    private String dateOfBirth;
    private String phoneNumber;
    private String email;
    private String image;
    private List<Genre> genres; 
    private int userId;
    private String facebook; 
    private String tiktok;   
    private String instagram; 
        private String website;
    private String twitter;

    public Artist() {
    }

    public Artist(int artistID, String artistName, String stageName, String bio, String dateOfBirth, String phoneNumber, String email, String image, List<Genre> genres, int userId, String facebook, String tiktok, String instagram) {
        this.artistID = artistID;
        this.artistName = artistName;
        this.stageName = stageName;
        this.bio = bio;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
        this.genres = genres;
        this.userId = userId;
        this.facebook = facebook;
        this.tiktok = tiktok;
        this.instagram = instagram;
    }
    


    public Artist(int artistID, String artistName, String stageName, String bio, String dateOfBirth, String phoneNumber, String email, String image, List<Genre> genres) {
        this.artistID = artistID;
        this.artistName = artistName;
        this.stageName = stageName;
        this.bio = bio;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
        this.genres = genres;
    }
    
    public Artist(int artistID, String artistName, String stageName, String bio, String dateOfBirth, String phoneNumber, String email, String image) {
        this.artistID = artistID;
        this.artistName = artistName;
        this.stageName = stageName;
        this.bio = bio;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
    }

    public Artist(int artistID, String artistName, String stageName, String bio, String dateOfBirth, String phoneNumber, String email, String image, int userId) {
        this.artistID = artistID;
        this.artistName = artistName;
        this.stageName = stageName;
        this.bio = bio;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
        this.userId = userId;
    }

    
    
    

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getTiktok() {
        return tiktok;
    }

    public void setTiktok(String tiktok) {
        this.tiktok = tiktok;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    @Override
    public String toString() {
        return "Artist{" + "artistID=" + artistID + ", artistName=" + artistName + ", stageName=" + stageName + ", bio=" + bio + ", dateOfBirth=" + dateOfBirth + ", phoneNumber=" + phoneNumber + ", email=" + email + ", image=" + image + ", genres=" + genres + ", userId=" + userId + ", facebook=" + facebook + ", tiktok=" + tiktok + ", instagram=" + instagram + ", website=" + website + ", twitter=" + twitter + '}';
    }
    
    
    
}
