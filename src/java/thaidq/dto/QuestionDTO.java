/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

import java.sql.Date;

/**
 *
 * @author thaid
 */
public class QuestionDTO {
    private String id;
    private String question_content;
    private String answer_1;
    private String answer_2;
    private String answer_3;
    private String answer_4;
    private String answer_correct;
    private Date createDate;
    private String subjectID;
    private int status;

    public QuestionDTO() {
    }

    public QuestionDTO(String id, String question_content, String answer_1, String answer_2, String answer_3, String answer_4, String answer_correct, Date createDate, String subjectID, int status) {
        this.id = id;
        this.question_content = question_content;
        this.answer_1 = answer_1;
        this.answer_2 = answer_2;
        this.answer_3 = answer_3;
        this.answer_4 = answer_4;
        this.answer_correct = answer_correct;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.status = status;
    }

    public QuestionDTO(String id, String question_content, String answer_1, String answer_2, String answer_3, String answer_4, String answer_correct, Date createDate, String subjectID) {
        this.id = id;
        this.question_content = question_content;
        this.answer_1 = answer_1;
        this.answer_2 = answer_2;
        this.answer_3 = answer_3;
        this.answer_4 = answer_4;
        this.answer_correct = answer_correct;
        this.createDate = createDate;
        this.subjectID = subjectID;
    }

    public QuestionDTO(String question_content, String answer_1, String answer_2, String answer_3, String answer_4, String answer_correct, String subjectID) {
        this.question_content = question_content;
        this.answer_1 = answer_1;
        this.answer_2 = answer_2;
        this.answer_3 = answer_3;
        this.answer_4 = answer_4;
        this.answer_correct = answer_correct;
        this.subjectID = subjectID;
    }

    public QuestionDTO(String subjectID) {
        this.subjectID = subjectID;
    }
    
    
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public String getAnswer_1() {
        return answer_1;
    }

    public void setAnswer_1(String answer_1) {
        this.answer_1 = answer_1;
    }

    public String getAnswer_2() {
        return answer_2;
    }

    public void setAnswer_2(String answer_2) {
        this.answer_2 = answer_2;
    }

    public String getAnswer_3() {
        return answer_3;
    }

    public void setAnswer_3(String answer_3) {
        this.answer_3 = answer_3;
    }

    public String getAnswer_4() {
        return answer_4;
    }

    public void setAnswer_4(String answer_4) {
        this.answer_4 = answer_4;
    }

    public String getAnswer_correct() {
        return answer_correct;
    }

    public void setAnswer_correct(String answer_correct) {
        this.answer_correct = answer_correct;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "QuestionDTO{" + "id=" + id + ", question_content=" + question_content + ", answer_1=" + answer_1 + ", answer_2=" + answer_2 + ", answer_3=" + answer_3 + ", answer_4=" + answer_4 + ", answer_correct=" + answer_correct + ", createDate=" + createDate + ", subjectID=" + subjectID + ", status=" + status + '}';
    }
    
    
}
