/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author HP
 */
public class Cart {
    private int cartID;
    private int clientID;
    private int productID;
    private int quantity;
    private Date addedAt;
    private Product product;

    public Cart() {
    }

    public Cart(int cartID, int clientID, int productID, int quantity, Date addedAt) {
        this.cartID = cartID;
        this.clientID = clientID;
        this.productID = productID;
        this.quantity = quantity;
        this.addedAt = addedAt;
    }

    public Cart(int cartID, int clientID, int productID, int quantity) {
        this.cartID = cartID;
        this.clientID = clientID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public Cart(int cartID, Product product) {
        this.cartID = cartID;
        this.product = product;
    }
    
    
    

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
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

    public Date getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(Date addedAt) {
        this.addedAt = addedAt;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
