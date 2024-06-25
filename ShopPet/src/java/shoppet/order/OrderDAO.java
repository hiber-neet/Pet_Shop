/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.naming.NamingException;
import shoppet.product.productDAO;
import shoppet.product.productDTO;
import shoppet.util.util;
/**
 *
 * @author nhutm
 */
public class OrderDAO {
    
    
    public void updateQuantity(HashMap<String,Integer> productsOrder) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "UPDATE PRODUCT SET Quantity = Quantity - ? WHERE ID = ?";
                stm = con.prepareStatement(query);
                for(String product : productsOrder.keySet()){
                    stm.setInt(1,productsOrder.get(product));
                    stm.setString(2,product);
                    stm.executeUpdate();
                }
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
    }
    
    
    
    
    public boolean insertOrder(String email, int transportFee, String address, int totalPrice, HashMap<String,Integer> productsOrder) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "INSERT INTO ORDERS (IDOrder,UserEmail,Time,TransportFee,Address,TotalPrice) VALUES (?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                String IDOrder = convertIDOrder(getOrderTh());
                stm.setString(1, IDOrder);
                stm.setString(2,email);
                stm.setDate(3, new Date(System.currentTimeMillis()));
                stm.setInt(4, transportFee);
                stm.setString(5,address);
                stm.setInt(6,totalPrice);
                int affectedRows = stm.executeUpdate();
                boolean resultOrderdeatil =   insertOrderDetail(IDOrder, productsOrder);
                updateQuantity(productsOrder);
                return affectedRows > 0 && resultOrderdeatil;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        
        return false;
    }
    
    public String convertIDOrder(int number){
        String IDOrder = "H"+ String.format("%04d", number+1);
        return IDOrder;
    }
    
    
    
    public boolean insertOrderDetail(String IDOrder,HashMap<String, Integer> productsOrder) throws SQLException, NamingException{
        Connection con= null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                productDAO dao = new productDAO();
                String query = "INSERT INTO ORDERS_DETAIL(IDProduct,IDOrder,NameProduct,Quantity,UnitPrice,TotalPrice) VALUES (?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                for(String item : productsOrder.keySet()){
                    int quantity = productsOrder.get(item);
                    productDTO product = dao.getProductDetail(item);
                    stm.setString(1, product.getId());
                    stm.setString(2,IDOrder);
                    stm.setString(3, product.getName());
                    stm.setInt(4,quantity);
                    stm.setInt(5,product.getPrice());
                    stm.setInt(6,quantity*product.getPrice());
                    stm.executeUpdate();
                }
            }
        }finally{
             if(stm != null) stm.close();
            if(con != null) con.close();
        }
        
        return false;
    }
    
    public int getOrderTh() throws SQLException, NamingException{
        int OrderTh = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT TOP (1) IDOrder FROM ORDERS ORDER BY IDOrder DESC";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
               if(rs.next()){
                    String IDOrder = rs.getString("IDOrder");
                    OrderTh = Integer.parseInt(IDOrder.substring(1,IDOrder.length()));
               }
            }
            
            
        }finally{
            if( rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return OrderTh;
    }
    
    
    public List<OrderDTO> getPurchaseOrder(String email ) throws SQLException, NamingException{
        List<OrderDTO> list = getIDOrderByEmail(email);
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT IDProduct, NameProduct, Quantity, TotalPrice  FROM ORDERS_DETAIL WHERE IDOrder = ?";
                stm = con.prepareStatement(query);
                for(int i = 0; i < list.size(); i++){
                    stm.setString(1,list.get(i).getOrderID());
                    rs = stm.executeQuery();
                    List<OrderDetailDTO> listInforProducts = new ArrayList<>();
                    while(rs.next()){
                        OrderDetailDTO orderDetail = new  OrderDetailDTO(
                                rs.getString("NameProduct"),
                                rs.getInt("Quantity"),
                                rs.getInt("TotalPrice"),
                                rs.getString("IDProduct")
                        ); 
                        listInforProducts.add(orderDetail);    
                        
                    }
                    list.get(i).setProductsOrder(listInforProducts);
                }
                
                
                
            }
        }finally{
             if( rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return list;
    }
    
    
    public List<OrderDTO> getIDOrderByEmail(String email) throws SQLException, NamingException{
        List<OrderDTO> list = new ArrayList<>();
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT IDOrder , TotalPrice FROM ORDERS WHERE UserEmail = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,email);
                rs = stm.executeQuery();
                while(rs.next()){
                   OrderDTO order = new OrderDTO();
                   order.setOrderID(rs.getString("IDOrder"));
                   order.setTotal(rs.getInt("TotalPrice"));
                   list.add(order);
                }
            }
        }finally{
            if( rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        
        return list;
    }
}
