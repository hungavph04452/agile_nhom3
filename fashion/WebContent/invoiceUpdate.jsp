<%@page import="poly.java4.entities.invoice"%>
<%@page import="poly.java4.dao.InvoiceDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Invoice</title>
<jsp:include page="_meta.jsp"></jsp:include>
<jsp:include page="_link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="_topbar.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<%
		InvoiceDaoImpl idl = new InvoiceDaoImpl();
		int idInvoice = Integer.parseInt(request.getParameter("idInvoice"));
		invoice i = idl.getInvoice(idInvoice);
	%>
	<div id="content">
		<div class="container">

			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>Invoice</li>
				</ul>
			</div>
			<jsp:include page="_menufilter.jsp"></jsp:include>

			<div class="col-md-9">

				<div class="box info-bar">
					<div class="row"></div>
				</div>
				<div>
					<form action="InvoiceServlet" method="post">
						<table>
							<tr>
								<td>IdInvoice:</td>
								<td><input type="text" name="idInvoice"
									value="<%=i.getIdInvoice()%>" readonly="readonly"></td>
							</tr>
							<tr>
								<td>IdAccount:</td>
								<td><input type="text" name="idAccount"
									value="<%=i.getIdAccount()%>" readonly="readonly"></td>
							</tr>
							<tr>
								<td>Name:</td>
								<td><input type="text" name="Name"
									value="<%=i.getName()%>"></td>
							</tr>
							<tr>
								<td>Phone:</td>
								<td><input type="text" name="Phone"
									value="<%=i.getPhoneNumber()%>"></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td><input type="text" name="Address"
									value="<%=i.getAddressNumber()%>"></td>
							</tr>
							<tr>
								<td>Date:</td>
								<td><input type="text" name="Date"
									value="<%=i.getDate()%>"></td>
							</tr>
							<tr>
								<td>Total:</td>
								<td><input type="text" name="Total"
									value="<%=i.getTotal()%>"></td>
							</tr>
							<tr>
								<td>Status:</td>
								<td><select  name="Select"  >
										<%-- <option value="<%=i.getStatus() %>" <%=i.getStatus() == 1 ? out.print("\'selected=\"selected\"'") : out.print("''") %>>Đặt hàng</option>
										<option value="<%=i.getStatus() %>" <%=i.getStatus() == 2 ? out.print("\'selected=\"selected\"'") : out.print("''") %>>Đang giao dịch</option>
										<option value="<%=i.getStatus() %>" <%=i.getStatus() == 3 ? out.print("\'selected=\"selected\"'") : out.print("''") %>>Kết thúc</option>
										<option value="<%=i.getStatus() %>" <%=i.getStatus() == 4 ? out.print("\'selected=\"selected\"'") : out.print("''") %>>Hoàn thành</option>
										<option value="<%=i.getStatus() %>" <%=i.getStatus() == 5 ? out.print("\'selected=\"selected\"'") : out.print("''") %>>Đã hủy</option> --%>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="submit" value="Update" name="action"></td>
								
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- /.col-md-9 -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->

	<jsp:include page="_footer.jsp"></jsp:include>

	<jsp:include page="_js.jsp"></jsp:include>
</body>
</html>