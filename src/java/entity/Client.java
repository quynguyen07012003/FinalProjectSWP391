/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author pheva
 */
public class Client {
    private String clientid;
    private String clientname;
    private String contactperson;
    private String phonenumber;
    private String email;
    private String address;
    private String userid;

    public Client() {
    }

    public Client(String clientid, String clientname, String contactperson, String phonenumber, String email, String address, String userid) {
        this.clientid = clientid;
        this.clientname = clientname;
        this.contactperson = contactperson;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
        this.userid = userid;
    }

    public Client(String clientid, String clientname, String contactperson, String phonenumber, String email, String address) {
        this.clientid = clientid;
        this.clientname = clientname;
        this.contactperson = contactperson;
        this.phonenumber = phonenumber;
        this.email = email;
        this.address = address;
    }
    
    

    public String getClientname() {
        return clientname;
    }

    public void setClientname(String clientname) {
        this.clientname = clientname;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getClientid() {
        return clientid;
    }

    public void setClientid(String clientid) {
        this.clientid = clientid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
    
    
    @Override
    public String toString() {
        return "Client{" + "clientid=" + clientid + ", clientname=" + clientname + ", contactperson=" + contactperson + ", phonenumber=" + phonenumber + ", email=" + email + ", address=" + address + ", userid=" + userid + '}';
    }
    
    
}
