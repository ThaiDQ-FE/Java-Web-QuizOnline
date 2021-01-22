/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.AccountDTO;
import thaidq.utils.DBUtils;

/**
 *
 * @author thaid
 */
public class AccountDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public AccountDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean checkLogin(String email, String password) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select email, name, password, role, status from tblAccount where email = ? and password = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, email);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean checkAccount(String email) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select email from tblAccount where email = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, email);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean createAccount(AccountDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblAccount(email, name, password, role, status) Values (?,?,?,?,?)";
            conn = DBUtils.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getEmail());
            preStm.setString(2, dto.getName());
            preStm.setString(3, dto.getPassword());
            preStm.setInt(4, 2);
            preStm.setInt(5, 1);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public AccountDTO getAccount(String emailId, String password) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        AccountDTO dto = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select email, name, password, role, status from tblAccount where email = ? and password = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, emailId);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return new AccountDTO(
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getString("password"),
                            rs.getInt("role"),
                            rs.getInt("status")
                    );
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
