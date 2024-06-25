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
public class LoginServlet extends HttpServlet {
    private final String LOGIN_ADMIN_PAGE = "LoginAdmin.jsp";
    private final String LOGIN_CUSTOMER_PAGE = "Login.jsp";
    private final String SHOPPING_PAGE = "Shopping.jsp";
    private final String ADMIN_PAGE = "Admin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            String Email = request.getParameter("txtEmail");
            String Password = request.getParameter("txtPassword");
            boolean Role = Boolean.parseBoolean(request.getParameter("txtRole"));
      
            registrationDAO dao = new registrationDAO();
            String errorEmail = ""; 
            String errorPassword ="";
            String url = "";
            boolean isValidEmail = dao.emailValid(Email);
            if(!isValidEmail){
                errorEmail = "Email account has not been registered yet";
                request.setAttribute("ERROR_EMAIL",errorEmail);
                
            }else{
               if(Email != null && Password != null ){
                   boolean result = dao.authentication(Email, Password, Role);
                   if(result){
                        Cookie _e = new Cookie("_e",Validation.encoded(Email));
                        Cookie _p = new Cookie("_p",Validation.encoded(Password));
                        Cookie _r = new Cookie("_r",Validation.encoded(String.valueOf(Role)));
                        _e.setMaxAge(60*60);
                        _p.setMaxAge(60*60);
                        _r.setMaxAge(60*60);
                        response.addCookie(_e);
                        response.addCookie(_p);
                        response.addCookie(_r);
                        
                        
                       if(Role){
                            url = ADMIN_PAGE;
                        }else{
                            url = SHOPPING_PAGE;
                        }
                       response.sendRedirect(url);
                       return;
                   }else{
                       errorPassword = "Password is not correct. Please try again!";
                       request.setAttribute("ERROR_PASSWORD",errorPassword);
                   }
               }
            }
             if(Role){
                    url = LOGIN_ADMIN_PAGE;
             }else{
                    url = LOGIN_CUSTOMER_PAGE;
             }
             RequestDispatcher rd = request.getRequestDispatcher(url);
             rd.forward(request, response);
                    
                    
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
