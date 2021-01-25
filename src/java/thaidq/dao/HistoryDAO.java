/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import javax.naming.NamingException;
import thaidq.utils.DBUtils;

/**
 *
 * @author thaid
 */
public class HistoryDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public HistoryDAO() {
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

    public boolean saveQuizStudentTake(String userEmail, String subjectID, double point, int num_of_correct_answer, Time time, Timestamp date) throws Exception {
        conn = null;
        preStm = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Insert into tblQuizHistory(accountEmail,subjectID,point,num_of_correct_answer,time,date)"
                        + "values(?,?,?,?,?,?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, userEmail);
                preStm.setString(2, subjectID);
                preStm.setDouble(3, point);
                preStm.setInt(4, num_of_correct_answer);
                preStm.setTime(5, time);
                preStm.setTimestamp(6, date);
                int row = preStm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }
}
