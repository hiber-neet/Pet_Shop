/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nhutm
 */
@MultipartConfig
public class DispatchServlet extends HttpServlet {
    
    private final String HOME_PAGE = "Home.html";
    private final String REGISTER_SERVLET = "RegistrationServlet";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String FORGOT_PASSWORD_SERVLET = "ForgotPasswordServlet";
    private final String SECURITY_CODE_SERVLET = "SecurityCodeServlet";
    private final String CHANGE_PASSWORD_SERVLET = "ChangePasswordServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String ACCOUNT_SERVLET = "AccountServlet";
    private final String UPDATE_USER_INFOR_SERVLET = "UpdateUserInforServlet";
    private final String GET_TYPE_SERVLET = "GetTypeServlet";
    private final String DETAIL_PRODUCT_SERVLET = "DetailProductServlet";
    private final String ADD_TO_CART_SERVLET = "AddTocartServlet";
    private final String BUY_SERVLET = "BuyServlet";
    private final String ORDER_SERVLET = "OrderServlet";
    private final String DELETE_PRODUCT_SERVLET = "DeleteProductServlet";
    private final String UPDATE_PRODUCT_SERVLET = "UpdateProductServlet";
    private final String ADD_PRODUCT_SERVLET = "AddProductServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String DELETE_IN_CART_SERVLET ="DeleteInCartServLet";
    private final String REDUCE_SERVLET = "ReduceServlet";
    private final String INCREASE_SERVLET = "IncreaseServlet";
    private final String DELETE_IN_PAYMENT = "DeleteInPaymentServlet";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
           String action = request.getParameter("btAction");
           String url =  HOME_PAGE;
           if(action == null){
               
           }else if(action.equals("Login")){
               url = LOGIN_SERVLET;
           }else if(action.equals("Register")){
               url = REGISTER_SERVLET;
           }else if(action.equals("SendCode")){
               url = FORGOT_PASSWORD_SERVLET;
           }else if(action.equals("Continue")){
               url = SECURITY_CODE_SERVLET;
           }else if(action.equals("Change")){
               url = CHANGE_PASSWORD_SERVLET;
           }else if(action.equals("Logout")){
               url = LOGOUT_SERVLET;
           }else if(action.equals("Account")){
               url = ACCOUNT_SERVLET;
           }else if(action.equals("Save")){
               url = UPDATE_USER_INFOR_SERVLET;
           }else if(action.equals("GetType")){
               url = GET_TYPE_SERVLET;
           }else if(action.equals("Detail")){
               url = DETAIL_PRODUCT_SERVLET;
           }else if(action.equals("AddToCart")){
               url = ADD_TO_CART_SERVLET;
           }else if(action.equals("Buy")){
               url = BUY_SERVLET;
           }else if(action.equals("Order")){
               url = ORDER_SERVLET;
           }else if(action.equals("Delete")){
               url = DELETE_PRODUCT_SERVLET;
           }else if(action.equals("Update")){
               url = UPDATE_PRODUCT_SERVLET;
           }else if(action.equals("Add")){
               url = ADD_PRODUCT_SERVLET;
           }else if(action.equals("Search")){
               url = SEARCH_SERVLET;
           }else if(action.equals("DeleteInCart")){
               url = DELETE_IN_CART_SERVLET;
           }else if(action.equals("Increase")){
               url = INCREASE_SERVLET;
           }else if(action.equals("Reduce")){
               url = REDUCE_SERVLET;
           }else if(action.equals("DeleteInPayment")){
               url = DELETE_IN_PAYMENT;
           }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
