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
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.HistoryDTO;
import thaidq.utils.DBUtils;

/**
 *
 * @author thaid
 */
public class HistoryDAO implements Serializable {

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
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public List<HistoryDTO> getAllQuizHistoryByEmail(String email) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<HistoryDTO> list = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select qh.subjectID ,qh.point,qh.num_of_correct_answer,qh.time ,qh.date , s.subjectName, s.numberQuestion \n"
                        + "from tblQuizHistory as qh, tblSubject as s \n"
                        + "where qh.accountEmail = ? and qh.subjectID = s.subjectID \n"
                        + "ORDER BY qh.date DESC";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, email);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("subjectName");
                    int numberQuestion = rs.getInt("numberQuestion");
                    double point = rs.getDouble("point");
                    int answersCorrect = rs.getInt("num_of_correct_answer");
                    Time time = rs.getTime("time");
                    Timestamp date = rs.getTimestamp("date");
                    HistoryDTO dto = new HistoryDTO(email, subjectName,subjectID, numberQuestion , point, answersCorrect, time, date);
                    list.add(dto);

                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public List<HistoryDTO> getAllQuizHistoryByEmailAndOption(String email, String option) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<HistoryDTO> list = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select qh.subjectID ,qh.point,qh.num_of_correct_answer,qh.time ,qh.date , s.subjectName, s.numberQuestion \n"
                        + "from tblQuizHistory as qh, tblSubject as s \n"
                        + "where qh.accountEmail = ? and s.subjectName = ? and qh.subjectID = s.subjectID \n"
                        + "ORDER BY qh.date DESC";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, email);
                preStm.setString(2, option);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("subjectName");
                    int numberQuestion = rs.getInt("numberQuestion");
                    double point = rs.getDouble("point");
                    int answersCorrect = rs.getInt("num_of_correct_answer");
                    Time time = rs.getTime("time");
                    Timestamp date = rs.getTimestamp("date");
                    HistoryDTO dto = new HistoryDTO(email, subjectName,subjectID, numberQuestion , point, answersCorrect, time, date);
                    list.add(dto);

                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
