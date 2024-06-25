/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shoppet.registration.registrationDAO;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class RegistrationServlet extends HttpServlet {
    private final String REGISTER_PAGE = "Register.jsp";
    private final String SHOPPING_PAGE = "Shopping.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
                String errorMail = "";
                String url = "";
                String Email = request.getParameter("txtEmail");
                String Fullname = request.getParameter("txtName");
                String Address = request.getParameter("txtAddress");
                String Phone = request.getParameter("txtPhone");
                String Password = request.getParameter("txtRePassword");
                registrationDAO dao = new registrationDAO();
                
                boolean isValidEmail = dao.emailValid(Email);
               
                if(isValidEmail){
                    errorMail = "Email is taken";
                    url = REGISTER_PAGE;
                }else{
                    boolean result = dao.registerUser(Email, Password, Fullname, Phone, Address);
                    if(result){
                        Cookie _e = new Cookie("_e",Validation.encoded(Email));
                        Cookie _p = new Cookie("_p",Validation.encoded(Password));
                        Cookie _r = new Cookie("_r",Validation.encoded("0"));
                        _e.setMaxAge(60*60);
                        _p.setMaxAge(60*60);
                        _r.setMaxAge(60*60);
                        response.addCookie(_e);
                        response.addCookie(_p);
                        response.addCookie(_r);
                        response.sendRedirect(SHOPPING_PAGE);
                        return;
                    }else{
                        url = REGISTER_PAGE;
                    }
                }
                request.setAttribute("errorMail", errorMail);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            out.close();
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
