

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Food Website Design Tutorial</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    
<!-- header section starts      -->

<header class="header">

    <a href="#" class="logo"><i class="fas fa-utensils"></i>resto.</a>

    <nav class="navbar">
        <a class="active" href="#home">home</a>
        <a href="#dishes">dishes</a>
        <a href="#about">about</a>
        <a href="#menu">menu</a>
        <a href="#review">review</a>
        <a href="#order">order</a>
    </nav>

    <div class="icons">
        <i class="fas fa-bars" id="menu-bars"></i>
        <i class="fas fa-search" id="search-icon"></i>
        <a href="addcart.jsp" class="fas fa-shopping-cart" id=""></a>
        <a href="login.jsp" class="fas fa-user" id="login-btn"></a> 
    </div>

    <form action="" class="search-form">
        <input type="search" id="search-box" placeholder="search here...">
        <label for="search-box" class="fas fa-search"></label>
    </form>

        <div class="shopping-cart">
        <form action ="addcart" method="post">
        <div class="cart-content">
            
        </div>
        
        <div class="total"> 
            total : $19.69/- 
            <input type="hidden" value="">
        </div>
        <a href="#" class="btn" type="submit" >checkout</a>
        </form>
        </div>
    
    <form action="customerlogin" method="post" class="login-form">
        <h3>login now</h3>
        <input type="text" name="name" placeholder="User-Name" class="box">
        <input type="password" name="password" placeholder="your password" class="box">
        <p>forget your password <a href="#">click here</a></p>
        <p>don't have an account <a href="register.jsp">create now</a></p>
        <input type="submit" value="login now" class="btn">
    </form>

</header>

<!-- header section ends-->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="swiper-container home-slider">

        <div class="swiper-wrapper wrapper">

            <div class="swiper-slide slide">
                <div class="content">
                    <span>our special dish</span>
                    <h3>spicy noodles</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                    <a href="#" class="btn">order now</a>
                </div>
                <div class="image">
                    <img src="images/dish-1.png" alt="">
                </div>
            </div>

            <div class="swiper-slide slide">
                <div class="content">
                    <span>our special dish</span>
                    <h3>fried chicken</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                    <a href="#" class="btn">order now</a>
                </div>
                <div class="image">
                    <img src="images/home-img-2.png" alt="">
                </div>
            </div>

            <div class="swiper-slide slide">
                <div class="content">
                    <span>our special dish</span>
                    <h3>hot pizza</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                    <a href="#" class="btn">order now</a>
                </div>
                <div class="image">
                    <img src="images/home-img-3.png" alt="">
                </div>
            </div>

        </div>

        <div class="swiper-pagination"></div>

    </div>

</section>

<!-- home section ends -->

<!-- dishes section starts  -->

<section class="dishes" id="dishes">

    <h3 class="sub-heading"> our dishes </h3>
    <h1 class="heading"> popular dishes </h1>

    <div class="box-container">
        <%
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
          Statement st= c.createStatement();
          ResultSet rs = st.executeQuery("select * from products");
          while(rs.next()){
        %>
        <div class="box">
            <form action="like" method="post">
                     <input type="hidden" name="id" value="<%=rs.getString("Product_id")%>">
                     <input type="hidden" name="p_name" value="<%=rs.getString("Product_name")%>">
                     <input type="hidden" name="liked" value="<%out.println(rs.getString("product_like"));%>">
                     <input type="hidden" name="like" value="<%out.println(rs.getString("product_like"));%>">
                     <button type="sumbit"><a class="fas fa-heart"></a></button>
                 </form>
                     <form method="post" action="addcart">
             <a href="#" class="fas fa-eye"></a>
            <img src="images/<%=rs.getString("product_pic")%>" alt="">
            <input type="hidden" name="p_name" value="<%=rs.getString("Product_name")%>">
            <h3><%out.println(rs.getString("Product_name"));%><br><br>
                Enter amount: <input type="number" name="amount" class="box"></h3>
                <input type="hidden" name="category" value="<%=rs.getString("category")%>">
             <input type="hidden" name="customername" value="<%=session.getAttribute("name")%>">
             <input type="hidden" name="customerid" value="<%=session.getAttribute("id")%>">
             <input type="hidden" name="gender" value="<%=session.getAttribute("gender")%>">
             <input type="hidden" name="location" value="<%=session.getAttribute("region")%>">
             <input type="hidden" name="pic" value="<%=rs.getString("product_pic")%>">
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <input type="hidden" name="p_price" value="<%=rs.getString("Product_price")%>">
            <span>UGX.<%out.println(rs.getString("Product_price"));%></span>
            
            <button type="submit"><a class="btn add-cart" >add to cart</a></button>
        </div> 
                     </form>  
        
        
      

        <%
            }
        %>

    </div>

</section>

<!-- dishes section ends -->

<!-- about section starts  -->
<!-- 
<section class="about" id="about">

    <h3 class="sub-heading"> about us </h3>
    <h1 class="heading"> why choose us? </h1>

    <div class="row">

        <div class="image">
            <img src="images/about-img.png" alt="">
        </div>

        <div class="content">
            <h3>best food in the country</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, sequi corrupti corporis quaerat voluptatem ipsam neque labore modi autem, saepe numquam quod reprehenderit rem? Tempora aut soluta odio corporis nihil!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam, nemo. Sit porro illo eos cumque deleniti iste alias, eum natus.</p>
            <div class="icons-container">
                <div class="icons">
                    <i class="fas fa-shipping-fast"></i>
                    <span>free delivery</span>
                </div>
                <div class="icons">
                    <i class="fas fa-dollar-sign"></i>
                    <span>easy payments</span>
                </div>
                <div class="icons">
                    <i class="fas fa-headset"></i>
                    <span>24/7 service</span>
                </div>
            </div>
            <a href="#" class="btn">learn more</a>
        </div>

    </div>

</section> -->

<!-- about section ends -->

<!-- menu section starts  -->

<section class="dishes" id="menu">

    <h3 class="sub-heading"> our menu </h3>
    <h1 class="heading"> Our speciality </h1>
   
    <div class="box-container">
      <%
          
    ResultSet rt = st.executeQuery("select * from products where category='"+"pizza"+"' ");
    while(rt.next()){
    %>
     <div class="box">
    <form action="like" method="post">
                     <input type="hidden" name="id" value="<%=rt.getString("Product_id")%>">
                     <input type="hidden" name="p_name" value="<%=rt.getString("Product_name")%>">
                     <button type="sumbit"><a class="fas fa-heart"></a></button>
                 </form>
    <form method="post" action="addcart">
        
            <div class="image">
                <img src="images/<%=rt.getString("product_pic")%>" alt="" class="product-img">
                <input type="hidden" name="p_name" value="<%=rt.getString("Product_name")%>">
                <input type="hidden" name="p_price" value="<%=rt.getString("Product_price")%>">
                <input type="hidden" name="category" value="<%=rt.getString("category")%>">
                <input type="hidden" name="customername" value="<%=session.getAttribute("name")%>">
             <input type="hidden" name="customerid" value="<%=session.getAttribute("id")%>">
             <input type="hidden" name="gender" value="<%=session.getAttribute("gender")%>">
             <input type="hidden" name="location" value="<%=session.getAttribute("region")%>">
             <input type="hidden" name="pic" value="<%=rt.getString("product_pic")%>">
            </div>
            <div class="content">
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                   
               <h3><%out.println(rt.getString("Product_name"));%><br><br>
                Enter amount: <input type="number" name="amount" class="box"></h3>
               
             
                <span class="price"><%out.println(rt.getString("Product_price"));%></span> 
                <button type="submit"><a class="btn add-cart">add to cart</a></button>
            </div>
       
    </form>
        </div>

    <%
        }
    %>

    </div>

</section>

<!-- menu section ends -->

<!-- review section starts  -->

<section class="review" id="review">

    <h3 class="sub-heading"> customer's review </h3>
    <h1 class="heading"> what they say </h1>

    <div class="swiper-container review-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="images/pic-1.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="images/pic-2.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="images/pic-3.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="images/pic-4.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

        </div>

    </div>
    
</section>

<!-- review section ends -->

<!-- order section starts  -->

<section class="order" id="order">

    <h3 class="sub-heading"> order now </h3>
    <h1 class="heading"> free and fast </h1>

    <form action="">

        <div class="inputBox">
            <div class="input">
                <span>your name</span>
                <input type="text" placeholder="enter your name">
            </div>
            <div class="input">
                <span>your number</span>
                <input type="number" placeholder="enter your number">
            </div>
        </div>
        <div class="inputBox">
            <div class="input">
                <span>your order</span>
                <input type="text" placeholder="enter food name">
            </div>
            <div class="input">
                <span>additional food</span>
                <input type="test" placeholder="extra with food">
            </div>
        </div>
        <div class="inputBox">
            <div class="input">
                <span>how musch</span>
                <input type="number" placeholder="how many orders">
            </div>
            <div class="input">
                <span>date and time</span>
                <input type="datetime-local">
            </div>
        </div>
        <div class="inputBox">
            <div class="input">
                <span>your address</span>
                <textarea name="" placeholder="enter your address" id="" cols="30" rows="10"></textarea>
            </div>
            <div class="input">
                <span>your message</span>
                <textarea name="" placeholder="enter your message" id="" cols="30" rows="10"></textarea>
            </div>
        </div>

        <input type="submit" value="order now" class="btn">

    </form>

</section>

<!-- order section ends -->

<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>locations</h3>
            <a href="#">uganda</a>
            <a href="#">Kampala</a>
            <a href="#">Makerere</a>
            <a href="#">kikoni</a>
            
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#">home</a>
            <a href="#">dishes</a>
            <a href="#">about</a>
            <a href="#">menu</a>
            <a href="#">reivew</a>
            <a href="#">order</a>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <a href="#">+256-7779840</a>
            <a href="#">+256-702266969</a>
            <a href="#">shaikhanas@gmail.com</a>
            <a href="#">anasbhai@gmail.com</a>
            <a href="#">mumbai, india - 400104</a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#">facebook</a>
            <a href="#">twitter</a>
            <a href="#">instagram</a>
            <a href="#">linkedin</a>
        </div>

    </div>

    <div class="credit"> copyright @ 2021 by <span>mr. web designer</span> </div>

</section>

<!-- footer section ends -->

<!-- loader part  -->
<div class="loader-container">
    <img src="images/loader.gif" alt="">
</div>





















<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>
