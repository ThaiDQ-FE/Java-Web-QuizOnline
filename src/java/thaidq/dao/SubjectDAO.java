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
import thaidq.dto.SubjectDTO;
import thaidq.utils.DBUtils;

/**
 *
 * @author thaid
 */
public class SubjectDAO {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public SubjectDAO() {
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
    
    public List<SubjectDTO> getAllSubject() throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<SubjectDTO> list = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select subjectID, subjectName, quizTime, numberQuestion, status \n"
                        + "From tblSubject";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("subjectName");
                    int quizTime = rs.getInt("quizTime");
                    int numberQuestion = rs.getInt("numberQuestion");
                    int status = rs.getInt("status");
                    SubjectDTO dto = new SubjectDTO(subjectID, subjectName, quizTime, numberQuestion, status);
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
