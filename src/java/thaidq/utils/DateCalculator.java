/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.utils;

import java.sql.Date;

/**
 *
 * @author thaid
 */
public class DateCalculator {
     public static Date getCurrentDate() {
         long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date;
    }
}
