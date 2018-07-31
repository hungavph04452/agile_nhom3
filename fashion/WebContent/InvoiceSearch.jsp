<%@page import="java.util.List"%>
<%@page import="poly.java4.entities.invoice"%>
<%@page import="poly.java4.dao.InvoiceDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

				<div class="row products">
					<form>
						<table border="2px" cellpadding="2px" cellspacing="2px">
							<tr>
								<td>IdInvoice</td>
								<td>IdAccount</td>
								<td>Name</td>
								<td>Phone</td>
								<td>Address</td>
								<td>Date</td>
								<td>Total</td>
								<td>Status</td>
								<td></td>
							</tr>
							<%
								List<invoice> listI = (List<invoice>)request.getAttribute("listSearch");
								if (listI != null) {
									for (invoice i : listI) {
							%>
							<tr>
								<td><%=i.getIdInvoice() %></td>
								<td><%=i.getIdAccount()%></td>
								<td><%=i.getName()%></td>
								<td><%=i.getPhoneNumber()%></td>
								<td><%=i.getAddressNumber()%></td>
								<td><%=i.getDate()%></td>
								<td><%=i.getTotal()%></td>
								<td><%=i.getStatus()%></td>
								<td><a
									href="InvoiceUpdate.jsp?idInvoice=<%=i.getIdInvoice()%>">Edit</a>
								</td>
							</tr>
							<%
									}
								}
							%>

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