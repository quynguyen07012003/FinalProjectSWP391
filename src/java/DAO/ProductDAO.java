package DAO;

import entity.EventDetails;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = """
        SELECT p.*, e.EventName, e.EventID 
        FROM Product p 
        LEFT JOIN EventDetails e ON p.EventID = e.EventID
        WHERE IsActive = 1
    """;

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getBigDecimal("Price"));
                product.setStock(rs.getInt("Stock"));
                product.setIsActive(rs.getBoolean("IsActive"));

                EventDetails event = null;
                int eventID = rs.getInt("EventID");
                if (!rs.wasNull()) {
                    event = new EventDetails();
                    event.setEventID(eventID);
                    event.setEventName(rs.getString("EventName"));
                }
                product.setEvent(event);

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String query = """
    SELECT p.*, e.EventName, e.EventID 
    FROM Product p 
    LEFT JOIN EventDetails e ON p.EventID = e.EventID 
    WHERE p.ProductName LIKE ?
    """;

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            String searchKeyword = "%" + keyword + "%";
            statement.setString(1, searchKeyword);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getBigDecimal("Price"));
                product.setStock(rs.getInt("Stock"));
                product.setIsActive(rs.getBoolean("IsActive"));

                EventDetails event = null;
                int eventID = rs.getInt("EventID");
                if (!rs.wasNull()) {
                    event = new EventDetails();
                    event.setEventID(eventID);
                    event.setEventName(rs.getString("EventName"));
                }
                product.setEvent(event);

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductByID(int productID) {
        Product product = null;
        String query = """
        SELECT p.*, e.EventName, e.EventID 
        FROM Product p 
        LEFT JOIN EventDetails e ON p.EventID = e.EventID 
        WHERE p.ProductID = ?
    """;

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getBigDecimal("Price"));
                product.setStock(rs.getInt("Stock"));
                product.setCreatedAt(rs.getDate("CreatedAt"));
                product.setIsActive(rs.getBoolean("IsActive"));

                // Kiểm tra sự kiện và gán thông tin sự kiện nếu có
                int eventID = rs.getInt("EventID");
                if (!rs.wasNull()) {
                    EventDetails event = new EventDetails();
                    event.setEventID(eventID);
                    event.setEventName(rs.getString("EventName"));
                    product.setEvent(event);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public boolean addProduct(Product product) {
        String query = "INSERT INTO Product (ProductName, ProductImage, Description, Price, Stock, EventID, IsActive) VALUES (?, ?, ?, ?, ?, ?, 1)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductImage());
            statement.setString(3, product.getDescription());
            statement.setBigDecimal(4, product.getPrice());
            statement.setInt(5, product.getStock());
            statement.setInt(6, product.getEventID());
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        String query = "UPDATE Product SET ProductName = ?, ProductImage = ?, Description = ?, Price = ?, Stock = ?, EventID = ? WHERE ProductID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductImage());
            statement.setString(3, product.getDescription());
            statement.setBigDecimal(4, product.getPrice());
            statement.setInt(5, product.getStock());
            statement.setInt(6, product.getEventID());
            statement.setInt(7, product.getProductID());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<EventDetails> getAllEvents() {
        List<EventDetails> events = new ArrayList<>();
        String query = "SELECT * FROM EventDetails";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                EventDetails event = new EventDetails();
                event.setEventID(rs.getInt("EventID"));
                event.setEventName(rs.getString("EventName"));
                event.setStartDate(rs.getDate("StartDate"));
                event.setEndDate(rs.getDate("EndDate"));
                event.setLocation(rs.getString("Location"));
                event.setDescription(rs.getString("Description"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public List<Product> getAllProductsWithEvent() {
        List<Product> products = new ArrayList<>();
        String query = """
        SELECT p.*, e.EventName, e.EventID 
        FROM Product p 
        LEFT JOIN EventDetails e ON p.EventID = e.EventID
    """;

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getBigDecimal("Price"));
                product.setStock(rs.getInt("Stock"));
                product.setIsActive(rs.getBoolean("IsActive"));

                // Kiểm tra xem có event không
                EventDetails event = null;
                int eventID = rs.getInt("EventID");
                if (!rs.wasNull()) {
                    event = new EventDetails();
                    event.setEventID(eventID);
                    event.setEventName(rs.getString("EventName"));
                }
                product.setEvent(event);

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean deactivateProduct(int productID) {
        String query = "UPDATE Product SET IsActive = 0 WHERE ProductID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productID);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean activateProduct(int productID) {
        String query = "UPDATE Product SET IsActive = 1 WHERE ProductID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productID);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getTotalProductCount() {
        String query = "SELECT COUNT(*) FROM Product";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public double getProductPrice(int productID, Connection conn) throws SQLException {
        String getProductPriceQuery = "SELECT Price FROM Product WHERE ProductID = ?";
        try (PreparedStatement priceStmt = conn.prepareStatement(getProductPriceQuery)) {
            priceStmt.setInt(1, productID);
            ResultSet rs = priceStmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("Price");
            } else {
                throw new SQLException("Product not found with ID: " + productID);
            }
        }
    }

    public void updateProductStock(int productID, int quantity, Connection conn) throws SQLException {
        String updateProductStockQuery = "UPDATE Product SET Stock = Stock - ? WHERE ProductID = ?";
        try (PreparedStatement updateStockStmt = conn.prepareStatement(updateProductStockQuery)) {
            updateStockStmt.setInt(1, quantity);
            updateStockStmt.setInt(2, productID);
            updateStockStmt.executeUpdate();
        }
    }

}
