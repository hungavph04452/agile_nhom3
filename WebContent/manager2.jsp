<%@page import="java.util.ArrayList"%>
<%@page import="entity.account"%>
<%@page import="java.util.List"%>
<%@page import="dao.accountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/tab.css">
</head>
<body>
<jsp:include page="headerManager.jsp"></jsp:include>
<form action="insertAccount" method="post">
		<div class="add-wrap">
			<div class="add-window">
				<input type="text" name="username" placeholder="Tài khoản ............."/>	
				<input type="password" name="password" placeholder="Mật khẩu ............."/>	
				<input type="text" name="fullname"  placeholder="Họ và tên ............."/>	
				<input type="number" name="phone" placeholder="Phone ............."/>
				<input type="text" name="email" placeholder="Email ............."/>	
				<input type="text" name="address"  placeholder="Address ............."/>
			<br>Chức năng: <select style="padding-right: 260px;"  name="roles">
					<option>0</option>
					<option>1</option>
				</select>	
			</br>	
				<button type="submit" name="action" value="Insert">Thêm</button>
			</div>
		</div>
	</form>

	<div class="add-new-btn">
		<i class="material-icons">add</i>
	</div>
	<div class="tool-tip">Thêm mới</div>
	<div class="tool-tip-tri"></div>

	<br />
<div class="tableSearch">
		<table class="responstable">
			<tr>
				<th>STT</th>
				<th>Mã tài khoản</th>
				<th>Tài khoản</th>
				<th>Tên</th>
				<th>SDT</th>
				<th>Email</th>
				<th>Địa chỉ</th>
				<th>Chức năng</th>
				<th>Xóa</th>
			</tr>
							<%
							int count = 0;	
								List<account > listacc= (List<account>) request.getAttribute("listsearch");
								if (!(listacc == null)) {
							for (account acc : listacc) {										
							%>
			<form action="deleteAcount" method="post">
					<tr>
						<td><%=count ++%></td>
						<td><%=acc.getIdAccount()%></td>
						<td><%=acc.getUsername()%></td>
						<td><%=acc.getFullname()%></td>
						<td><%=acc.getPhone()%></td>
						<td><%=acc.getEmail()%></td>
						<td><%=acc.getAddress()%></td>
						<td><%=acc.getRoles()%></td>


						<td><input type="hidden" name="idAccount" value="<%=acc.getIdAccount()%>">
							<button type="submit" name="action" value="Delete"
								onclick="return confirm('bạn có muốn xóa ???')">
								<i class="fa fa-2x fa-trash-o"></i></td> 
								<%-- <td><a href='deleteLogin?username=<%=acc.getUsername()%>'>delete</a></td> --%>
					</tr>
					</form>
				<%
				}
								}
			%>
		</table>
			
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>