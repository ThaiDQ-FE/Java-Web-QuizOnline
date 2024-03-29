/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaidq.dao.QuestionDAO;
import thaidq.dao.StatusDAO;
import thaidq.dao.SubjectDAO;
import thaidq.dto.QuestionDTO;

/**
 *
 * @author thaid
 */
public class SearchServlet extends HttpServlet {

    private final String SHOW_SEARCH_PAGE = "home.jsp";

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
        String type = request.getParameter("slType");
        String slStatusDes = request.getParameter("slStatusDes");
        String searchValue = request.getParameter("txtSearchValue");
        try {
            QuestionDAO qDAO = new QuestionDAO();
            SubjectDAO sDAO = new SubjectDAO();
            StatusDAO stDAO = new StatusDAO();
            int statusID = stDAO.getStatus(slStatusDes);
            if (type.equals("Name Question")) {
                List<QuestionDTO> listQuest = qDAO.searchQuestionByName(searchValue, statusID);
                request.setAttribute("SEARCH_RESULT", listQuest);
            } else if(type.equals("Subject ID")){
                List<QuestionDTO> listQuest = qDAO.searchQuestionBySubjectID(searchValue, statusID);
                request.setAttribute("SEARCH_RESULT", listQuest);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
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
