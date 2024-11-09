package DAO;

import entity.Cart;
import entity.Order;
import entity.OrderItem;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext {

    CartDAO cartDAO = new CartDAO();
    ProductDAO productDAO = new ProductDAO();
    OrderItemDAO orderItemDAO = new OrderItemDAO();

    public List<Order> getOrdersByClientID(String clientID) {
        List<Order> orders = new ArrayList<>();
        String query = """
                SELECT 
                    o.OrderID, o.ClientID, o.OrderDate, o.TotalAmount, o.Status,
                    oi.OrderItemID, oi.Quantity,
                    p.ProductName, p.ProductImage, p.Price AS ProductPrice
                FROM 
                    [Order] o
                JOIN 
                    [OrderItem] oi ON o.OrderID = oi.OrderID
                JOIN 
                    [Product] p ON oi.ProductID = p.ProductID
                WHERE 
                    o.ClientID = ?
                ORDER BY 
                    o.OrderDate DESC;
                """;

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, clientID);
            ResultSet rs = ps.executeQuery();

            Order currentOrder = null;
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");

                if (currentOrder == null || currentOrder.getOrderID() != orderID) {
                    currentOrder = new Order();
                    currentOrder.setOrderID(orderID);
                    currentOrder.setClientID(rs.getInt("ClientID"));
                    currentOrder.setOrderDate(rs.getDate("OrderDate"));
                    currentOrder.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    currentOrder.setStatus(rs.getString("Status"));
                    currentOrder.setOrderItems(new ArrayList<>());

                    orders.add(currentOrder);
                }

                OrderItem item = new OrderItem();
                item.setOrderItemID(rs.getInt("OrderItemID"));
                item.setQuantity(rs.getInt("Quantity"));

                Product product = new Product();
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                item.setPrice(rs.getBigDecimal("ProductPrice"));

                item.setProduct(product);
                currentOrder.getOrderItems().add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void processOrder(int clientID, double totalPrice, List<Cart> cartItems) throws SQLException {
        String orderStatus = "Chờ Xử Lý";
        double orderTotalAmount = totalPrice;

        try (Connection conn = connection) {
            conn.setAutoCommit(false);

            try {
                int orderID = createOrder(clientID, orderTotalAmount, orderStatus, conn);

                for (Cart item : cartItems) {
                    int productID = item.getProductID();
                    int quantity = item.getQuantity();
                    double price = productDAO.getProductPrice(productID, conn);

                    orderItemDAO.addOrderItem(orderID, productID, quantity, price, conn);

                    productDAO.updateProductStock(productID, quantity, conn);
                }

                cartDAO.clearCart(clientID, conn);

                conn.commit(); 
            } catch (SQLException e) {
                conn.rollback(); 
                throw e;
            }
        }
    }

    public int createOrder(int clientID, double totalAmount, String status, Connection conn) throws SQLException {
        String insertOrderQuery = "INSERT INTO [Order] (ClientID, OrderDate, TotalAmount, Status) VALUES (?, GETDATE(), ?, ?)";
        try (PreparedStatement orderStmt = conn.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
            orderStmt.setInt(1, clientID);
            orderStmt.setDouble(2, totalAmount);
            orderStmt.setString(3, status);
            orderStmt.executeUpdate();

            ResultSet rs = orderStmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("Failed to create order, no ID obtained.");
            }
        }
    }

    public boolean updateOrderStatus(int orderID, String newStatus) {
        String query = "UPDATE [Order] SET Status = ? WHERE OrderID = ?";
        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderID);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = """
            SELECT 
                o.OrderID, o.ClientID, o.OrderDate, o.TotalAmount, o.Status,
                oi.OrderItemID, oi.Quantity,
                p.ProductName, p.ProductImage, p.Price AS ProductPrice
            FROM 
                [Order] o
            JOIN 
                [OrderItem] oi ON o.OrderID = oi.OrderID
            JOIN 
                [Product] p ON oi.ProductID = p.ProductID
            ORDER BY 
                o.OrderDate DESC;
            """;

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();

            Order currentOrder = null;
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");

                if (currentOrder == null || currentOrder.getOrderID() != orderID) {
                    currentOrder = new Order();
                    currentOrder.setOrderID(orderID);
                    currentOrder.setClientID(rs.getInt("ClientID"));
                    currentOrder.setOrderDate(rs.getDate("OrderDate"));
                    currentOrder.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    currentOrder.setStatus(rs.getString("Status"));
                    currentOrder.setOrderItems(new ArrayList<>());

                    orders.add(currentOrder);
                }

                OrderItem item = new OrderItem();
                item.setOrderItemID(rs.getInt("OrderItemID"));
                item.setQuantity(rs.getInt("Quantity"));
                item.setPrice(rs.getBigDecimal("ProductPrice")); 

                Product product = new Product();
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                product.setPrice(rs.getBigDecimal("ProductPrice")); 

                item.setProduct(product);
                currentOrder.getOrderItems().add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    public List<Order> getOrdersByStatusClientID(String clientID, String status) {
        List<Order> orders = new ArrayList<>();
        String query = """
                SELECT 
                    o.OrderID, o.ClientID, o.OrderDate, o.TotalAmount, o.Status,
                    oi.OrderItemID, oi.Quantity,
                    p.ProductName, p.ProductImage, p.Price AS ProductPrice
                FROM 
                    [Order] o
                JOIN 
                    [OrderItem] oi ON o.OrderID = oi.OrderID
                JOIN 
                    [Product] p ON oi.ProductID = p.ProductID
                WHERE 
                    o.ClientID = ? and o.Status = ?
                ORDER BY 
                    o.OrderDate DESC;
                """;

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, clientID);
            ps.setString(2, status);
            ResultSet rs = ps.executeQuery();

            Order currentOrder = null;
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");

                if (currentOrder == null || currentOrder.getOrderID() != orderID) {
                    currentOrder = new Order();
                    currentOrder.setOrderID(orderID);
                    currentOrder.setClientID(rs.getInt("ClientID"));
                    currentOrder.setOrderDate(rs.getDate("OrderDate"));
                    currentOrder.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    currentOrder.setStatus(rs.getString("Status"));
                    currentOrder.setOrderItems(new ArrayList<>());

                    orders.add(currentOrder);
                }

                OrderItem item = new OrderItem();
                item.setOrderItemID(rs.getInt("OrderItemID"));
                item.setQuantity(rs.getInt("Quantity"));

                Product product = new Product();
                product.setProductName(rs.getString("ProductName"));
                product.setProductImage(rs.getString("ProductImage"));
                item.setPrice(rs.getBigDecimal("ProductPrice"));

                item.setProduct(product);
                currentOrder.getOrderItems().add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    

}
