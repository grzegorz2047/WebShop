/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sql.tables;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Accounts implements Serializable{


    private Long accountid;
    private String username;


    private String password;
    private String name;
    private String lastname;
    private String address;
    private String email;
    private String activated;
    private String token;
    
    public Accounts(String username, String password, String name, String lastname, String address, String email, String token){
        this.username=username;
        this.password=password;
        this.name=name;
        this.lastname=lastname;
        this.address=address;
        this.token=token;
        this.email=email;
    }
    
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public void setAccountid(Long accountid) {
        this.accountid = accountid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setActivated(String activated) {
        this.activated = activated;
    }

    public Long getAccountid() {
        return accountid;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getLastname() {
        return lastname;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getActivated() {
        return activated;
    }
    
}
