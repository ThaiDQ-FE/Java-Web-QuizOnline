/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.StatusDTO;
import thaidq.utils.DBUtils;

/**
 *
 * @author thaid
 */
public class StatusDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public StatusDAO() {
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

    public List<StatusDTO> getAllStatus() throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<StatusDTO> list = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select status, description \n"
                        + "From tblStatus";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int status = rs.getInt("status");
                    String description = rs.getString("description");
                    StatusDTO dto = new StatusDTO(status, description);
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public int getStatus(String description) throws Exception{
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT status \n"
                        + "From tblStatus \n"
                        + "Where description = ?";
                preStm = conn.prepareCall(sql);
                preStm.setString(1, description);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            closeConnection();
        }
        return 0;
    }
}
