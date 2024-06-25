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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppet.registration.registrationDAO;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class ChangePasswordServlet extends HttpServlet {
    private final String ADMIN_PAGE = "Admin.jsp";
    private final String SHOPPING_PAGE = "Shopping.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("EMAIL");
            session.removeAttribute("EMAIL");
            String password = request.getParameter("txtPassword");
            registrationDAO dao = new registrationDAO();
            String role =  dao.getRole(email);
            boolean result =  dao.changePassword(email, password);
            String url = "";
            if(result){
                Cookie _e = new Cookie("_e",Validation.encoded(email));
                Cookie _p = new Cookie("_p",Validation.encoded(password));
                Cookie _r = new Cookie("_r",Validation.encoded(role));
                _e.setMaxAge(60*60);
                _p.setMaxAge(60*60);
                _r.setMaxAge(60*60);
                response.addCookie(_e);
                response.addCookie(_p);
                response.addCookie(_r);
                if(Boolean.parseBoolean(role)){
                    url = ADMIN_PAGE;
                }else{
                    url = SHOPPING_PAGE;
                }
                response.sendRedirect(url);
            }
            
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
