/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaidq.dao.QuestionDAO;
import thaidq.dto.QuestionDTO;

/**
 *
 * @author thaid
 */
public class UpdateQuestionServlet extends HttpServlet {

    private static final String GET_ALL = "LoadStatus";

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
        String questionID = request.getParameter("txtID");
        String subjectID = request.getParameter("txtSubjectID");
        String question_content = request.getParameter("txtQuestionContent");
        String ans1 = request.getParameter("txtAns1");
        String ans2 = request.getParameter("txtAns2");
        String ans3 = request.getParameter("txtAns3");
        String ans4 = request.getParameter("txtAns4");
        String ans_cor = request.getParameter("txtAnsCor");
        String url = GET_ALL;
        try {
            QuestionDAO dao = new QuestionDAO();
            QuestionDTO dto = new QuestionDTO(question_content, ans1, ans2, ans3, ans4, ans_cor, subjectID);
            if (dao.updateQuestion(dto, questionID)) {
                url = GET_ALL;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
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
