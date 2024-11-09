package DAO;

import entity.News;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO extends DBContext {

    // Create a news item
    public boolean addNews(News news) {
        String sql = "INSERT INTO News (Title, Content, AuthorID, Status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, news.getTitle());
            stmt.setString(2, news.getContent());
            stmt.setInt(3, news.getAuthorID());
            stmt.setString(4, news.getStatus());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có bản ghi được thêm
        } catch (SQLException e) {
            System.err.println("Error while adding news: " + e.getMessage()); // Ghi log chi tiết lỗi
            return false; // Trả về false nếu có lỗi
        }
    }

    // Get all news items
    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM News";
        DAO dao = new DAO();
        try (Statement statement = connection.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                News news = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getInt("AuthorID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt")
                );
                news.setAuthor(dao.getAccountById(rs.getInt("AuthorID")));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    // Get a news item by ID
    public News getNewsByID(int newsID) {
        String sql = "SELECT * FROM News WHERE NewsID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, newsID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return new News(
                            rs.getInt("NewsID"),
                            rs.getString("Title"),
                            rs.getString("Content"),
                            rs.getInt("AuthorID"),
                            rs.getString("Status"),
                            rs.getTimestamp("CreatedAt")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a news item
    public void updateNews(News news) {
        String sql = "UPDATE News SET Title = ?, Content = ?, AuthorID = ?, Status = ? WHERE NewsID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, news.getTitle());
            stmt.setString(2, news.getContent());
            stmt.setInt(3, news.getAuthorID());
            stmt.setString(4, news.getStatus());
            stmt.setInt(5, news.getNewsID());
            int rowsUpdated = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a news item
    public boolean deleteNews(int newsID) {
        String sql = "DELETE FROM News WHERE NewsID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, newsID);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<News> getAllNewsPublished() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM News WHERE Status = 'Đã lên' ORDER BY CreatedAt DESC";
        try (Statement statement = connection.createStatement(); ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                News news = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getInt("AuthorID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt")
                //rs.getString("imagePath")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public News getNewsByIdPublished(int newsId) {
        String sql = "SELECT * FROM News WHERE NewsID = ? AND Status = 'Đã lên'";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, newsId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return new News(
                            rs.getInt("NewsID"),
                            rs.getString("Title"),
                            rs.getString("Content"),
                            rs.getInt("AuthorID"),
                            rs.getString("Status"),
                            rs.getTimestamp("CreatedAt")
                    //rs.getString("imagePath")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
        public List<News> searchNew(String title) {
        List<News> news = new ArrayList<>();  // Danh sách để lưu các tài khoản
        String sql = "SELECT * FROM [News] WHERE Title LIKE ? AND STATUS ='Đã lên' ";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, "%" + title + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                News new1 = new News();
                new1.setNewsID(rs.getInt("newsID"));
                new1.setTitle(rs.getString("title"));
                new1.setContent(rs.getString("content"));
                new1.setAuthorID(rs.getInt("authorID"));
                news.add(new1);  // Thêm tài khoản vào danh sách
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return news;  // Trả về danh sách các tài khoản tìm được
    }
        public static void main(String[] args) {
        NewsDAO n = new NewsDAO();
            for (News arg : n.searchNew("mu")) {
                System.out.println(arg);
            }
    }
}
