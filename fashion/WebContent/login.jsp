<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>

<link rel='stylesheet prefetch'
	href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

<link rel="stylesheet" href="css/style.css">


</head>
<body>
	<div class="login-card">
		<h1>Log-in</h1>
		<%
			if (session.getAttribute("login_access") != null) {
				session.getAttribute("login_access");
			}
		%>
		<br>
		<form action="login" method="post">
			<div class="form-group">
				<label for="username">Tài khoản</label> <input type="text"
					class="form-control" name="username">
			</div>
			<div class="form-group">
				<label for="password">Mật khẩu</label> <input type="password"
					class="form-control" name="password">
			</div>
			<div class="text-center">
				<button type="submit" name="btAction" class="btn btn-primary">
					<i class="fa fa-sign-in"></i> Đăng nhập
				</button>
			</div>
		</form>
		<div class="login-help">
			<a href="user/register.htm">Register</a> • <a href="#">Forgot
				Password</a>
		</div>
	</div>

	<!-- <div id="error"><img src="https://dl.dropboxusercontent.com/u/23299152/Delete-icon.png" /> Your caps-lock is on.</div> -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
</body>
</html>