package DAO;

import entity.Account;
import entity.GoogleAccount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public boolean updatePasswordByEmail(String email, String newPassword) {

        String query = "UPDATE [dbo].[User]\n"
                + "   SET \n"
                + "      [PasswordHash] = ? \n"
                + "    \n"
                + " WHERE Email = ?";

        try (
                PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, newPassword);  // Lưu mật khẩu mã hóa vào cơ sở dữ liệu
            pstmt.setString(2, email);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Phương thức kiểm tra email đã tồn tại hay chưa
    public boolean isEmailExist(String email) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE Email = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Nếu count > 0, nghĩa là email đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Phương thức lưu người dùng Google (chỉ khi email chưa tồn tại)
    public void saveUserLogingg(String email, String fullName, boolean is_verified, String roleID) {
        // Kiểm tra xem email đã tồn tại hay chưa
        if (isEmailExist(email)) {
            System.out.println("Email đã tồn tại, không lưu lại.");
            return; 
        }

        // Nếu email chưa tồn tại, tiếp tục lưu thông tin người dùng mới
        String sql = "INSERT INTO [User](Email, FullName, is_verified, RoleID) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, fullName);
            pre.setBoolean(3, is_verified);
            pre.setString(4, roleID);
            pre.executeUpdate();
            System.out.println("Lưu thông tin người dùng thành công!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Kiểm tra xem tên người dùng đã tồn tại chưa

    public boolean isUsernameExist(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM [User] WHERE Username = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, username);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Tên người dùng đã tồn tại nếu count > 0
                }
            }
        }
        return false;
    }

    public int getUserIDByEmail(String email) {
        String sql = "SELECT UserID FROM [User] WHERE Email = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt("UserID"); // Trả về userID tương ứng
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu không tìm thấy
    }

    // Thêm người dùng mới vào bảng User
    public int addUser(String username, String passwordHash, String email, String fullName, int roleID) throws SQLException {
        String sql = "INSERT INTO [User] (Username, PasswordHash, Email, FullName, RoleID, is_verified, image, CreatedAt) "
                + "VALUES (?, ?, ?, ?, ?, 0, NULL, GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, username);
            stmt.setString(2, passwordHash);
            stmt.setString(3, email);
            stmt.setString(4, fullName);
            stmt.setInt(5, roleID);

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);  
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        }
    }

    // Thêm thông tin client vào bảng Client
    public void addClient(String clientName, String contactPerson, String phoneNumber, String email, String address, int userID) throws SQLException {
        String sql = "INSERT INTO [Client] (ClientName, ContactPerson, PhoneNumber, Email, Address, UserID, CreatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, clientName);
            stmt.setString(2, contactPerson);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, email);
            stmt.setString(5, address);
            stmt.setInt(6, userID);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error adding client: " + e.getMessage(), e);
        }
    }

    public void addArtist(String artistName, String stageName, String phoneNumber, String email,  String bio, String userID, String agentId) throws SQLException {
        String sql = "INSERT INTO [Artist] (ArtistName, StageName, PhoneNumber, Email, Bio, UserID,AgencyID, CreatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, artistName);
            stmt.setString(2, stageName);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, email);
            stmt.setString(5, bio);
            stmt.setString(6, userID);
            stmt.setString(7, agentId);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error adding artist: " + e.getMessage(), e);
        }
    }

    public int getArtistID(String email) {
        int artistID = -1;  // Giá trị mặc định nếu không tìm thấy artist

        String query = "SELECT [ArtistID]\n"
                + "     \n"
                + "  FROM [dbo].[Artist] where Email = (?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                artistID = resultSet.getInt("ArtistID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artistID;
    }

    // Thêm thông tin agent vào bảng Agent
    public void addAgent(String agentName, String phoneNumber, String email, String address, int userID, String companyId) throws SQLException {
        String sql = "INSERT INTO [Agent] (AgentName, PhoneNumber, Email, Address, UserID, companyId,CreatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?,GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, agentName);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, email);
            stmt.setString(4, address);
            stmt.setInt(5, userID);
            stmt.setString(6, companyId);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error adding agent: " + e.getMessage(), e);
        }
    }

    public void updateUserVerify(int userID) throws SQLException {
        String sql = "UPDATE [User] SET is_verified = 1 WHERE UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userID);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cập nhật trạng thái xác thực thành công cho UserID: " + userID);
            } else {
                System.out.println("Không tìm thấy người dùng với UserID: " + userID);
            }
        } catch (SQLException e) {
            throw new SQLException("Error updating user verification status: " + e.getMessage(), e);
        }
    }

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE RoleID in (2, 3, 4)";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                String fullname = rs.getString("FullName");
                String roleID = rs.getString("RoleID");
                boolean status = rs.getBoolean("is_verified");
                list.add(new Account(id, username, email, fullname, roleID, status));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving artist: " + e.getMessage());
        }
        return list;
    }

    public Account getAccountByUsername(String username) {
        Account a = new Account();
        String sql = "select * from [User] where Username = ? ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String id = rs.getString("UserID");
                String email = rs.getString("Email");
                String fullname = rs.getString("FullName");
                String roleID = rs.getString("RoleID");
                boolean status = rs.getBoolean("is_verified");
                a = new Account(id, username, email, fullname, roleID, status);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    public void changeStatus(Account a) {

        String sql = "UPDATE [User]\n"
                + "SET is_verified = ? where Username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, !a.isVerified_email());
            pre.setString(2, a.getUsername());

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Account> searchUser(String username) {
        List<Account> accounts = new ArrayList<>();  // Danh sách để lưu các tài khoản
        String sql = "SELECT * FROM [User] WHERE Username LIKE ? AND RoleID IN (2, 3, 4)";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, "%" + username + "%");  // Gán tham số cho Username
            ResultSet rs = pre.executeQuery();
            // Sử dụng vòng lặp while để duyệt qua tất cả kết quả trả về
            while (rs.next()) {
                Account account = new Account();
                account.setId(rs.getString("UserID"));
                account.setUsername(rs.getString("Username"));
                account.setEmail(rs.getString("Email"));
                account.setFullname(rs.getString("FullName"));
                account.setRole(rs.getString("RoleID"));
                account.setVerified_email(rs.getBoolean("is_verified"));
                accounts.add(account);  // Thêm tài khoản vào danh sách
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return accounts;  // Trả về danh sách các tài khoản tìm được
    }

    public List<Account> getRole2() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE RoleID = 2"; // Không cần tham số
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                String fullname = rs.getString("FullName");
                String roleID = rs.getString("RoleID");
                boolean status = rs.getBoolean("is_verified");
                list.add(new Account(id, username, email, fullname, roleID, status));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving role 2 users: " + e.getMessage());
        }
        return list;
    }

    public List<Account> getRole3() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE RoleID = 3"; // Không cần tham số
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                String fullname = rs.getString("FullName");
                String roleID = rs.getString("RoleID");
                boolean status = rs.getBoolean("is_verified");
                list.add(new Account(id, username, email, fullname, roleID, status));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving role 2 users: " + e.getMessage());
        }
        return list;
    }

    public List<Account> getRole4() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE RoleID = 4"; // Không cần tham số
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                String fullname = rs.getString("FullName");
                String roleID = rs.getString("RoleID");
                boolean status = rs.getBoolean("is_verified");
                list.add(new Account(id, username, email, fullname, roleID, status));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving role 2 users: " + e.getMessage());
        }
        return list;
    }
}
