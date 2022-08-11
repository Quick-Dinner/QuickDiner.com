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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
@WebServlet(name = "Allocate", urlPatterns = {"/Allocate"})
public class Allocate extends HttpServlet {

    DatabaseConn conn = new DatabaseConn();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
          Connection con = conn.getConn();
          Statement st = con.createStatement();
            
          //retuerning sales for each product
          ResultSet res1 = st.executeQuery("select sum(Product_Quantity) from sales where category= '"+"pizza"+"'");
            res1.next();
            int pizza_sales = res1.getInt(1);
            
           ResultSet res2 = st.executeQuery("select sum(Product_Quantity) from sales where category= '"+"chicken"+"'");
            res2.next();
            int chicken_sales = res2.getInt(1);
           
            ResultSet res3 = st.executeQuery("select sum(Product_Quantity) from sales where category= '"+"burger"+"'");
            res3.next();
            int burger_sales = res3.getInt(1);
          
             ResultSet res4 = st.executeQuery("select sum(Product_Quantity) from sales where category= '"+"drnks"+"'");
            res4.next();
            int juice_sales = res4.getInt(1);
          
            //counting number of employees in each product line
            
            ResultSet L_employees = st.executeQuery("select count(id) from employees where role = '"+"long"+"'");
            L_employees.next();
            int longTermEmp = L_employees.getInt(1);
           
             ResultSet M_employees = st.executeQuery("select count(id) from employees where role = '"+"medium"+"'");
            M_employees.next();
            int mediumTermEmp = M_employees.getInt(1);
            
            ResultSet S_employees = st.executeQuery("select count(id) from employees where role = '"+"short"+"'");
            S_employees.next();
            int shortTermEmp = S_employees.getInt(1);
               
            out.print(burger_sales);
            
            
            //comparing sales
            if((pizza_sales > chicken_sales)&&(pizza_sales > (burger_sales+juice_sales))&& (chicken_sales > (burger_sales+juice_sales))){
                 out.print("here1");
                int count = 1;
                int updateCount = (int) (0.5*shortTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"short"+"'");
                while(result.next()){
                    st.executeUpdate("update employees set role = '"+"long"+"' where id = '"+result.getString("id")+"' ");
                    if(count == updateCount){
                        break;
                    }
                    count++;
                }
                
                
            }else if((pizza_sales > chicken_sales)&&(pizza_sales > (burger_sales+juice_sales) )&& ((burger_sales+juice_sales) > chicken_sales)){
                out.print("here2");
                int count = 1;
                int updateCount = (int) (0.5*mediumTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"medium"+"'");
                while(result.next()){
                    st.executeUpdate("update employees set role = '"+"long"+"' where id = '"+result.getString("id")+"' ");
                    if(count == updateCount){
                        break;
                    }
                    count++;
                }
                
            }else if((chicken_sales > pizza_sales)&& (chicken_sales > (burger_sales+juice_sales))&& (pizza_sales > (burger_sales+juice_sales))){
                 out.print("here3");
                int count = 1;
                int updateCount = (int) (0.5*shortTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"short"+"'");
                while(result.next()){
                    st.executeUpdate("update employees set role = '"+"medium"+"' where id = '"+result.getString("id")+"' ");
                    if(count == updateCount){
                        break;
                    }
                    count++;
                }
                
            }else if((chicken_sales > pizza_sales)&&(chicken_sales > (burger_sales+juice_sales))&& ((burger_sales+juice_sales) > pizza_sales)){
                 out.print("here4");
               
                int count = 1;
                int updateCount = (int) (0.5*longTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"long"+"'");
                while(result.next()){
                   Statement stm = con.createStatement();
                    stm.executeUpdate("update employees set role = '"+"medium"+"' where id = '"+result.getString("id")+"' ");
                    if(count == updateCount){
                        break;
                    }
                    count++;
                }
                
            }else if(((burger_sales + juice_sales) > pizza_sales)&&((burger_sales+juice_sales) > chicken_sales)&& (pizza_sales>chicken_sales)){
                  out.print("here5");
                int count = 1;
                int updateCount = (int) (0.5*mediumTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"medium"+"'");
                while(result.next()){
                    Statement st1 = con.createStatement();
                    st1.executeUpdate("update employees set role = '"+"short"+"' where id = '"+result.getString("id")+"' ");
                    if(count == updateCount){
                        break;
                    }
                    count++;
                }
                
            }else if(((burger_sales+juice_sales) > pizza_sales)&& ((burger_sales+juice_sales) > chicken_sales)&&(chicken_sales > pizza_sales)){
                       out.print("here6");
                int count = 1;
                int updateCount = (int) (0.5*longTermEmp);
                ResultSet result = st.executeQuery("select * from employees where role = '"+"long"+"'");
                while(result.next()){
                    Statement st2 = con.createStatement();
                    st2.executeUpdate("update employees set role = '"+"short"+"' where id = '"+result.getString("id")+"' ");
            
                    if(count == updateCount){
                       
                        break;
                    }
                       
                    count++;
                      
                }
                out.print(count);
           
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
            Logger.getLogger(Allocate.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Allocate.class.getName()).log(Level.SEVERE, null, ex);
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
