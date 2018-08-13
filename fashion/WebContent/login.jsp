<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</head>
<body>
<jsp:include page="headerCustomer.jsp"></jsp:include>

<!-- *** NAVBAR END *** -->

		 <div id="content" style="background-color: gold;">
            <div class="container">

                <div class="col-md-6">
                    <div class="box">
                        <h1>Tạo tài khoản</h1>

                        <hr>

                        <form action="register" method="post">
                     		 <div class="form-group">
                                <label for="username">Tài khoản</label>
                                <input type="text" class="form-control" name="username">
                            	</div>
                            	<div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="form-group">
                                <label for="fullname">Tên</label>
                                <input type="text" class="form-control" name="fullname">
                            </div>
							  <div class="form-group">
                                <label for="phone">Số điện thoại</label>
                                <input type="number" class="form-control" name="phone">
                            </div>
                             <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" name="email">
                            </div>
                             <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" name="address">
                            </div>							 
                            <div class="text-center">
                                <button type="submit" name="action" class="btn btn-primary"><i class="fa fa-user-md" ></i> Đăng kí</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box">
                        <h1>Đăng nhập</h1>
                        <%if(session.getAttribute("login_access")!=null){
                       		session.getAttribute("login_access");
                        } %>
                        <hr>

                        <form action="login" method="post" >
                           <div class="form-group">
                               <label for="username">Tài khoản</label>
                                <input type="text" class="form-control" name="username">
                            </div>
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="text-center">
                                <button type="submit" name="btAction" class="btn btn-primary"><i class="fa fa-sign-in"></i> Đăng nhập</button>
                            </div>
                        </form>
                    </div>
                </div>
 

            </div>
            <!-- /.container -->
        </div>
     
        <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>