/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

import java.io.Serializable;

/**
 *
 * @author thaid
 */
public class AccountDTO implements Serializable{
    private String email;
    private String name;
    private String password;
    private int role;
    private int status;

    public AccountDTO() {
    }

    public AccountDTO(String email, String name, int role, int status) {
        this.email = email;
        this.name = name;
        this.role = role;
        this.status = status;
    }

    
    
    public AccountDTO(String email, String name, String password, int role, int status) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "email=" + email + ", name=" + name + ", password=" + password + ", role=" + role + ", status=" + status + '}';
    }
    
    
}
