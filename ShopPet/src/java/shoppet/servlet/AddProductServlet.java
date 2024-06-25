/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import shoppet.product.productDAO;

/**
 *
 * @author nhutm
 */
@MultipartConfig(
        fileSizeThreshold = 1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)
public class AddProductServlet extends HttpServlet {
   private final String ADMIN_PAGE = "Admin.jsp";
   private final String ADD_PRODUCT_PAGE = "AddProduct.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ADMIN_PAGE;
        try {
            
            String name = request.getParameter("txtName");
            String type = request.getParameter("txtType");
            String category = request.getParameter("txtCategory");
            float size = Float.valueOf(request.getParameter("txtSize"));
            int price = Integer.parseInt(request.getParameter("txtPrice"));
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            
      
            
            
            
            Part filePart = request.getPart("txtImg");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            if(fileName == null || fileName.equals("")){
                    String ERROR_FILE = "Must be not null";
                    request.setAttribute("ERROR_FILE", ERROR_FILE);
                    url = ADD_PRODUCT_PAGE;
                  
            }else{
                String pathSaveFile = getServletContext().getRealPath("");
                String basePath = pathSaveFile +"img\\img-product\\";
                File uploads = new File(basePath);
                if (!uploads.exists()) {
                        uploads.mkdirs();
                }
                File file = new File(uploads, fileName);
                InputStream fileContent = filePart.getInputStream();
                Files.copy(fileContent,file.toPath(),StandardCopyOption.REPLACE_EXISTING);
                productDAO dao = new productDAO();
                String insertResult = dao.insertProduct(name, type, fileName, size, price, quantity, category);
                if(insertResult != null){
                    HttpSession session = request.getSession();
                    if(session == null){
                         session = request.getSession(true);
                    }
                    session.setAttribute("ID_PRODUCT_NEW", insertResult);
                    response.sendRedirect(url);
                    return;
                }
            }
            
                
              request.getRequestDispatcher(url).forward(request, response);
           
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
