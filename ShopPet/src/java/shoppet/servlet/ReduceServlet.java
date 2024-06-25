/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppet.cart.cartDAO;
import shoppet.cookie.CookieService;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class ReduceServlet extends HttpServlet {
    private final String CART_PAGE = "Cart.jsp";
    private final String PAYMENT_PAGE = "Payment.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String url = "";
            String idProduct = request.getParameter("idProduct");
            int quantity =  Integer.parseInt(request.getParameter("currQuantity"));
            CookieService cookieService = new CookieService();
            Cookie cookie = cookieService.getCookieByName(request,"_e");
            String where = request.getParameter("where");
            if(cookie != null){
                 if(where != null && where.equals("PAYMENT")){
                    
                    HttpSession session = request.getSession();
                    if(session != null){
                        HashMap<String,Integer> listProductsBuy = ( HashMap<String,Integer>)session.getAttribute("LIST_PRODUCTS_BUY");
                        for(String item : listProductsBuy.keySet()){
                            if(item.equals(idProduct)){
                                if(listProductsBuy.get(item) > 1){
                                     listProductsBuy.put(item, listProductsBuy.get(item)-1);
                                }
                               
                            }
                            
                        }
                        session.setAttribute("LIST_PRODUCTS_BUY", listProductsBuy);
                    }
                    url = PAYMENT_PAGE;
                }else{
                    String email = Validation.decoded(cookie.getValue());
                    cartDAO dao = new cartDAO();
                    boolean  reduce = dao.reduceQuantity(email, idProduct, quantity);
                    url = CART_PAGE;
                 }
                
              
            }
            
            
            request.getRequestDispatcher(url).forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(ReduceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ReduceServlet.class.getName()).log(Level.SEVERE, null, ex);
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
