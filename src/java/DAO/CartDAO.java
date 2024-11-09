package DAO;

import entity.Cart;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DBContext {

    public boolean addToCart(int clientID, int productID, int quantity) {
    String checkSql = "SELECT Quantity FROM Cart WHERE ClientID = ? AND ProductID = ?";
    String updateSql = "UPDATE Cart SET Quantity = Quantity + ? WHERE ClientID = ? AND ProductID = ?";
    String insertSql = "INSERT INTO Cart (ClientID, ProductID, Quantity, AddedAt) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
    
    try (PreparedStatement checkPs = connection.prepareStatement(checkSql)) {
        checkPs.setInt(1, clientID);
        checkPs.setInt(2, productID);
       
        ResultSet rs = checkPs.executeQuery();
        if (rs.next()) {
            try (PreparedStatement updatePs = connection.prepareStatement(updateSql)) {
                updatePs.setInt(1, quantity);
                updatePs.setInt(2, clientID);
                updatePs.setInt(3, productID);
                int rowsUpdated = updatePs.executeUpdate();
                return rowsUpdated > 0;
            }
        } else {
            try (PreparedStatement insertPs = connection.prepareStatement(insertSql)) {
                insertPs.setInt(1, clientID);
                insertPs.setInt(2, productID);
                insertPs.setInt(3, quantity);
                int rowsInserted = insertPs.executeUpdate();
                return rowsInserted > 0;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}


    public List<Cart> getCartItems(int clientID) {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM Cart WHERE ClientID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) { 
            ps.setInt(1, clientID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartID(rs.getInt("CartID"));
                    cart.setClientID(rs.getInt("ClientID"));
                    cart.setProductID(rs.getInt("ProductID"));
                    cart.setQuantity(rs.getInt("Quantity"));
                    cart.setAddedAt(rs.getTimestamp("AddedAt"));
                    cartItems.add(cart);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public void removeFromCart(int cartID) {
        String sql = "DELETE FROM Cart WHERE cartID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) { 
            ps.setInt(1, cartID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getCartItemsWithProductDetails(int clientID) {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT c.CartID, c.ProductID, c.Quantity, c.AddedAt, p.ProductName, p.ProductImage, p.Price, p.Description "
                + "FROM Cart c JOIN Product p ON c.ProductID = p.ProductID WHERE c.ClientID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, clientID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cart cartItem = new Cart();
                    cartItem.setCartID(rs.getInt("CartID"));
                    cartItem.setProductID(rs.getInt("ProductID"));
                    cartItem.setQuantity(rs.getInt("Quantity"));
                    cartItem.setAddedAt(rs.getTimestamp("AddedAt"));
                    
                    Product product = new Product();
                    product.setProductID(rs.getInt("ProductID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setProductImage(rs.getString("ProductImage"));
                    product.setPrice(rs.getBigDecimal("Price"));
                    product.setDescription(rs.getString("Description"));

                    cartItem.setProduct(product);
                    cartItems.add(cartItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public boolean updateQuantity(int cartID, int newQuantity) {
        String sql = "UPDATE Cart SET Quantity = ? WHERE CartID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) { 
            ps.setInt(1, newQuantity);
            ps.setInt(2, cartID);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
        public void clearCart(int clientID, Connection conn) throws SQLException {
        String deleteCartQuery = "DELETE FROM Cart WHERE ClientID = ?";
        try (PreparedStatement deleteCartStmt = conn.prepareStatement(deleteCartQuery)) {
            deleteCartStmt.setInt(1, clientID);
            deleteCartStmt.executeUpdate();
        }
    }
    
}
