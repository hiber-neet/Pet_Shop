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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nhutm
 */
public class SecurityCodeServlet extends HttpServlet {

    private final String CHANGE_PASSWORD_PAGE = "ChangePassword.jsp";
    private final String SECURITY_CODE_PAGE = "SecurityCode.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String code = request.getParameter("txtCode");
       
            HttpSession session = request.getSession();
            String codeTrue = (String) session.getAttribute("CODE_VERIFY");
        
            String url = "";
            String messageError ="";
            if(codeTrue.equals(code)){
                session.removeAttribute("CODE_VERIFY");
                url = CHANGE_PASSWORD_PAGE;
                response.sendRedirect(url);
                return;
            }else{
                messageError = "Verify code is not correct";
                url = SECURITY_CODE_PAGE;
            }
            request.setAttribute("messageError", messageError);
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
