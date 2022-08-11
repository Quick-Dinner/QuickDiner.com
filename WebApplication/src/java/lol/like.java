/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lol;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
@WebServlet(name = "NewServlet", urlPatterns = {"/like"})
public class like extends HttpServlet {

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
            String product_id = request.getParameter("id");
            String name = request.getParameter("p_name");
            String like = request.getParameter("liked");
            int l = Integer.parseInt(like)+1;
            out.print(like);
           int id= Integer.parseInt(product_id);
           Class.forName("com.mysql.jdbc.Driver");
               Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
               Statement st= c.createStatement();
               
                 Cookie[] cookies = request.getCookies();
                 if(cookies!=null){
                 for (Cookie cookie : cookies) {
                 if(cookie.getName().equals(name)){
                   like = request.getParameter("like");
                 
                 }
                 }
                 }
                 out.print(like);
                 Cookie liked = new Cookie(name,"1");
                 response.addCookie(liked);
                   st.executeUpdate("update products set product_like='"+like+"' where Product_id='"+id+"'");
         
              /* ResultSet rs = st.executeQuery("select * from products where Product_id='"+id+"'");
                HttpSession session = request.getSession();
                
               
               out.println(id);
                if(session.getAttribute("like")=="null"){
                  int new_like=0;
              while(rs.next()){
               String the_like = rs.getString("product_like");
               new_like = Integer.parseInt(the_like)-1;
              boolean val=true;
               session.setAttribute("like", val);
               out.print(val);
            }   
            st.executeUpdate("update products set product_like="+new_like+" where Product_id='"+id+"'");
            response.sendRedirect("index.jsp");
                }else{
                 int new_like=0;
               while(rs.next()){
               String the_like = rs.getString("product_like");
               new_like = Integer.parseInt(the_like)+1;
                
               session.setAttribute("like", "null");
             
            }   
            st.executeUpdate("update products set product_like="+new_like+" where Product_id='"+id+"'");
            response.sendRedirect("index.jsp");
                }
                
            */
              //commented from here
              
             /* ResultSet rs = st.executeQuery("select product_like from products where Product_id='"+id+"'");   
                  rs.next();
                  int new_like = rs.getInt(1);
                    Cookie[] cookies = request.getCookies();
                    for(Cookie cookie:cookies){
                       
                         out.print(cookie.getName());
                      
                        if(cookie.getName().equals(name)){
                             new_like = new_like-1;
                             st.executeUpdate("update products set product_like="+new_like+" where Product_name='"+name+"'");
                             cookie = new Cookie("null","");
                             cookie.setMaxAge(0);
                             out.print("removed");
                             
                        }else{
                            
                            Cookie cooky = new Cookie(name,"");
                             response.addCookie(cooky);
                        
 
                             new_like = new_like+1;
                            
                             st.executeUpdate("update products set product_like="+new_like+" where Product_name='"+name+"'");
                             out.print("created");
                             ;
                            
                        }
                    }
//            for (Cookie cookie : cookies) {
//                //out.println(cookie.getName());
//                if(name.equals(cookie.getName())){
//                    rs.next();
//                    int new_like = rs.getInt(1)-1;
//                    out.println("aaaaa");
//                    st.executeUpdate("update products set product_like="+new_like+" where Product_name='"+name+"'");
//                    cookie.setMaxAge(0);
//                    
//                    //response.sendRedirect("index.jsp");
//                    
//                } else{
//                     Cookie cooks = new Cookie(name,"");
//                    rs.next();
//                    int new_like = rs.getInt(1)+1;
//                   // out.print(new_like);
//                    st.executeUpdate("update products set product_like="+new_like+" where Product_name='"+name+"'");
//                   // out.println("sssss");
//                  
//                    //out.print(cooks);
//                   // response.sendRedirect("index.jsp");
//                    
//                }
//            }*/
             
              
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
            Logger.getLogger(like.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(like.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(like.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(like.class.getName()).log(Level.SEVERE, null, ex);
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
