package DAO;

import entity.Agent;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AgentDAO extends DBContext {

    public Agent getAgentByID(String id) {
        String sql = "SELECT [AgentID], [AgentName], [Address], [PhoneNumber], [Email], [UserID], [CompanyId], [CreatedAt]\n"
                + "                 FROM Agent\n"
                + "                 WHERE [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Agent agent = new Agent(
                        rs.getString("AgentID"),
                        rs.getString("AgentName"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("UserID"),
                        rs.getDate("CreatedAt")
                );
                return agent;
            }
        } catch (SQLException e) {
            System.out.println("");
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateAgent(Agent agent) {
        String sql = "UPDATE Agent SET AgentName=?, Address=?, PhoneNumber=?, Email=? WHERE AgentID=?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, agent.getAgentName());
            ps.setString(2, agent.getAddress());
            ps.setString(3, agent.getPhoneNumber());
            ps.setString(4, agent.getEmail());
            ps.setString(5, agent.getAgentID());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Agent> getAllAgents() {
        List<Agent> agents = new ArrayList<>();
        String sql = "SELECT AgentID, AgentName, Address, PhoneNumber, Email, UserID, CompanyId, CreatedAt "
                + "FROM Agent";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Agent agent = new Agent(
                        rs.getString("AgentID"),
                        rs.getString("AgentName"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("UserID"),
                        rs.getDate("CreatedAt")
                );
                agents.add(agent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return agents;
    }

}
