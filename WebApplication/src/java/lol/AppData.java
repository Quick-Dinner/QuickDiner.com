/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lol;

import java.sql.*;

public class AppData {
    
     DatabaseConn connection = new DatabaseConn();
     Connection con = connection.getConn();
     
     public ResultSet getProducts() throws SQLException{
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery("select sum(Product_quantity) from products where Product_line='"+"long-term"+"'");
         
         
         return rs;
     }
      public ResultSet Products() throws SQLException{
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery("select * from products ");
         
         
         return rs;
     }
        
     public ResultSet getEmployees() throws SQLException{
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery("select * from employees");
         
         
         return rs;
     }
     public int getLongTermEmp() throws SQLException{
      int num;
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select count(id) from employees where role = '"+"long"+"'");
      rs.next();
      num = rs.getInt(1);
      return num;
     }
     public int getMediumTermEmp() throws SQLException{
      int num;
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select count(id) from employees where role = '"+"medium"+"'");
      rs.next();
      num = rs.getInt(1);
      return num;
     }
     public int getShortTermEmp() throws SQLException{
      int num;
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select count(id) from employees where role = '"+"short"+"'");
      rs.next();
      num = rs.getInt(1);
      return num;
     }
    
    
}
