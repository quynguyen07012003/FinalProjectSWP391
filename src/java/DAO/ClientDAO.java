package DAO;

import entity.Client;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClientDAO extends DBContext {

    public Client getClientByUserID(String id) {

        String sql = "select * from Client where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Client client = new Client();
                client.setClientid(rs.getString("ClientID"));
                client.setClientname(rs.getString("ClientName"));
                client.setContactperson(rs.getString("ContactPerson"));
                client.setPhonenumber(rs.getString("PhoneNumber"));
                client.setEmail(rs.getString("Email"));
                client.setAddress(rs.getString("Address"));
                return client;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addClient(String clientName, String contactPerson, String phoneNumber, String email, String address, int userID) throws SQLException {
        String sql = "INSERT INTO [Client] (ClientName, ContactPerson, PhoneNumber, Email, Address, UserID, CreatedAt) VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, clientName);
            stmt.setString(2, contactPerson);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, email);
            stmt.setString(5, address);
            stmt.setInt(6, userID);
            stmt.executeUpdate();
            System.out.println("Thông tin Client đã được thêm thành công!");
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm Client: " + e.getMessage());
            throw e;
        }
    }

    public boolean updateClient(Client client) {
        String sql = "UPDATE Client SET ClientName=?, ContactPerson=?, PhoneNumber=?, Email=?, Address=? WHERE ClientID=?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, client.getClientname());
            ps.setString(2, client.getContactperson());
            ps.setString(3, client.getPhonenumber());
            ps.setString(4, client.getEmail());
            ps.setString(5, client.getAddress());
            ps.setString(6, client.getClientid());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String ClientID(String userID) {
        String sql = "SELECT c.ClientID FROM [User] AS u JOIN [Client] AS c ON u.UserID = c.UserID WHERE u.UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("ClientID"); // Trả về ClientID nếu tìm thấy
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }

        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }

}
