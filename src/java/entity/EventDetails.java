
package entity;

import java.util.Date;

public class EventDetails {
    private int eventID;
    private String eventName;
    private Date startDate;
    private Date endDate;
    private String location;
    private String description;

    public EventDetails() {
    }

    public EventDetails(int eventID, String eventName, Date startDate, Date endDate, String location, String description) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.location = location;
        this.description = description;
    }

    // Getter và Setter cho từng thuộc tính
    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Phương thức toString để hiển thị thông tin chi tiết sự kiện
    @Override
    public String toString() {
        return "EventDetail{" +
                "eventID=" + eventID +
                ", eventName='" + eventName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", location='" + location + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
