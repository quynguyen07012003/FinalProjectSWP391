package DAO;

import java.sql.*;
import org.json.JSONArray;
import org.json.JSONObject;

public class EventDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addEvent(String title, String start, String end, String location, String description) {
        String startDateWithTime = start + " 08:00:00";
        String endDateWithTime = end + " 23:59:00";
        String sql = "INSERT INTO EventDetails (EventName, StartDate, EndDate, Location, Description) VALUES (?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, startDateWithTime);
            ps.setString(3, endDateWithTime);
            ps.setString(4, location);
            ps.setString(5, description);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public JSONArray getAllEvents() throws SQLException {
        JSONArray eventsArray = new JSONArray();
        String sql = "SELECT EventID, EventName, StartDate, EndDate, Location, Description FROM EventDetails ";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                JSONObject event = new JSONObject();
                event.put("id", rs.getInt("EventID"));
                event.put("title", rs.getString("EventName"));
                event.put("start", rs.getString("StartDate"));
                event.put("end", rs.getString("EndDate"));
                event.put("location", rs.getString("Location"));
                event.put("description", rs.getString("Description"));

                eventsArray.put(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventsArray;
    }

    public void editEvent(String title, String start, String end, String location, String description, int id) {
        String startDateWithTime = start + " 08:00:00";
        String endDateWithTime = end + " 23:59:00";
        String sql = "UPDATE EventDetails SET EventName = ?, StartDate = ?, EndDate = ?, Location = ?, Description = ? WHERE EventID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, startDateWithTime);
            ps.setString(3, endDateWithTime);
            ps.setString(4, location);
            ps.setString(5, description);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEvent(int id) {
        String sql = "Update Product Set EventID = null Where EventID = ?\n"
                + "  Update BookingForm Set EventID = null Where EventID = ?\n"
                + "  DELETE FROM EventDetails WHERE EventID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
