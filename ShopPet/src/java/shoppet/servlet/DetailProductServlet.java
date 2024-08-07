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
import shoppet.cookie.CookieService;
import shoppet.product.productDAO;
import shoppet.product.productDTO;
import shoppet.registration.registrationDAO;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class DetailProductServlet extends HttpServlet {
    private final String DETAIL_PAGE = "DetailProduct.jsp";
    private final String LOGIN_PAGE = "Login.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String url = "";
            boolean authenticate = true;
           
            CookieService cookieService = new CookieService();
            Cookie cookieEmail = cookieService.getCookieByName(request,"_e");
            Cookie cookiePassword = cookieService.getCookieByName(request,"_p");
            Cookie cookieRole = cookieService.getCookieByName(request,"_r");
            if( cookieEmail != null && cookiePassword != null && cookieRole != null){
                registrationDAO daoAuth = new registrationDAO();
                authenticate = daoAuth.authentication(Validation.decoded(cookieEmail.getValue()),
                    Validation.decoded(cookiePassword.getValue()), 
                    false);
            }else{
                authenticate = false;
            }
            
            
            if(authenticate){
                 url = DETAIL_PAGE;
                String valueDetail = request.getParameter("ValueDetail");
                System.out.println(valueDetail);
                productDAO dao = new productDAO();
                productDTO product = dao.getProductDetail(valueDetail.toUpperCase().trim());
                request.setAttribute("PRODUCT", product);
            }else{
                url = LOGIN_PAGE;
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(DetailProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
