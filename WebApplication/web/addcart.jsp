
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css">
       
    </head>
    <body style=" background-image: url('images/home-img-3.png'); ">
        
          <div class="col-xl-12 col-lg-12 col-md-6 col-sm-12 col-12, h-100 d-flex align-items- justify-content-center">
                            <div class="card">
                                <h5 class="card-header">Your Cart</h5>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-light">
                                                <tr class="border-0">
                                                    
                                                    <th class="border-0">Image</th>
                                                    <th class="border-0">Product Name</th>
                                                    <th class="border-0">Product Price</th> 
                                                    <th class="border-0">Product Amount</th>
                                                    <th class="border-0">Total Amount</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                String Customer_name =(String) session.getAttribute("name");
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
                                                Statement st= c.createStatement();
                                      
                                                ResultSet rs = st.executeQuery("select product_pic,product_name,product_price,product_amount,total_cost from cart where customer_name='"+Customer_name+"'");
                                                
                                                while(rs.next()){
                                                %>
                                            <form action="deleteitem" method="post">
                                                <tr>
                                           
                                                    <td>
                                                        <div class="m-r-10"><img src="images/<%=rs.getString("product_pic")%>" alt="user" class="rounded" width="45"></div>
                                                    </td>
                                                    <td><%out.println(rs.getString("product_name"));%></td>
                                                     <input type="hidden" name="p_name" value="<%=rs.getString("product_name")%>">
                                                    <td><%out.println(rs.getString("product_price"));%></td>
                                                    <td><%out.println(rs.getString("product_amount"));%></td>
                                                    <td><%out.println(rs.getString("total_cost"));%></td>
                                                    <td><button type="submit" class="btn-outline-danger float-right">DELETE ITEM</button></td>
                                            
                                                </tr>
                                                </form>
                                               <%
                                                   }
                                               %>
                                               <% 
                                                  ResultSet r =st.executeQuery("select SUM(total_cost) as total from cart where customer_name='"+Customer_name+"'");
                                                  while(r.next()){%>
                                               <tr>
                                                   <td colspan="9" ><div style = "float: right">TOTAL: <%out.println(r.getInt(1));%></div></td>
                                               </tr>
                                               <% } %>
                                                <tr>
                                                    <td colspan="9"><a href="delete_cart_update_sales" class="btn btn-outline-dark float-right" id="buy">Check out</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div> 
    </body>
</html>
