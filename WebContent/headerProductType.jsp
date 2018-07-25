<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/searchstyle.css">
 <script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/search.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/tab.css">

<!--===============================================================================================-->

<meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        Obaju 
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet">

    <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">
    
      <!-- Font khac -->
         <link rel="icon" type="image/png" href="http://twitch.michaelcharl.es/images/favicon.png">
	
<!-- for Google -->
<meta name="description" content="This is a channel monitor for Twitch. It shows if users are online, offline, or if their accounts are inactive. It was designed to follow Google's Material Design design language." />
<meta name="keywords" content="JavaScript,FreeCodeCamp,twitch,material,design,monitor,channel,stream" />
<meta name="application-name" content="Twitch Channel Monitor" />

<!-- for Facebook -->          
<meta property="og:title" content="Twitch Channel Monitor" />
<meta property="og:type" content="article" />
<meta property="og:image" content="http://twitch.michaelcharl.es/images/share.jpg" />
<meta property="og:description" content="This is a channel monitor for Twitch. It shows if users are online, offline, or if their accounts are inactive. It was designed to follow Google's Material Design design language." />

<!-- for Twitter -->          
<meta name="twitter:card" content="summary" />
<meta name="twitter:title" content="Twitch Channel Monitor" />
<meta name="twitter:description" content="This is a channel monitor for Twitch. It shows if users are online, offline, or if their accounts are inactive. It was designed to follow Google's Material Design design language." />
<meta name="twitter:image" content="http://twitch.michaelcharl.es/images/share.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
</head>
</head>
<body>
<!-- *** TOPBAR ***
_________________________________________________________ -->
<div id="top">
    <div class="container">
        <div class="col-md-6 offer" data-animate="fadeInDown">

        </div>
        <div class="col-md-6" data-animate="fadeInDown">
            <ul class="menu">
                <li><a>Xin chào: ${username}</a>
                </li>
                <li><a href="logout">Thoát</a>
                </li>

            </ul>
        </div>
    </div>

</div>

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
_________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand home" href="indexManager.jsp" data-animate-hover="bounce">
                <img src="img/logo.png" alt="Obaju logo" class="hidden-xs">
                <img src="img/logo-small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">Obaju</span>
            </a>

        </div>
        <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="indexManager.jsp">Trang chủ</a>
                    </li>


                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Cửa hàng <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h5>Thời trang phụ nữ</h5>
                                        <ul>
                                            <li><a href="category.html">Accessories</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Thời trang cho bé</h5>
                                        <ul>
                                            <li><a href="category.html">Trainers</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Thời trang  đàn ông</h5>
                                        <ul>
                                            <li><a href="category.html">Trainers</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Trang phục dạ hội</h5>
                                        <ul>
                                            <li><a href="category.html">Trainers</a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="manager.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Quản lý <b class="caret"></b></a>
                   <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                <div class="row">
                                    <div class="col-sm-3">
                                      
                                        <ul>
                                            <li><a href="manager.jsp"><h5>Quản lý tài khoản</h5></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                      
                                        <ul>
                                            <li><a href="productType.jsp"><h5>Quản lý loại sản phẩm</h5></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                  
                                        <ul>
                                            <li><a href="product.jsp"><h5>Quản lý sản phẩm</h5></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                  
                                        <ul>
                                            <li><a href="invoice.jsp"><h5>Quản lý đơn hàng</h5></a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

               <!--  <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="basket.html" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Giỏ hàng</span></a>
                </div> -->
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <form class="navbar-form" role="searchProductType" action="searchProductType" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Tìm kiếm..." name="txtsearchPt">
                        </div>
                    </form>
                </div>

            </div>


            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

</body>
</html>