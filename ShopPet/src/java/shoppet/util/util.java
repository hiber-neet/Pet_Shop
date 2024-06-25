/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author nhutm
 */
public class util {
    public static Connection makeConnection() throws NamingException, SQLException{
        Connection con = null;
        //1. lay context cua website
        Context currentContext = new InitialContext();
        //2. lay context cua tomcat
        Context tomcatContext = (Context)currentContext.lookup("java:comp/env");
        //3. lay DataSource tu context cua? tomcat
        DataSource ds = (DataSource)tomcatContext.lookup("DBCon");
        //4. Tao connection
        con = ds.getConnection();
        return con;
    }
}
