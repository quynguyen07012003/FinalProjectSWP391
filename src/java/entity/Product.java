package entity;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private int productID;
    private String productName;
    private String productImage;
    private String description;
    private BigDecimal price;
    private int stock;
    private int eventID;
    private boolean isActive;
    private Date createdAt;
    private EventDetails event;

    public Product() {
    }

    public Product(int productID, String productName, String productImage, String description, BigDecimal price, int stock, int eventID, boolean isActive, Date createdAt, EventDetails event) {
        this.productID = productID;
        this.productName = productName;
        this.productImage = productImage;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.eventID = eventID;
        this.isActive = isActive; // Khởi tạo giá trị isActive
        this.createdAt = createdAt;
        this.event = event;
    }

    public Product(String productName, String productImage, String description, BigDecimal price) {
        this.productName = productName;
        this.productImage = productImage;
        this.description = description;
        this.price = price;
    }
    
    

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public EventDetails getEvent() {
        return event;
    }

    public void setEvent(EventDetails event) {
        this.event = event;
    }

}
