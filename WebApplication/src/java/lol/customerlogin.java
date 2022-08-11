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
@WebServlet(name = "customerlogin", urlPatterns = {"/customerlogin"})
public class customerlogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
             HttpSession session = request.getSession();
            if(name != null && password != null){
               DatabaseConn connection = new DatabaseConn();
             Connection con = connection.getConn();
                Statement st= con.createStatement();
               ResultSet r = st.executeQuery("select * from customers where name='"+name+"' and password = '"+password+"'");
                if (r.next()) {
                 
                    session.setAttribute("id", r.getInt("Customer_id"));
                    session.setAttribute("name", r.getString("name"));
                    session.setAttribute("gender", r.getString("Gender"));
                    session.setAttribute("region", r.getString("region"));
                     
                 
                    response.sendRedirect("index.jsp");
                } else {
                    String Login =
"<!DOCTYPE html>\n" +
"<html>\n" +
"    <head>\n" +
"        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
"        <title>LOGIN</title>\n" +
"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"<!--===============================================================================================-->	\n" +
"	<link rel=\"icon\" type=\"image/png\" href=\"images/icons/favicon.ico\"/>\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/bootstrap/css/bootstrap.min.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"fonts/iconic/css/material-design-iconic-font.min.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/animate/animate.css\">\n" +
"<!--===============================================================================================-->	\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/css-hamburgers/hamburgers.min.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/animsition/css/animsition.min.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/select2/select2.min.css\">\n" +
"<!--===============================================================================================-->	\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/daterangepicker/daterangepicker.css\">\n" +
"<!--===============================================================================================-->\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"css/util.css\">\n" +
"	<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\n" +
"<!--===============================================================================================-->\n" +
"\n" +
"    </head>\n" +
"    <body>\n" +
"      <div class=\"limiter\">\n" +
"		<div class=\"container-login100\">\n" +
"			<div class=\"wrap-login100\">\n" +
"                            <form class=\"login100-form validate-form\" method=\"post\" action=\"customerlogin\">\n" +
"					<span class=\"login100-form-title p-b-26\">\n" +
"						Welcome\n" +
"					</span>\n" +
"					<span class=\"login100-form-title p-b-48\">\n" +
"						<i class=\"zmdi zmdi-font\"></i>\n" +
"					</span>\n" +
"\n" +                                    "<label class="+"text-danger"+">WRONG USER-NAME OR PASSWORD</label>"+
"					<div class=\"wrap-input100 validate-input\" data-validate = \"Valid email is: a@b.c\">\n" +
"						<input class=\"input100\" type=\"text\" name=\"name\">\n" +
"						<span class=\"focus-input100\" data-placeholder=\"User-Name\"></span>\n" +
"					</div>\n" +
"\n" +
"					<div class=\"wrap-input100 validate-input\" data-validate=\"Enter password\">\n" +
"						<span class=\"btn-show-pass\">\n" +
"							<i class=\"zmdi zmdi-eye\"></i>\n" +
"						</span>\n" +
"						<input class=\"input100\" type=\"password\" name=\"password\">\n" +
"						<span class=\"focus-input100\" data-placeholder=\"Password\"></span>\n" +
"					</div>\n" +
"\n" +
"					<div class=\"container-login100-form-btn\">\n" +
"						<div class=\"wrap-login100-form-btn\">\n" +
"							<div class=\"login100-form-bgbtn\"></div>\n" +
"							<button class=\"login100-form-btn\">\n" +
"								Login\n" +
"							</button>\n" +
"						</div>\n" +
"					</div>\n" +
"\n" +
"					<div class=\"text-center p-t-115\">\n" +
"						<span class=\"txt1\">\n" +
"							Don’t have an account?\n" +
"						</span>\n" +
"\n" +
"						<a class=\"txt2\" href=\"#\">\n" +
"							Sign Up\n" +
"						</a>\n" +
"					</div>\n" +
"				</form>\n" +
"			</div>\n" +
"		</div>\n" +
"	</div>\n" +
"	\n" +
"\n" +
"	<div id=\"dropDownSelect1\"></div>\n" +
"	\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/jquery/jquery-3.2.1.min.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/animsition/js/animsition.min.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/bootstrap/js/popper.js\"></script>\n" +
"	<script src=\"vendor/bootstrap/js/bootstrap.min.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/select2/select2.min.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/daterangepicker/moment.min.js\"></script>\n" +
"	<script src=\"vendor/daterangepicker/daterangepicker.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"vendor/countdowntime/countdowntime.js\"></script>\n" +
"<!--===============================================================================================-->\n" +
"	<script src=\"js/main.js\"></script>\n" +
"\n" +
"    </body>\n" +
"</html>\n" +
"";
            
                    out.println(Login);
                }
            
            } else{
                 
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(customerlogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(customerlogin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(customerlogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(customerlogin.class.getName()).log(Level.SEVERE, null, ex);
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
