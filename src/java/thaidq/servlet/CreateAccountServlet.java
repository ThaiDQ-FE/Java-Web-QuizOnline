/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaidq.dao.AccountDAO;
import thaidq.dto.AccountDTO;
import thaidq.utils.EncryptSHA256;

/**
 *
 * @author thaid
 */
public class CreateAccountServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String CREATE_PAGE = "createAccount.jsp";

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
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CREATE_PAGE;
        String email = request.getParameter("txtEmail");
        String name = request.getParameter("txtName");
        String password = request.getParameter("txtPassword");
        String passwordConfirm = request.getParameter("txtPasswordConfirm");
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        try {
            boolean isCheck = false;
            if (!passwordConfirm.equals(password)) {
                isCheck = true;
                url = CREATE_PAGE;
                request.setAttribute("ERORR", "Password and password confirm not correct");
            }
            if(dao.checkAccount(email) == true){
                isCheck = true;
                url = CREATE_PAGE;
                request.setAttribute("ERORR", "Email has been used!");
            }
            if (isCheck) {
                session.setAttribute("ERORR_SIGNUP", "ERORR_SIGNUP");
                request.setAttribute("email", email);
                request.setAttribute("name", name);
            } else {
                String encryptPassword = EncryptSHA256.encryptSHA(password);
                AccountDTO dto = new AccountDTO(email, name, encryptPassword, 2, 1);
                try {
                    if (dao.createAccount(dto)) {
                        url = LOGIN_PAGE;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CreateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CreateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
