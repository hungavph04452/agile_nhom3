<%@page import="java.util.Map"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="poly.java4.entities.product"%>
<%@page import="java.util.TreeMap"%>
<%@page import="poly.java4.entities.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="_meta.jsp"></jsp:include>
<jsp:include page="_link.jsp"></jsp:include>
<jsp:include page="_topbar.jsp"></jsp:include>
<jsp:include page="_menu.jsp"></jsp:include>

<div id="content">
	<div class="container">

		<div class="col-md-12">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li>Checkout - Address</li>
			</ul>
		</div>
		<%
			float sum = 0;
			if (session.getAttribute("username") == null) {
				response.sendRedirect("/demo/login.jsp");
			} else {
				Cart cart = (Cart) session.getAttribute("cart");
				if (cart == null) {
					cart = new Cart();
					session.setAttribute("cart", cart);
				}
				TreeMap<product, Integer> list = cart.getListProduct();
				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumIntegerDigits(0);
		%>
		<div class="col-md-9" id="basket">
			<div class="box">
				<form method="post" action="CartServlet">
					<h1>Cart information</h1>
					<p class="text-muted">You currently have item(s) in your cart.</p>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Image</th>
									<th>Product</th>
									<th>Quantity</th>
									<th>Name Product</th>
									<th colspan="2">Price</th>
								</tr>
							</thead>
							<%
								for (Map.Entry<product, Integer> entry : list.entrySet()) {
							%>
							<tbody>
								<tr>
									<td><a href="#"> <img
											src="<%=entry.getKey().getProductInmage()%>"
											alt="<%=entry.getKey().getNameProduct()%>">
									</a></td>
									<td><a href="#"><%=entry.getKey().getNameProduct()%></a></td>
									<td><input type="number" name="quantity"
										value="<%=entry.getValue()%>" class="form-control"
										readonly="readonly"></td>
									<td><%=entry.getKey().getNameProduct()%></td>
									<td><%=sum = entry.getValue() * entry.getKey().getPrice()%></td>
									<td></td>
								</tr>
							</tbody>
							<%
								}
							%>
							<%-- <tfoot>
								<tr>
									<th colspan="5">Total</th>
									<th colspan="2"><%=sum%> VND</th>
								</tr>
							</tfoot> --%>
						</table>

					</div>
					<!-- /.table-responsive -->

				</form>

			</div>
			<!-- /.box -->
		</div>
		<div class="col-md-9" id="checkout">

			<div class="box">
				<form method="post" action="CheckoutServlet">
					<h1>Checkout</h1>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="firstname">Address</label> <input type="text"
									class="form-control" name="address">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="lastname">Phone</label> <input type="text"
									class="form-control" name="phone">
							</div>
						</div>
					</div>
					<!-- /.row -->
					<div class="box-footer">
						<div class="pull-left">
							<a href="Cart.jsp" class="btn btn-default"><i
								class="fa fa-chevron-left"></i>Back to basket</a>
						</div>
						<div class="pull-right">
							<input type="hidden" readonly="readonly"
								value="<%=session.getAttribute("username")%>" name="username">
							<button type="submit" class="btn btn-primary">
								Continue to Delivery Method<i class="fa fa-chevron-right"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.box -->


		</div>
		<!-- /.col-md-9 -->

	</div>
	<!-- /.container -->
</div>
<!-- /#content -->

<%
	}
%>
<jsp:include page="_footer.jsp"></jsp:include>

<jsp:include page="_js.jsp"></jsp:include>