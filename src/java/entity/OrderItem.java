package entity;

import java.math.BigDecimal;

public class OrderItem {
    private int orderItemID;
    private int orderID;
    private int productID;
    private int quantity;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private Product product; 

    
    public OrderItem() {
    }

    public OrderItem(int orderItemID, int orderID, int productID, int quantity, BigDecimal price, Product product) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }

    public int getOrderItemID() {
        return orderItemID;
    }

    public void setOrderItemID(int orderItemID) {
        this.orderItemID = orderItemID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
