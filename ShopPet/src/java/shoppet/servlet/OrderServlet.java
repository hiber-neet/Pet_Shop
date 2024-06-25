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
import shoppet.cookie.CookieService;
import shoppet.order.OrderDAO;
import shoppet.product.productDAO;
import shoppet.product.productDTO;
import shoppet.validation.Validation;

/**
 *
 * @author nhutm
 */
public class OrderServlet extends HttpServlet {
    private final String ORDER_SUCCESS_PAGE = "OrderSuccess.jsp";
    private final String PAYMENT_PAGE = "Payment.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
       
            String email = "";
            boolean isOrder = true;
            HashMap<String, Integer> listProductsBuy = new HashMap<>();
            String address = request.getParameter("txtAddress");
            String transportFee = request.getParameter("txtTransportFee");
            String total = request.getParameter("txtTotal");
            String idProductError ="";
            String erorrMessage = "";
             productDTO productError = null;
            HttpSession session = request.getSession();
            if(session != null){
               listProductsBuy = ( HashMap<String, Integer>)session.getAttribute("LIST_PRODUCTS_BUY");
            }
            CookieService cookieService = new CookieService();
            Cookie cookie = cookieService.getCookieByName(request,"_e");
            if(cookie != null){
                email = Validation.decoded(cookie.getValue());
            }
            for(String item : listProductsBuy.keySet()){
                 productDAO dao = new productDAO();
                 int currQuantity = dao.getQuantity(item);
                 if(listProductsBuy.get(item) > currQuantity){
                     isOrder = false;
                     idProductError =  item;
                     listProductsBuy.put(item, currQuantity);
                     productError = dao.getProductDetail(idProductError);
                     erorrMessage = "Sorry for the inconvenience! But the shop's " + productError.getName() + " product only has " +currQuantity+ " product left. We would like to get "+currQuantity+" products for you.";
                     break;
                 }
            }
            if(isOrder){
                OrderDAO dao = new OrderDAO();
                if(!email.equals("")){ 
                    boolean orderResult = dao.insertOrder(email,Integer.parseInt(transportFee), address, Integer.parseInt(total),listProductsBuy);
                }
                if( session.getAttribute("LIST_PRODUCTS_BUY") != null)session.removeAttribute("LIST_PRODUCTS_BUY");
                if( session.getAttribute("ERORRMESSAGE") != null)session.removeAttribute("ERORRMESSAGE");
                if( session.getAttribute("USER") != null)session.removeAttribute("USER");
                response.sendRedirect(ORDER_SUCCESS_PAGE);
                return;
            }else{
                session.setAttribute("ERORRMESSAGE", erorrMessage);
                request.getRequestDispatcher(PAYMENT_PAGE).forward(request, response);
            }
            session.setAttribute("LIST_PRODUCTS_BUY", listProductsBuy);
        } catch (SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
