<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        CH
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
</head>
<body>
<!-- *** TOPBAR ***
_________________________________________________________ -->
<div id="top">
    <div class="container">
        <div class="col-md-6 offer" data-animate="fadeInDown">

        </div>
        <div class="col-md-6" data-animate="fadeInDown">
           <c:if test="${username==null }">
            <ul class="menu">
                <li><a href="login.jsp">Đăng nhập / Đăng ký</a>
                </li>
            </ul>
            </c:if>
            <c:if test="${username!=null }">
            <ul class="menu">
				<li><a >Xin chào: ${username}</a>
                </li>
                <li><a href="logout">Thoát</a>
                </li>
            </ul>
            </c:if>
        </div>
    </div>

</div>

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
_________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container" style="background-color:gold">
        <div class="navbar-header">

            <a class="navbar-brand home" href="index.jsp" data-animate-hover="bounce">
                <img src="img/logo.jpg" alt="Obaju logo" class="hidden-xs" style="width:100px; height:100%;"><span class="sr-only">CH</span>
            </a>

        </div>
        <!--/.navbar-header -->

        <div class="navbar-collapse collapse" id="navigation">

            <ul class="nav navbar-nav navbar-left">
                <li class="active"><a href="index.jsp">Trang chủ</a>
                </li>
                <li class="dropdown yamm-fw">
                    <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Cửa hàng <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h5>Thời trang phụ nữ</h5>
                                        <ul>
                                            <li><a href="index.jsp">Accessories</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Thời trang cho bé</h5>
                                        <ul>
                                            <li><a href="index.jsp">Trainers</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Thời trang  đàn ông</h5>
                                        <ul>
                                            <li><a href="index.jsp">Trainers</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-3">
                                        <h5>Trang phục dạ hội</h5>
                                        <ul>
                                            <li><a href="index.jsp">Trainers</a>
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

            <div class="navbar-collapse collapse right" id="basket-overview">
                <a href="shopCart.jsp" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Giỏ hàng</span></a>
            </div>
            <!--/.nav-collapse -->

        </div>


        <!--/.nav-collapse -->

    </div>
    <!-- /.container -->
    
        
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->
</body>
</html>