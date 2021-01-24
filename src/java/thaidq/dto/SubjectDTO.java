/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

/**
 *
 * @author thaid
 */
public class SubjectDTO {

    private String subjectID;
    private String subjectName;
    private int quizTime;
    private int numberQuestion;
    private int status;

    public SubjectDTO() {
    }

    public SubjectDTO(String subjectID, String subjectName, int quizTime, int numberQuestion, int status) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.quizTime = quizTime;
        this.numberQuestion = numberQuestion;
        this.status = status;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getQuizTime() {
        return quizTime;
    }

    public void setQuizTime(int quizTime) {
        this.quizTime = quizTime;
    }

    public int getNumberQuestion() {
        return numberQuestion;
    }

    public void setNumberQuestion(int numberQuestion) {
        this.numberQuestion = numberQuestion;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SubjectDTO{" + "subjectID=" + subjectID + ", subjectName=" + subjectName + ", quizTime=" + quizTime + ", numberQuestion=" + numberQuestion + ", status=" + status + '}';
    }
    
    
}
