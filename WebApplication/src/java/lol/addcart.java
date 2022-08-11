/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lol;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author GERALD
 */
@WebServlet(name = "addcart", urlPatterns = {"/addcart"})
public class addcart extends HttpServlet {

   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
                 String product_name = request.getParameter("p_name");
         String product_price = request.getParameter("p_price");
         String Customer_name = request.getParameter("customername");
         String category = request.getParameter("category");
        
         
         String Customer_id = request.getParameter("customerid");
         String Customer_gender = request.getParameter("gender");
         String Customer_location = request.getParameter("location");
         String amount = request.getParameter("amount");
         String product_pic = request.getParameter("pic");
         
           if(amount.isEmpty()){
            amount="1";
            }
          int total = Integer.parseInt(product_price)*Integer.parseInt(amount);
           String total_amount = Integer.toString(total);
           
           HttpSession ss = request.getSession();
        
          
           if(ss.getAttribute("name") != null){
             
              DatabaseConn connection = new DatabaseConn();
              Connection con = connection.getConn();
              Statement st= con.createStatement();
               ResultSet rs = st.executeQuery("select * from cart where product_name='"+product_name+"' and Customer_id='"+Customer_id+"'");
              if(rs.next()){
                 String old_amount = rs.getString("product_amount");
                 int q = Integer.parseInt(old_amount);
                 int new_amount = Integer.parseInt(amount)+q;
                 int total_cost = Integer.parseInt(product_price)*new_amount;
                st.executeUpdate("update cart set product_amount='"+new_amount+"', total_cost='"+total_cost+"' where product_name='"+product_name+"' and customer_id='"+Customer_id+"'");
                 response.sendRedirect("addcart.jsp");
              }
              else{
               st.executeUpdate("insert into cart(customer_name,Customer_id,product_pic,product_name,category,product_price,product_amount,total_cost) values('"+Customer_name+"','"+Customer_id+"','"+product_pic+"','"+product_name+"','"+category+"','"+product_price+"','"+amount+"','"+total_amount+"') ");
               response.sendRedirect("addcart.jsp");
              }
           }
           else{
              response.sendRedirect("login.jsp");
           }
            
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
        try {
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(addcart.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(addcart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(addcart.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(addcart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
