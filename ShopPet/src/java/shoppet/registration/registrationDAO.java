/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import shoppet.util.util;

/**
 *
 * @author nhutm
 */
public class registrationDAO {
     public boolean authentication(String email, String password, boolean role) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = util.makeConnection();
            if (con != null) {
                String query = "Select * from users where Email = ? and Password = ? and Role = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, email);
                stm.setString(2, password);
                stm.setBoolean(3,role);
                rs = stm.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
     
    public boolean emailValid(String email) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "SELECT * FROM USERS WHERE Email =  ?";
                stm = con.prepareStatement(query);
                stm.setString(1,email);
                rs = stm.executeQuery();
                return rs.next();
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean registerUser(String Email, String Password, String Fullname, String Phone, String Address) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "INSERT INTO USERS (Email,FullName,Password,Address,Phone,Role) VALUES (?,?,?,?,?,0)";
                stm = con.prepareStatement(query);
                stm.setString(1, Email);
                stm.setString(2,Fullname);
                stm.setString(3,Password);
                stm.setString(4,Address);
                stm.setString(5,Phone);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    
    public boolean changePassword(String Email, String Password) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "UPDATE USERS SET Password = ? WHERE Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,Password);
                stm.setString(2,Email);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
    public String getRole(String email) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con !=  null){
                String query = "SELECT Role FROM USERS WHERE Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,email);
                rs = stm.executeQuery();
                while(rs.next()){
                   return String.valueOf(rs.getBoolean("Role"));
                }
            }
        }finally{
            if(rs !=  null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return "";
    }
    
    public registrationDTO getUserInfor(String email) throws SQLException, NamingException{
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = util.makeConnection();
            if(con !=  null){
                String query = "  SELECT Email, FullName, Phone, Address FROM USERS WHERE Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,email);
                rs = stm.executeQuery();
                while(rs.next()){
                    registrationDTO regis = new registrationDTO();
                    regis.setEmail(rs.getString("Email"));
                    regis.setFullname(rs.getString("FullName"));
                    regis.setPhone(rs.getString("Phone"));
                    regis.setAddress(rs.getNString("Address"));
                    return regis;
                }
            }
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
    
    
    public boolean updateUserInfor(registrationDTO regis) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = util.makeConnection();
            if(con != null){
                String query = "UPDATE USERS SET FullName = ?, Phone = ? , Address = ? WHERE Email = ?";
                stm = con.prepareStatement(query);
                stm.setString(1,regis.getFullname());
                stm.setString(2,regis.getPhone());
                stm.setString(3,regis.getAddress());
                stm.setString(4, regis.getEmail());
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        }finally{
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return false;
    }
}
