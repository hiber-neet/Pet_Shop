/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.naming.NamingException;
import shoppet.cart.cartDAO;
import shoppet.util.util;

/**
 *
 * @author nhutm
 */
public class productDAO {
    
    
    
    public List<productDTO> getProductOnSearchValue(String searchValue) throws SQLException, NamingException{
        List<productDTO> list = new ArrayList();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
             if(con != null){
                String query = "SELECT * FROM PRODUCT WHERE Name like ?";
                stm = con.prepareStatement(query);
                stm.setString(1,'%'+searchValue+'%');
                rs = stm.executeQuery();
                 while(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                    if(product.getQuantity() > 0){
                        list.add(product);
                    }
                    
                }
            }
        }finally{
             if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
         return list;
    }
    
    public String getImg(String IDProduct) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT Image FROM PRODUCT WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,IDProduct);
                rs = stm.executeQuery();
                if(rs.next()){
                    return rs.getString("Image");
                }
            }
        }finally{
             if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
    
    
    public List<productDTO> getProductRandom() throws SQLException, NamingException{
        List<productDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "  SELECT * FROM PRODUCT ORDER BY NEWID()";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                 while(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                    if(product.getQuantity() > 0){
                        list.add(product);
                    }
                    
                }
            }
        }finally{
              if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return list;
    }
    
    
    public List<productDTO> getAllProductOrderByName(String idProduct) throws NamingException, SQLException{
                List<productDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        if(!idProduct.equals("")){
            list.add(getProductDetail(idProduct));
        }        
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT * FROM PRODUCT WHERE NOT ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, idProduct);
                rs = stm.executeQuery();
                 while(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                        list.add(product);
                }
            }
        }finally{
              if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return list;
    }
    
    
    
    
    public List<productDTO> getProductOnType(String type, String category) throws SQLException, NamingException{
        List<productDTO> list = new ArrayList<>();
        Connection con =  null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT * FROM PRODUCT WHERE Type like ? AND Category like ?";
                stm = con.prepareStatement(query);
                stm.setString(1,'%'+type);
                stm.setString(2,'%'+category);
                rs = stm.executeQuery();
                while(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                    if(product.getQuantity() > 0){
                         list.add(product);
                    }
                   
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return list;
    }
    public HashSet<String> getCategoryOnType(String type) throws NamingException, SQLException {
        HashSet<String> category = new HashSet<>();
        Connection con =  null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT Category FROM PRODUCT WHERE Type like ?";
                stm = con.prepareStatement(query);
                stm.setString(1,'%'+type);
                rs = stm.executeQuery();
                while(rs.next()){
                     category.add(rs.getString("Category").toLowerCase());   
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return category;
    }
    
    public productDTO getProductDetail(String idProduct) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT * FROM PRODUCT WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,idProduct);
                rs = stm.executeQuery();
                if(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                    if(product.getQuantity() > 0){
                        return product;
                    }
                   
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
    public productDTO getProductDetailForAdmin(String idProduct) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT * FROM PRODUCT WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,idProduct);
                rs = stm.executeQuery();
                if(rs.next()){
                    productDTO product = new productDTO(rs.getString("ID"),
                            rs.getString("Name"),rs.getString("Type"),
                            rs.getString("Image"),
                            rs.getFloat("Size"),
                            rs.getInt("Price"),
                            rs.getInt("Quantity"),
                            rs.getString("Category"));
                    
                        return product;
                    
                   
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
    
    public boolean deleteProduct(String IDProduct) throws SQLException, NamingException{
        Connection con =  null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                cartDAO cart = new cartDAO();
                cart.deleteById(IDProduct);
                String query = "DELETE FROM PRODUCT WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,IDProduct);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean updateProduct(String idProduct, String img, String name, int quantity, int price, float size) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null && quantity > 0){
                String query = "UPDATE PRODUCT SET Name = ? , Image = ? , Size = ?, Price = ? , Quantity = ?  WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,name);
                if( img == null || img.equals("") ){
                    String img1 = getImg(idProduct);
                    stm.setString(2, img1);
                }else{
                    stm.setString(2,img);
                }
                stm.setFloat(3, (float)size);
                stm.setInt(4,price);
                stm.setInt(5,quantity);
                stm.setString(6,idProduct);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
  
    
    public String insertProduct(String name,String type, String img, float size, int price, int quantity, String category) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        String idProduct = getIDProduct(type);
        try{
            con = util.makeConnection();
            if(con != null && quantity > 0){
                String query = "INSERT INTO PRODUCT (ID,Name,Type,Image,Size,Price,Quantity,Category) VALUES (?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1,idProduct);
                stm.setString(2,name);
                stm.setString(3,type);
                stm.setString(4,img);
                stm.setFloat(5, size);
                stm.setInt(6,price);
                stm.setInt(7,quantity);
                stm.setString(8,category);
                stm.executeUpdate();
  
            }
            
            
            
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        
        return idProduct;
    }
    
    public String getIDProduct(String type) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String id = "";
        int number = 1;
        String result = "";
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT TOP 1 ID FROM PRODUCT WHERE Type = ? ORDER BY ID DESC";
                stm = con.prepareStatement(query);
                stm.setString(1, type.toUpperCase().trim());
                rs = stm.executeQuery();
                if(rs.next()){
                    id = rs.getString("ID");
                }
                
                if(type.length() <= 7){
                    if(!id.equals("")){
                        number = Integer.parseInt(id.substring(1,id.length()));
                    }
                    result = ""+type.trim().toUpperCase().charAt(0) +""+ String.format("%03d",number+1);
                }else{
                     if(!id.equals("")){
                        number = Integer.parseInt(id.substring(2,id.length()));
                    }
                    String[] productType = type.split("_");
                    result = ""+productType[0].trim().toUpperCase().charAt(0) + productType[1].trim().toUpperCase().charAt(0) + String.format("%03d",number+1);
                }
                return result;
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
    
    
    
    public int getQuantity(String idProduct) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quantity = 0;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT Quantity FROM PRODUCT WHERE ID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, idProduct);
                rs = stm.executeQuery();
                if(rs.next()){
                    quantity = Integer.parseInt(rs.getString("Quantity"));
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return quantity;
    }
}
