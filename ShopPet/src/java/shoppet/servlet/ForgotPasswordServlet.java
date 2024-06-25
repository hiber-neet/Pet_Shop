/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
public class ForgotPasswordServlet extends HttpServlet {
    
    private final String USER_NAME = "tran.minh.nhut.29.12.2003@gmail.com";
    private final String PASSWORD = "cgqafughvmkesnlh";
    private final String FORGOT_PASSWORD_PAGE = "ForgotPassword.jsp";
    private final String SECURITY_CODE_PAGE = "SecurityCode.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        String smtpServer = "smtp.gmail.com";
        int smtpPort = 465;
        String fromEmail = "tran.minh.nhut.29.12.2003@gmail.com";
        String toEmail = request.getParameter("txtEmail");
        registrationDAO dao = new registrationDAO();
        String url = "";
        if(dao.emailValid(toEmail)){
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpServer);
            props.put("mail.smtp.port", smtpPort);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.enable", "true");


            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USER_NAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Verify password changes");

            /// send code 
            String codeVerify = Validation.getCodeVerify();
            message.setText(codeVerify);
            Transport.send(message);

            HttpSession session1 = request.getSession(true);
            session1.setAttribute("EMAIL",toEmail);
            session1.setAttribute("CODE_VERIFY",codeVerify);
            url = SECURITY_CODE_PAGE;
        }else{
            request.setAttribute("ERROR_MAIL","Email account has not been registered yet");
            url = FORGOT_PASSWORD_PAGE;
        }
       
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (MessagingException | SQLException | NamingException ex) {
            Logger.getLogger(ForgotPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
