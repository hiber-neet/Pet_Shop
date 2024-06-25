/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;
import shoppet.product.productDAO;
import shoppet.util.util;

/**
 *
 * @author nhutm
 */
public class cartDAO {
    
    public HashMap<String,Integer> getCartOnEmail(String email) throws SQLException, NamingException{
        HashMap<String,Integer> list = new HashMap<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT IDProduct , Quantity FROM CART WHERE Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,email);
                rs = stm.executeQuery();
                while(rs.next()){
                    String idProduct = rs.getString("IDProduct");
                    int quantity = rs.getInt("Quantity");
                    list.put(idProduct, quantity);
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return list;
    }
    
    
    
    public boolean addToCart(String IDProduct, int quantity, String Email) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                int reQuantity = getQuantity(IDProduct, Email);
                if(reQuantity > 0){
                    String query = "UPDATE CART SET Quantity = Quantity + ? WHERE Email = ? AND IDProduct = ?";
                    stm = con.prepareStatement(query);
                    stm.setInt(1, quantity);
                    stm.setString(2, Email);
                    stm.setString(3, IDProduct);
                    int affectedRows = stm.executeUpdate();
                    return affectedRows > 0;
                }else{
                    String query = "INSERT INTO CART (Email,IDProduct,Quantity) VALUES(?,?,?)";
                    stm = con.prepareStatement(query);
                    stm.setString(1,Email);
                    stm.setString(2,IDProduct);
                    stm.setInt(3,quantity);
                    int affectedRows  = stm.executeUpdate();
                    return affectedRows > 0;
                }
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    
    public int getQuantity(String IDProduct,String Email) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quanity = 0;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT Quantity FROM CART WHERE IDProduct = ? AND Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,IDProduct);
                stm.setString(2,Email);
                rs = stm.executeQuery();
                if(rs.next()){
                    quanity = Integer.parseInt(rs.getString("Quantity"));
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        
        return quanity;
    }
    
     
    public void deleteProductInCart(String idProduct, String email ) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con  != null){
                String query = "DELETE FROM CART WHERE Email = ? AND IDProduct = ?";
                 stm = con.prepareStatement(query);
                 stm.setString(1, email);
                 stm.setString(2,idProduct);
                 stm.executeUpdate();
                
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
    }
    
    public void deleteProductInCart(HashMap<String,Integer> list, String email ) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con  != null){
                String query = "DELETE FROM CART WHERE Email = ? AND IDProduct = ?";
                 stm = con.prepareStatement(query);
                for(String item : list.keySet()){
                   stm.setString(1, email);
                   stm.setString(2,item);
                   stm.executeUpdate();
                }
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
    }
    
    
    public boolean reduceQuantity(String email, String idProduct,int quantity) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
               if(quantity > 1 ){
                    String query = "UPDATE CART SET Quantity = Quantity - 1 WHERE Email = ? AND IDProduct = ?";
                    stm = con.prepareStatement(query); 
                    stm.setString(1, email);
                    stm.setString(2,idProduct);
                    int affetedRows = stm.executeUpdate();
                    return affetedRows > 0;
               }
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean increaseQuantity(String email, String idProduct,int quantity) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            productDAO dao = new productDAO();
            int quantityAvailable = dao.getQuantity(idProduct);
            if(con != null){
               if(quantity < quantityAvailable ){
                    String query = "UPDATE CART SET Quantity = Quantity + 1 WHERE Email = ? AND IDProduct = ?";
                    stm = con.prepareStatement(query); 
                    stm.setString(1, email);
                    stm.setString(2,idProduct);
                    int affetedRows = stm.executeUpdate();
                    return affetedRows > 0;
               }
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean deleteById(String id) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "Delete from cart where IDProduct = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, id);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null)stm.close();
            if(con != null)con.close();
        }
        return false;
    }
}
