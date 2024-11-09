/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author pc
 */
public class Account {
    private String id;
    private String username;
    private String password;
    private String email;
    private String fullname;
    private String role;
    private Timestamp created_date;
    private boolean verified_email;
    private String ggid;

    public Account() {
    }

    public Account(String id, String username, String password, String email, String fullname, String role, Timestamp created_date, boolean verified_email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.role = role;
        this.created_date = created_date;
        this.verified_email = verified_email;
    }
    
    

    public Account( String username, String password, String email, String fullname,Timestamp created_date) {
        
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
       
       
        this.created_date = created_date;
    }
    
    public Account(String id, String username, String email, String fullname, boolean verified_email) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.verified_email = verified_email;
    }

    public Account(String id, String username, String email, String fullname, String role, boolean verified_email) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.role = role;
        this.verified_email = verified_email;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }



    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public String getGgid() {
        return ggid;
    }

    public void setGgid(String ggid) {
        this.ggid = ggid;
    }
    
    

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", fullname=" + fullname + ", role=" + role + ", created_date=" + created_date + ", verified_email=" + verified_email + '}';
    }

   

    

   

}
