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
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GERALD
 */
@WebServlet(name = "CalculateQuantity", urlPatterns = {"/CalculateQuantity"})
public class CalculateQuantity extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           String Pizza = request.getParameter("dailyInput");
           
           int pizza = Integer.parseInt(Pizza);
           
            DatabaseConn connection = new DatabaseConn();
            Connection c = connection.getConn();
             Statement st= c.createStatement();
             Statement statement = c.createStatement();
            AppData data = new AppData();
            ResultSet rs= data.getProducts();
            if(rs.next()){
                 ResultSet r = statement.executeQuery("select count(Product_id) from products where Product_line='"+"long-term"+"'");
                 r.next();
                
            int old_quantity = rs.getInt(1);
            int new_quantity = (old_quantity+pizza)/r.getInt(1);
             int neww_quantity = (old_quantity+pizza);
              ResultSet r1 = statement.executeQuery("select count(Product_id) from products where Product_line='"+"middle-term"+"'");
              r1.next();
              int new_chicken = ((neww_quantity/2))/r1.getInt(1);
              ResultSet r2 = statement.executeQuery("select count(Product_id) from products where Product_line='"+"short-term"+"'");
             r2.next();
            int new_burger_drinks = ((neww_quantity/4))/r2.getInt(1);
            String New_quantity = Integer.toString(new_quantity);
            String New_chicken = Integer.toString(new_chicken);
            String New_burger_drinks = Integer.toString(new_burger_drinks);
             st.executeUpdate("update products set Product_quantity='"+New_quantity+"' where category='"+"pizza"+"'");
             st.executeUpdate("update products set Product_quantity='"+New_chicken+"' where category='"+"chicken"+"'");
             st.executeUpdate("update products set Product_quantity='"+New_burger_drinks+"' where category='"+"burger"+"'");
             st.executeUpdate("update products set Product_quantity='"+New_burger_drinks+"' where category='"+"drinks"+"'");
             response.sendRedirect("Products.jsp");
            
            }
            else{
            response.sendRedirect("Products.jsp");
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CalculateQuantity.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(CalculateQuantity.class.getName()).log(Level.SEVERE, null, ex);
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
