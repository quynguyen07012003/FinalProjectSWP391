
package entity;

import java.util.Date;


public class Agent {
    private String agentID;
    private String agentName;
    private String address;
    private String phoneNumber;
    private String email;
    private String userID;
    private Date createdAt;

    public Agent() {
    }

    public Agent(String agentID, String agentName, String address, String phoneNumber, String email, String userID, Date createdAt) {
        this.agentID = agentID;
        this.agentName = agentName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userID = userID;
        this.createdAt = createdAt;
    }

    public Agent(String agentID, String agentName, String address, String phoneNumber, String email) {
        this.agentID = agentID;
        this.agentName = agentName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public Agent(String agentID, String agentName, String address, String phoneNumber, String email, String userID) {
        this.agentID = agentID;
        this.agentName = agentName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userID = userID;
    }
    
    

    public String getAgentID() {
        return agentID;
    }

    public void setAgentID(String agentID) {
        this.agentID = agentID;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    
}
