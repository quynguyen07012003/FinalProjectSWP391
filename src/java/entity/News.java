package entity;

import java.util.Date;

public class News {
    private int newsID;
    private String title;
    private String content;
    private int authorID;
    private String status;
    private Date createdAt;
    private Account author;
    private String imagePath;
    // Constructors
    public News() {}

    public News(int newsID, String title, String content, int authorID, String status, Date createdAt, String imagePath) {
        this.newsID = newsID;
        this.title = title;
        this.content = content;
        this.authorID = authorID;
        this.status = status;
        this.createdAt = createdAt;
        this.imagePath = imagePath;
    }

    public News(int newsID, String title, String content, int authorID, String status, Date createdAt) {
        this.newsID = newsID;
        this.title = title;
        this.content = content;
        this.authorID = authorID;
        this.status = status;
        this.createdAt = createdAt;
    }

    public News(String title, String content, int authorID, String status) {
        this.title = title;
        this.content = content;
        this.authorID = authorID;
        this.status = status;
    }
    

    

    // Getters and Setters
    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Account getAuthor() {
        return author;
    }

    public void setAuthor(Account author) {
        this.author = author;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    
    
}
