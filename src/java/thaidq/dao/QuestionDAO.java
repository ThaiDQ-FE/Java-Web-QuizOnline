/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thaidq.dto.QuestionDTO;
import thaidq.utils.DBUtils;
import thaidq.utils.DateCalculator;

/**
 *
 * @author thaid
 */
public class QuestionDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public QuestionDAO() {
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

    public boolean createQuestion(String subjectID, String questionID,
            String questionContent, String an1, String an2, String an3, String an4, String ansCorrect) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        Date date = (Date) DateCalculator.getCurrentDate();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Insert into tblQuestion(id,question_content,answer_1,answer_2,answer_3,answer_4,answer_correct,createDate,subjectID,status)"
                        + "values(?,?,?,?,?,?,?,?,?,?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, questionID);
                preStm.setString(2, questionContent);
                preStm.setString(3, an1);
                preStm.setString(4, an2);
                preStm.setString(5, an3);
                preStm.setString(6, an4);
                preStm.setString(7, ansCorrect);
                preStm.setDate(8, date);
                preStm.setString(9, subjectID);
                preStm.setInt(10, 1);

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

    public List<QuestionDTO> getAllQuestion() throws Exception {
        List<QuestionDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT q.id,q.question_content,q.answer_1,q.answer_2,q.answer_3,q.answer_4,q.answer_correct,q.createDate,s.subjectName \n"
                        + "FROM tblQuestion as q, tblSubject as s \n"
                        + "where  not q.status = '3' and q.subjectID = s.subjectID";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString("id");
                    String questionContent = rs.getString("question_content");
                    String a1 = rs.getString("answer_1");
                    String a2 = rs.getString("answer_2");
                    String a3 = rs.getString("answer_3");
                    String a4 = rs.getString("answer_4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date createDate = rs.getDate("createDate");
                    String subjectName = rs.getString("subjectName");
                    QuestionDTO dto = new QuestionDTO(id, questionContent, a1, a2, a3, a4, answerCorrect, createDate, subjectName);
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<QuestionDTO> searchQuestionByName(String searchValue, int status, String page) throws Exception {
        List<QuestionDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select id,question_content,answer_1,answer_2, answer_3,answer_4,answer_correct,createDate,subjectID \n"
                        + "From tblQuestion \n"
                        + "Where question_content like ? AND status = ? \n"
                        + "ORDER BY question_content \n"
                        + "OFFSET " + ((Integer.parseInt(page) - 1) * 5) + "ROWS FETCH NEXT 5 ROWS ONLY";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + searchValue + "%");
                preStm.setInt(2, status);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString("id");
                    String questionContent = rs.getString("question_content");
                    String a1 = rs.getString("answer_1");
                    String a2 = rs.getString("answer_2");
                    String a3 = rs.getString("answer_3");
                    String a4 = rs.getString("answer_4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date createDate = rs.getDate("createDate");
                    String subjectID = rs.getString("subjectID");
                    QuestionDTO dto = new QuestionDTO(id, questionContent, a1, a2, a3, a4, answerCorrect, createDate, subjectID, status);
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int countQuestionByName(String subjectID, int status) throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(id) FROM tblQuestion WHERE "
                        + "subjectID like ? and status = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + subjectID + "%");
                preStm.setInt(2, status);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);

                }
            }
        } finally {
            closeConnection();
        }
        return 0;
    }
}