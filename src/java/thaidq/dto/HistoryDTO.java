/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;

/**
 *
 * @author thaid
 */
public class HistoryDTO implements Serializable{
    private String userEmail;
    private String subjectID;
    private double point;
    private int correctAnswers;
    private Time time;
    private Timestamp date;

    public HistoryDTO() {
    }

    public HistoryDTO(String userEmail, String subjectID, double point, int correctAnswers, Time time, Timestamp date) {
        this.userEmail = userEmail;
        this.subjectID = subjectID;
        this.point = point;
        this.correctAnswers = correctAnswers;
        this.time = time;
        this.date = date;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public int getCorrectAnswers() {
        return correctAnswers;
    }

    public void setCorrectAnswers(int correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "HistoryDTO{" + "userEmail=" + userEmail + ", subjectID=" + subjectID + ", point=" + point + ", correctAnswers=" + correctAnswers + ", time=" + time + ", date=" + date + '}';
    }
    
}
