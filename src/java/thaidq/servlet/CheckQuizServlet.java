/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaidq.dao.HistoryDAO;
import thaidq.dao.QuestionDAO;
import thaidq.dto.AccountDTO;
import thaidq.utils.TimeQuiz;

/**
 *
 * @author thaid
 */
public class CheckQuizServlet extends HttpServlet {

    private final String QUIZ_RESULT = "quizResult.jsp";
    private final String QUIZ_ERROR = "error.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        double numberQuestionInDouble = Double.parseDouble(request.getParameter("numberQuestion"));
        int numberQuestion = Integer.parseInt(request.getParameter("numberQuestion"));
        double pointPerQuestion = 10 / numberQuestionInDouble;
        DecimalFormat df = new DecimalFormat("#.00");
        double finalPoint = 0;
        int numberQuestionCorrect = 0;
        String timeRemaining = request.getParameter("txtTimeRemaining");
        String timeQuiz = request.getParameter("txtQuizTime");
        Time timeTakeQuiz = null;
        String url = QUIZ_RESULT;
        try {
            timeTakeQuiz = TimeQuiz.convertTotalSecondToTime(timeRemaining, timeQuiz + ":" + "00");
        } catch (Exception e) {
            e.printStackTrace();
            url = QUIZ_ERROR;
        }
        Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
        String subjectID = request.getParameter("subjectID");
        try {
            QuestionDAO questionDAO = new QuestionDAO();
            for (int i = 1; i <= numberQuestion; i++) {
                String questionID = request.getParameter("txtQuestionID" + i);
                String answerByUser = request.getParameter("rdAnswerQuestion" + i);
                String correctAnswer = questionDAO.getQuestionCorrectByQuestionID(questionID);
                if (correctAnswer.equals(answerByUser)) {
                    finalPoint += Double.parseDouble(df.format(pointPerQuestion));
                    numberQuestionCorrect++;
                }
            }
            HistoryDAO historyDAO = new HistoryDAO();
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("STUDENT") != null) {
                AccountDTO userInfo = (AccountDTO) session.getAttribute("STUDENT");
                historyDAO.saveQuizStudentTake(userInfo.getEmail(), subjectID, finalPoint, numberQuestionCorrect, timeTakeQuiz, currentDateTime);
            }
            request.setAttribute("NUMBER_QUESTION", numberQuestion);
            request.setAttribute("FINAL_POINT", finalPoint);
            request.setAttribute("QUESTIONS_CORRECT", numberQuestionCorrect);
            request.setAttribute("TIME_TAKE_QUIZ", timeTakeQuiz);
            request.setAttribute("SUBJECT_ID", subjectID);
            request.setAttribute("DATE", currentDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
