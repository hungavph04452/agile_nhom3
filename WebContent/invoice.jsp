<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="headerInvoice.jsp"></jsp:include>
	<%
		invoiceDao inDao = new invoiceDao();
		List<invoice> list = inDao.getInvoice();
	%>
	<br />

	<h2 style="text-align: center;">Quản lý đơn hàng</h2>

	<p>
		<font style="font-size: large;">Chú thích trạng thái (*)</font> <br> <font style="color: blue;"> 0 : Chờ xác
			nhận </font> <font style="color: red;">1 : Chưa xác nhận</font> <br> <font
			style="color: fuchsia;">2 : Đã xác nhận</font> <font
			style="color: orange;">3 : Hủy</font>
	</p>

	<div class="tableSearch">

		<table class="responstable">

			<tr>
				<th>STT</th>
				<th>Mã hóa đơn</th>
				<th>Tên khách hàng</th>
				<th>Số điện thoại</th>
				<th>Địa chỉ</th>
				<th>Ngày</th>
				<th>Trạng thái</th>
				<th>Tổng tiền</th>
				<th>Mã tài khoản</th>
				<th>Chỉnh sửa</th>
			</tr>
			<%
				int count = 0;
				for (invoice in : list) {
			%>
			<form action="invoice" method="post">
				<tr>
					<td><%=count++%></td>
					<td><a href="detailInvoice?idInvoice=<%=in.getIdInvoice()%>"><%=in.getIdInvoice()%></a></td>
					<td><%=in.getName()%></td>
					<td><%=in.getPhoneNumber()%></td>
					<td><%=in.getAddressNumber()%></td>
					<td><%=in.getDate()%></td>
					<td><%=in.getStatus()%></td>
					<td><%=in.getTotal()%></td>
					<td><%=in.getIdAccount()%></td>
					<td><a
						href='invoiceUpdate.jsp?idInvoice=<%=in.getIdInvoice()%>'>Chỉnh
							sửa</a></td>
				</tr>
			</form>
			<%
				}
			%>
		</table>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>