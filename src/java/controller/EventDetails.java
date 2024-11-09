
package controller;

import entity.*;

public class EventDetails {
    private int id;
    private String title;
    private String start;
    private String end;
    private String location;
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public EventDetails(int id, String title, String start, String end, String location, String description) {
        this.id = id;
        this.title = title;
        this.start = start;
        this.end = end;
        this.location = location;
        this.description = description;
    }
    

    public EventDetails() {
    }

    public EventDetails(String title, String start, String end, String location, String description) {
        this.title = title;
        this.start = start;
        this.end = end;
        this.location = location;
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
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

   
}

