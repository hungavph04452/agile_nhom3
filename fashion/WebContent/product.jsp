<%@page import="java.util.List"%>
<%@page import="poly.java4.entities.Cart"%>
<%@page import="poly.java4.dao.ProductDao"%>
<%@page import="poly.java4.entities.product"%>
<%@page import="poly.java4.dao.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Product</title>
<jsp:include page="_meta.jsp"></jsp:include>
<jsp:include page="_link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="_topbar.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>
	<%
		ProductDaoImpl pd = new ProductDaoImpl();
		List<product> ds = pd.getListProduct();
		String page1 = "", page2 = "";
		int start = 0;
		int end;
		if (ds.size() < 18) {
			end = 9;
		}else{
			end=ds.size();
		}

		if (request.getParameter("start") != null) {
			page1 = request.getParameter("start");
			start = Integer.parseInt(page1);
		}
		if (request.getParameter("end") != null) {
			page2 = request.getParameter("end");
			end = Integer.parseInt(page2);
		}
		List<product> list = pd.getListProductByPagination(ds, start, end);
	%>

	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	<div id="content">
		<div class="container">

			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>Product</li>
				</ul>
			</div>
			<jsp:include page="_menufilter.jsp"></jsp:include>

			<div class="col-md-9">

				<div class="row products">
					<%
						for (product p : list) {
					%>
					<form action="CartServlet">
						<div class="col-md-4 col-sm-6">
							<div class="product">
								<div class="flip-container">
									<div class="flipper">
										<div class="front">
											<a href="Detail.jsp?idProduct=<%=p.getIdProduct()%>"> <img
												src="<%=p.getProductInmage()%>"
												alt="<%=p.getNameProduct()%>" class="img-responsive">
											</a>
										</div>
										<div class="back">
											<a href="Detail.jsp?idProduct=<%=p.getIdProduct()%>"> <img
												src="<%=p.getProductInmage()%>"
												alt="<%=p.getNameProduct()%>" class="img-responsive">
											</a>
										</div>
									</div>
								</div>
								<a href="Detail.jsp?idProduct=<%=p.getIdProduct()%>"
									class="invisible"> <img src="<%=p.getProductInmage()%>"
									alt="" class="img-responsive">
								</a>
								<div class="text">
									<h3>
										<a href="Detail.jsp?idProduct=<%=p.getIdProduct()%>"><%=p.getDescribe()%></a>
									</h3>
									<p class="price"><%=p.getPrice()%>
										VND
									</p>
									<p class="buttons">
										<a href="Detail.jsp?idProduct=<%=p.getIdProduct()%>"
											class="btn btn-default">View detail</a> <a
											href="CartServlet?command=insertItem&idProduct=<%=p.getIdProduct()%>&cartId=<%=System.currentTimeMillis()%>"
											class="btn btn-primary"
											onclick="return confirm('bạn có muốn thêm sản phẩm không???')"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</p>
								</div>
								<!-- /.text -->
							</div>
							<!-- /.product -->
						</div>
					</form>
					<%
						}
					%>
				</div>

			</div>
			<div class="pages">
				<ul class="pagination">
					<%
						int a, b;
						int limit = ds.size() / 9;
						if (limit * 9 < ds.size()) {
							limit += 1;
						}
						for (int i = 1; i <= limit; i++) {
							a = (i - 1) * 9;
							b = i * 9;
							if (b > ds.size()) {
								b = ds.size();
							}
					%>
					<li class="active"><a
						href="Product.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
					<%
						}
					%>
				</ul>
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