package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderItemDAO extends DBContext{
    public void addOrderItem(int orderID, int productID, int quantity, double price, Connection conn) throws SQLException {
        String query = "INSERT INTO OrderItem (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement orderItemStmt = conn.prepareStatement(query)) {
            orderItemStmt.setInt(1, orderID);
            orderItemStmt.setInt(2, productID);
            orderItemStmt.setInt(3, quantity);
            orderItemStmt.setDouble(4, price);
            orderItemStmt.executeUpdate();
        }
    }
}

