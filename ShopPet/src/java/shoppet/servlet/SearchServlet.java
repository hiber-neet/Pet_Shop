/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
public class SearchServlet extends HttpServlet {

    private final String SHOPPING_PAGE = "Shopping.jsp";
    private final String ADMIN_PAGE = "Admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         String isAdmin = request.getParameter("searchAdmin");
        String url = SHOPPING_PAGE;
        try {
            if(isAdmin != null){
                url = ADMIN_PAGE;
            }
            
            String SearchValue = request.getParameter("SearchValue");
            
            productDAO dao = new productDAO();
            if (SearchValue != null && Validation.validateSearch(SearchValue) && !SearchValue.equals("")) {
                if (isAdmin != null) {                            
                    request.setAttribute("SearchValue", SearchValue);
                } else {
                    List<productDTO> listProduct = dao.getProductOnSearchValue(SearchValue.trim());
                    request.setAttribute("LIST_PRODUCT", listProduct);
                }
            } else {

            }

            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
