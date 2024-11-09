
package DAO;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 */
public class DAO extends DBContext {

    private static java.sql.Timestamp getCurrentTimestamp() {
        java.util.Date now = new java.util.Date();
        return new java.sql.Timestamp(now.getTime());
    }

    public Account login(String username, String password) {
        String sql = "SELECT*\n"
                + "  FROM [dbo].[User]\n"
                + "  where Username=? and PasswordHash=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString("Username"),
                        rs.getString("PasswordHash"),
                        rs.getString("Email"),
                        rs.getString("FullName"),
                        rs.getTimestamp("CreatedAt"));
                a.setRole(rs.getString("roleID"));
                a.setId(rs.getString("UserID"));
                a.setVerified_email(rs.getBoolean("is_verified"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account CheckAcc(String username) {
        String sql = "select * from User where User=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp("created_date"));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void signUpAccount(String username, String passwordHash, String email, String fullName) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Username]\n"
                + "           ,[PasswordHash]\n"
                + "           ,[Email]\n"
                + "           ,[FullName]\n"
                + "           ,[RoleID]\n"
                + "           ,[CreatedAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, passwordHash);
            st.setString(3, email);
            st.setString(4, fullName);
            st.setString(5, "2");
            st.setTimestamp(6, getCurrentTimestamp());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isEmailRegistered(String email) {
        try {

            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rs.close();
                ps.close();

                return true;
            } else {
                rs.close();
                ps.close();

                return false;
            }
        } catch (SQLException ex) {
            //Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean isUserRegistered(String username) {
        try {

            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rs.close();
                ps.close();

                return true;
            } else {
                rs.close();
                ps.close();

                return false;
            }
        } catch (SQLException ex) {
            //Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean isPasswordValid(String password) {
        int length = password.length();
        if (length >= 8 && length <= 16) {
            return true;
        } else {
            return false;
        }
    }

    public Account getAccountById(int userId) {
        String sql = "SELECT * FROM [User] WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getInt("UserID") + "", 
                        rs.getString("Username"),
                        rs.getString("PasswordHash"),
                        rs.getString("Email"),
                        rs.getString("FullName"),
                        null,
                        rs.getTimestamp("CreatedAt"),
                        rs.getBoolean("is_verified")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
}
