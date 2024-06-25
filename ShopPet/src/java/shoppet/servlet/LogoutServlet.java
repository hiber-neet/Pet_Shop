/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class LogoutServlet extends HttpServlet {
    private final String SHOPPING_PAGE = "Shopping.jsp";
    private final String LOGIN_ADMIN_PAGE = "LoginAdmin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
                String url = SHOPPING_PAGE;
                boolean isAdmin = false;
                Cookie[] cookie = request.getCookies();
                if(cookie != null){
                    for(int i = cookie.length -1; i >= 0; i-- ){
                        if(cookie[i].getName().equals("_e") || cookie[i].getName().equals("_p") ||cookie[i].getName().equals("_r") ){
                            if(cookie[i].getName().equals("_r")){
                                isAdmin = Boolean.parseBoolean(Validation.decoded(cookie[i].getValue()));
                                System.out.println(isAdmin);
                            };
                            cookie[i].setMaxAge(0);
                            response.addCookie(cookie[i]);
                        }
                    }
                }
                if(isAdmin){
                    url = LOGIN_ADMIN_PAGE;
                }
                response.sendRedirect(url);
            
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
