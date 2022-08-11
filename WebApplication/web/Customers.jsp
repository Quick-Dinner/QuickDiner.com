
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "lol.DatabaseConn, java.sql.*" %>

<% 

    
 DatabaseConn conn = new DatabaseConn();
    Connection con = conn.getConn();
    Statement st = con.createStatement();
    
    ResultSet results = st.executeQuery("select count(id) from employees where role= '"+"long"+"'");
    results.next();
    int l = results.getInt(1);
    ResultSet ress = st.executeQuery("select count(id) from employees where role= '"+"medium"+"'");
    ress.next();
    int m = ress.getInt(1);
    ResultSet shortres = st.executeQuery("select count(id) from employees where role= '"+"short"+"'");
    shortres.next();
    int s = shortres.getInt(1);
    //new querries
    
    ResultSet res = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"male"+"' AND Product_name = '"+"pizza"+"'");
    res.next();
    int p = res.getInt(1);
    ResultSet res1 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"male"+"' AND Product_name = '"+"burgers"+"'");
    res1.next();
    int b = res1.getInt(1);
    ResultSet res2 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"male"+"' AND Product_name = '"+"chicken"+"'");
    res2.next();
    int c = res2.getInt(1);
    ResultSet res3 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"male"+"' AND Product_name = '"+"juice"+"'");
    res3.next();
    int d = res3.getInt(1);
     ResultSet r = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"female"+"' AND Product_name = '"+"pizza"+"'");
    r.next();
    int p1 = r.getInt(1);
    ResultSet r1 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"female"+"' AND Product_name = '"+"burgers"+"'");
    r1.next();
    int b1 = r1.getInt(1);
    ResultSet r2 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"female"+"' AND Product_name = '"+"chicken"+"'");
    r2.next();
    int c1 = r2.getInt(1);
    ResultSet r3 = st.executeQuery("select count(Customer_gender) from sales where Customer_gender= '"+"female"+"' AND Product_name = '"+"juice"+"'");
    r3.next();
    int d1 = r3.getInt(1);

//according to location-western
ResultSet result = st.executeQuery("select count(Region) from sales where Region= '"+"western"+"' AND category = '"+"pizza"+"'");
    result.next();
    int w1 = result.getInt(1);
    ResultSet result1 = st.executeQuery("select count(Region) from sales where Region= '"+"western"+"' AND category = '"+"burger"+"'");
    result1.next();
    int w2  = result1.getInt(1);
    ResultSet result2 = st.executeQuery("select count(Region) from sales where Region= '"+"western"+"' AND category = '"+"chicken"+"'");
    result2.next();
    int w3 = result2.getInt(1);
    ResultSet result3 = st.executeQuery("select count(Region) from sales where Region= '"+"western"+"' AND category = '"+"drinks"+"'");
    result3.next();
    int w4 = result3.getInt(1);
//according to location-central
    ResultSet result4 = st.executeQuery("select count(Region) from sales where Region= '"+"central"+"' AND category = '"+"pizza"+"'");
    result4.next();
    int central = result4.getInt(1);
    ResultSet result5 = st.executeQuery("select count(Region) from sales where Region= '"+"central"+"' AND category = '"+"burger"+"'");
    result5.next();
    int central1  = result5.getInt(1);
    ResultSet result6 = st.executeQuery("select count(Region) from sales where Region= '"+"central"+"' AND category = '"+"chicken"+"'");
    result6.next();
    int central2 = result6.getInt(1);
    ResultSet result7 = st.executeQuery("select count(Region) from sales where Region= '"+"central"+"' AND category = '"+"drinks"+"'");
    result7.next();
    int central3 = result7.getInt(1);
//according to location-eastern
    ResultSet re = st.executeQuery("select count(Region) from sales where Region= '"+"eastern"+"' AND category = '"+"pizza"+"'");
    re.next();
    int e1 = re.getInt(1);
    ResultSet re1 = st.executeQuery("select count(Region) from sales where Region= '"+"eastern"+"' AND category = '"+"burger"+"'");
    re1.next();
    int e2  = re1.getInt(1);
    ResultSet re2 = st.executeQuery("select count(Region) from sales where Region= '"+"eastern"+"' AND category = '"+"chicken"+"'");
    re2.next();
    int e3 = re2.getInt(1);
    ResultSet re3 = st.executeQuery("select count(Region) from sales where Region= '"+"eastern"+"' AND category = '"+"drinks"+"'");
    re3.next();
    int e4 = re3.getInt(1);
//according to location-northern
    ResultSet re4 = st.executeQuery("select count(Region) from sales where Region= '"+"northern"+"' AND category = '"+"pizza"+"'");
    re4.next();
    int n1 = re4.getInt(1);
    ResultSet re5 = st.executeQuery("select count(Region) from sales where Region= '"+"northern"+"' AND category = '"+"burger"+"'");
    re5.next();
    int n2  = re5.getInt(1);
    ResultSet re6 = st.executeQuery("select count(Region) from sales where Region= '"+"northern"+"' AND Product_name = '"+"chicken"+"'");
    re6.next();
    int n3 = re6.getInt(1);
    ResultSet re7 = st.executeQuery("select count(Region) from sales where Region= '"+"northern"+"' AND category = '"+"drinks"+"'");
    re7.next();
    int n4 = re7.getInt(1);
        

%>

<!doctype html>
<html lang="en">

 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foodies</title>
    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper" style = "background: white">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
       <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="../index.html">Concept</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="../assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="../assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">
John Abraham</span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="../assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="../assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                            <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                <li class="connection-list">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/github.png" alt="" > <span>Github</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/dribbble.png" alt="" > <span>Dribbble</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/dropbox.png" alt="" > <span>Dropbox</span></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/bitbucket.png" alt=""> <span>Bitbucket</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/mail_chimp.png" alt="" ><span>Mail chimp</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="../assets/images/slack.png" alt="" > <span>Slack</span></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="conntection-footer"><a href="#">More</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">
John Abraham</h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
       <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="AdminDashboard.jsp" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Dashboard <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">E-Commerce</a>
                                            <div id="submenu-1-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="index.html">E Commerce Dashboard</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product.html">Product List</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product-single.html">Product Single</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product-checkout.html">Product Checkout</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="dashboard-finance.html">Customer Tracking</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="dashboard-sales.html">Sales</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-1" aria-controls="submenu-1-1">Infulencer</a>
                                            <div id="submenu-1-1" class="collapse submenu" >
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="dashboard-influencer.html">Influencer</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="influencer-finder.html">Influencer Finder</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="influencer-profile.html">Influencer Profile</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-rocket"></i>Customer Tracking</a>
                                <div id="submenu-2" class="collapse submenu" >
                                    
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="HRManagement.jsp" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-chart-pie"></i>Human Resource</a>
                                <div id="submenu-3" class="collapse submenu" >
                                   
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Sales.jsp" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Sales</a>
                                <div id="submenu-4" class="collapse submenu" >
                                   
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Products.jsp" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>Products</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                   
                                </div>
                            </li>
                            <li class="nav-divider">
                                Features
                            </li>
                           
                           
                           
                           
                            <li class="nav-item">
                                <a class="nav-link" href="Reports.jsp" data-toggle="collapse" aria-expanded="false" data-target="#submenu-10" aria-controls="submenu-10"><i class="fas fa-f fa-folder"></i>Reports</a>
                                <div id="submenu-10" class="collapse submenu" style="">
                                   
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" >
                        <div class="page-header">
                            <h2 class="pageheader-title">Customer Tracking </h2>
                            <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Pages</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">customers</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                       
                        <div class="row">
                             
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div id="femalechart" style="height: 200px; width: 400px; margin: 0px auto;"></div>
                        </div>
                            
                         <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div id="malechart" style="height: 200px; width: 400px; margin: 0px auto;"></div>
                        </div> 
                            
                        </div>
                        
                    </div>
                </div>
                
                 <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 mt-5">
                                <div class="card">
                                    
                                    <div class="card-body">
                                      <div id="chartContainer" style="height: 370px; max-width: 900px; margin: 0px auto;"></div>
                                    </div>
                                </div>
                            </div>
                
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end main wrapper -->
        <!-- ============================================================== -->
    </div>
    
    <input type="hidden" name = "female_pizza" value="<%out.print(p1);%>" id="pizza_f">
    <input type="hidden" name = "female_" value="<%out.print(b1);%>" id="burger_f">
    <input type="hidden" name = "female_chicken" value="<%out.print(c1);%>" id="chicken_f">
    <input type="hidden" name = "female_drinks" value="<%out.print(d1);%>" id="drinks_f">
    <!-- male pref -->
    <input type="hidden" name = "male_pizza" value="<%out.print(p);%>" id="pizza_m">
    <input type="hidden" name = "male_" value="<%out.print(b);%>" id="burger_m">
    <input type="hidden" name = "male_chicken" value="<%out.print(c);%>" id="chicken_m">
    <input type="hidden" name = "male_drinks" value="<%out.print(d);%>" id="drinks_m">
     <!--western region preference -->
    <input type="hidden"  value="<%out.print(p);%>" id="pizza_w">
    <input type="hidden"  value="<%out.print(b);%>" id="burger_w">
    <input type="hidden"  value="<%out.print(c);%>" id="chicken_w">
    <input type="hidden" value="<%out.print(d);%>" id="drinks_w">
       <!--eastern region preference -->
    <input type="hidden"  value="<%out.print(e1);%>" id="pizza_e">
    <input type="hidden"  value="<%out.print(e2);%>" id="burger_e">
    <input type="hidden"  value="<%out.print(e3);%>" id="chicken_e">
    <input type="hidden" value="<%out.print(e4);%>" id="drinks_e">
       <!--central region preference -->
    <input type="hidden"  value="<%out.print(central);%>" id="pizza_c">
    <input type="hidden"  value="<%out.print(central1);%>" id="burger_c">
    <input type="hidden"  value="<%out.print(central2);%>" id="chicken_c">
    <input type="hidden" value="<%out.print(central3);%>" id="drinks_c">
       <!--northern region preference -->
    <input type="hidden"  value="<%out.print(n1);%>" id="pizza_n">
    <input type="hidden"  value="<%out.print(n2);%>" id="burger_n">
    <input type="hidden"  value="<%out.print(n3);%>" id="chicken_n">
    <input type="hidden" value="<%out.print(n4);%>" id="drinks_n">
    
    
    
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="../assets/libs/js/main-js.js"></script>
     <script src="js/charts/femalebarchart.js"></script>
     <script src="js/charts/canvasjs.min.js"></script>
    
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
</body>
 
</html>
