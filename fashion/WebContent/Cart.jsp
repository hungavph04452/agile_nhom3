<%@page import="poly.java4.dao.ProductDaoImpl"%>
<%@page import="java.util.Map"%>
<%@page import="poly.java4.entities.product"%>
<%@page import="java.util.TreeMap"%>
<%@page import="poly.java4.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cart</title>
<jsp:include page="_meta.jsp"></jsp:include>
<jsp:include page="_link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="_topbar.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<%
		int sum=0;
		ProductDaoImpl pdl = new ProductDaoImpl();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<product, Integer> list = cart.getListProduct();
	%>

	<div id="content">
		<div class="container">

			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>Shopping cart</li>
				</ul>
			</div>

			<div class="col-md-9" id="basket">
				<div class="box">
					<form method="post" action="CartServlet">
						<h1>Shopping cart</h1>
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
										<td><input type="number" name="quantity" value="<%=entry.getValue() %>" class="form-control" readonly="readonly"></td>
										<td><%=entry.getKey().getNameProduct()%></td>
										<td><%=sum = entry.getValue() * entry.getKey().getPrice() %></td>
										<td></td>
										<td><a href="CartServlet?command=removeItem&idProduct=<%=entry.getKey().getIdProduct()%>&cartId=<%=System.currentTimeMillis() %>" onclick="return confirm('bạn có muốn xóa sản phẩm không???')"><i class="fa fa-trash-o"></i></a></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>

						</div>
						<!-- /.table-responsive -->

						<div class="box-footer">
							<div class="pull-left">
								<a href="Product.jsp" class="btn btn-default"><i
									class="fa fa-chevron-left"></i> Continue shopping</a>
							</div>
							<div class="pull-right">
								<a class="btn btn-default" href="Cart.jsp">
									<i class="fa fa-refresh"></i>Update basket
								</a>
								<a href="Checkout.jsp" class="btn btn-primary">
									Proceed to checkout <i class="fa fa-chevron-right"></i>
								</a>
							</div>
						</div>

					</form>

				</div>
				<!-- /.box -->



				<jsp:include page="_cart.jsp"></jsp:include>


			</div>
			<!-- /.col-md-9 -->
			<%-- </c:if> --%>

			<div class="col-md-3">
				<div class="box" id="order-summary">
					<div class="box-header">
						<h3>Order summary</h3>
					</div>
					<p class="text-muted">Shipping and additional costs are
						calculated based on the values you have entered.</p>

					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>Order subtotal</td>
									<th>$446.00</th>
								</tr>
								<tr>
									<td>Shipping and handling</td>
									<th>$10.00</th>
								</tr>
								<tr>
									<td>Tax</td>
									<th>$0.00</th>
								</tr>
								<tr class="total">
									<td>Total</td>
									<th>$456.00</th>
								</tr>
							</tbody>
						</table>
					</div>

				</div>


				<div class="box">
					<div class="box-header">
						<h4>Coupon code</h4>
					</div>
					<p class="text-muted">If you have a coupon code, please enter
						it in the box below.</p>
					<form>
						<div class="input-group">

							<input type="text" class="form-control"> <span
								class="input-group-btn">

								<button class="btn btn-primary" type="button">
									<i class="fa fa-gift"></i>
								</button>

							</span>
						</div>
						<!-- /input-group -->
					</form>
				</div>

			</div>
			<!-- /.col-md-3 -->
		</div>
		<!-- /.container -->
	</div>
	<%-- 	<c:forEach var="lst" items="<%=lst %>">
	<c:out value="${lst.getIdpro() }"></c:out>
	<c:out value="${lst.getNameproduct() }"></c:out>
	</c:forEach> --%>

	<jsp:include page="_js.jsp"></jsp:include>
</body>
</html>