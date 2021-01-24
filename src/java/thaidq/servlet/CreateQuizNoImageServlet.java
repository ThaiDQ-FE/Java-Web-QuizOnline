/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaidq.dao.QuestionDAO;

/**
 *
 * @author thaid
 */
public class CreateQuizNoImageServlet extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";
    private final String CREATE_PAGE = "createQuestionNoImage.jsp";

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String subjectID = request.getParameter("slSubjectID");
        String questionID = request.getParameter("txtQuestionID");
        String questionContent = request.getParameter("txtQuestionContent");
        String ans1 = request.getParameter("txtAns1");
        String ans2 = request.getParameter("txtAns2");
        String ans3 = request.getParameter("txtAns3");
        String ans4 = request.getParameter("txtAns4");
        String ansCorrect = request.getParameter("rdAnsCorrect");
        String url = CREATE_PAGE;
        QuestionDAO dao = new QuestionDAO();
        try {
            switch (ansCorrect) {
                case "a1":
                    ansCorrect = ans1;
                    break;
                case "a2":
                    ansCorrect = ans2;
                    break;
                case "a3":
                    ansCorrect = ans3;
                    break;
                case "a4":
                    ansCorrect = ans4;
                    break;
            }
            boolean result = dao.createQuestion(subjectID, questionID, questionContent, ans1, ans2, ans3, ans4, ansCorrect);
            if (result) {
                url = HOME_PAGE;
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateQuizNoImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateQuizNoImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
