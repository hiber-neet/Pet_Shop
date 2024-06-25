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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import shoppet.product.productDAO;
import shoppet.product.productDTO;

/**
 *
 * @author nhutm
 */
@MultipartConfig(
        fileSizeThreshold = 1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)  
public class UpdateProductServlet extends HttpServlet {
    private final String UPDATE_PRODUCT_PAGE = "UpdateProduct.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            productDAO dao = new  productDAO();
            String idProduct = request.getParameter("idProduct");
            String name = request.getParameter("txtName");
            if(  name != null){
                float size = Float.valueOf(request.getParameter("txtSize"));
                int price = Integer.parseInt(request.getParameter("txtPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                System.out.println(quantity);
                Part filePart = request.getPart("txtImg");
                
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                   if(fileName != null && !fileName.equals("")){
                       String pathSaveFile = getServletContext().getRealPath("");
                        String basePath = pathSaveFile +"img\\img-product\\";
                        File uploads = new File(basePath);
                        if (!uploads.exists()) {
                            uploads.mkdirs();
                        }
                         File file = new File(uploads, fileName);
                         InputStream fileContent = filePart.getInputStream();
                         Files.copy(fileContent,file.toPath(),StandardCopyOption.REPLACE_EXISTING);
                   }
                    
                

                 boolean updateResult = dao.updateProduct(idProduct, fileName, name, quantity, price, size);
                 String message = "";
                 if(updateResult){
                     message = "Update successfully";
                 }else{
                     message = "Update fail";
                 }
                 request.setAttribute("MESSAGE", message);
               
            }

            
            
            
            
            productDTO product = dao.getProductDetailForAdmin(idProduct);
            request.setAttribute("PRODUCT",product);
            
            RequestDispatcher rd = request.getRequestDispatcher(UPDATE_PRODUCT_PAGE);
            rd.forward(request, response);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
