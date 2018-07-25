<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="headerCustomer.jsp"></jsp:include>

	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<%
						productDao pDao = new productDao();
						List<product> list = pDao.getProduct();
						String page1 = "", page2 = "";
						int start = 0;
						int end = 8;
						if (list.size() < 8) {
							end = list.size();
						}
						if (request.getParameter("start") != null) {
							page1 = request.getParameter("start");
							start = Integer.parseInt(page1);
						}
						if (request.getParameter("end") != null) {
							page2 = request.getParameter("end");
							end = Integer.parseInt(page2);
						}
						List<product> listPage = productDao.getListProductPage(list, start, end);
					%>

					<div class="row products">
						<%
							for (product p : listPage) {
						%>
						<div class="col-md-3 col-sm-4">
							<div class="product">
								<div class="flip-container">
									<div class="flipper">
										<div class="front">
											<img src="img/<%=p.getProductInmage()%>" alt=""
												class="img-responsive">
										</div>

									</div>
								</div>
								<a class="invisible"> <img
									src="img/<%=p.getProductInmage()%>" alt=""
									class="img-responsive">
								</a>
								<div class="text">
									<h3><%=p.getNameProduct()%></h3>
									<p class="price"><%=p.getPrice()%><a>VNĐ</a>
									</p>
									<p style="text-align: center;"><%=p.getDescribe()%></p>
									<p class="buttons">

										<a href="shopping?productid=<%=p.getIdProduct()%>"
											class="btn btn-primary"
											onClick="alert('Thêm sản phẩm thành công!')"><i
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
									</p>

								</div>
								<!-- /.text -->
							</div>
							<!-- /.product -->
						</div>
						<%
							}
						%>
					</div>
					<!-- /.products -->

					<div style="text-align: center;" class="pages">
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<%
								int a, b;
								int limit = list.size() / 8;
								if (limit * 8 < list.size()) {
									limit += 1;
								}
								for (int i = 1; i <= limit; i++) {
									a = (i - 1) * 8;
									b = i * 8;
									if (b > list.size()) {
										b = list.size();
									}
							%>
							<li class="active"><a
								href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>


				</div>
				<!-- /.col-md-9 -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>