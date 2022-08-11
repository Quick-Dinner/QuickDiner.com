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
import java.time.LocalDate;
/**
 *
 * @author GERALD
 */
@WebServlet(name = "delete_cart_update_sales", urlPatterns = {"/delete_cart_update_sales"})
public class delete_cart_update_sales extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            DatabaseConn connection = new DatabaseConn();
     Connection con = connection.getConn();
     
               Statement statement= con.createStatement();
               Statement stt= con.createStatement();
               HttpSession session = request.getSession();
               String customer_name=(String) session.getAttribute("name");
               String customer_id= session.getAttribute("id").toString();
               String customer_gender=(String) session.getAttribute("gender");
               String region=(String) session.getAttribute("region");
               ResultSet rs = statement.executeQuery(" select product_name,category, product_price, product_amount, total_cost from cart where customer_id='"+customer_id+"'");
               Statement st= con.createStatement();
               LocalDate date = LocalDate.now();
              
               int i=0;
               while(rs.next()){
                 
                 
                 String product_name=rs.getString("product_name");
                 out.println(product_name);
                 String category = rs.getString("category");
                 out.print(category);
                 String product_price=rs.getString("product_price");
                 String product_amount = rs.getString("product_amount");
                 String total_cost = rs.getString("total_cost");    
                 stt.executeUpdate("INSERT INTO sales (Product_name, Product_Price, Product_Quantity,category, Amount, Customer_id, Customer_gender, region,order_time) VALUES ('"+product_name+"','"+product_price+"','"+product_amount+"','"+category+"','"+total_cost+"','"+customer_id+"','"+customer_gender+"','"+region+"','"+date+"')");                          
                 stt.executeUpdate("delete from cart where product_name = '"+product_name+"' and Customer_id='"+customer_id+"'");
                 ResultSet rt = st.executeQuery("select Product_quantity from products where Product_name='"+product_name+"'");
                rt.next();
                int new_q = rt.getInt(1)-Integer.parseInt(product_amount);
                out.print(new_q);
                stt.executeUpdate("update products set Product_quantity ="+new_q+" where Product_name='"+product_name+"'");
                
               
                  
               }
             
               stt.executeUpdate("insert into orders(customer_id,order_time) values ('"+customer_id+"','"+date+"')");
             
               response.sendRedirect("index.jsp");
        
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(delete_cart_update_sales.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delete_cart_update_sales.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(delete_cart_update_sales.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delete_cart_update_sales.class.getName()).log(Level.SEVERE, null, ex);
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
