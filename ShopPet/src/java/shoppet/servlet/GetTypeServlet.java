/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shoppet.product.productDAO;
import shoppet.product.productDTO;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class GetTypeServlet extends HttpServlet {
    private final String PRODUCT_PAGE = "ProductType.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String getValue = request.getParameter("GetValue");
            String category = request.getParameter("category")!= null ? request.getParameter("category") : "" ;
            productDAO pDao = new productDAO();
            HashSet<String> cateList = pDao.getCategoryOnType(getValue.trim().toUpperCase());
            List<productDTO> pList = pDao.getProductOnType(getValue.trim().toUpperCase(),category.trim());
            
            List<String> categoryList = Validation.sortCategory(cateList);
            
            
            
            request.setAttribute("PRODUCT_LIST",pList);
            request.setAttribute("CATEGORY_LIST",categoryList);
            RequestDispatcher rd = request.getRequestDispatcher(PRODUCT_PAGE);
            rd.forward(request, response);
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(GetTypeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
