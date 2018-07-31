<%@page import="poly.java4.entities.product"%>
<%@page import="poly.java4.dao.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="_meta.jsp"></jsp:include>
	<jsp:include page="_link.jsp"></jsp:include>
<title>Detail</title>
</head>
<body>
	<jsp:include page="_topbar.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<div id="content">
		<div class="container">

			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>Ladies</li>
				</ul>
			</div>
			<jsp:include page="_menufilter.jsp"></jsp:include>

        <%
            ProductDaoImpl pdl = new ProductDaoImpl();
            int idP = Integer.parseInt(request.getParameter("idProduct"));   
        	product p = pdl.getProduct(idP);
        %>

			<div class="col-md-9">
				<div class="row" id="productMain">
					<div class="col-sm-6">
						<div id="mainImage">
							<img src="<%=p.getProductInmage() %>" alt="" class="img-responsive">
						</div>

						<div class="ribbon sale">
							<div class="theribbon">SALE</div>
							<div class="ribbon-background"></div>
						</div>
						<!-- /.ribbon -->

						<div class="ribbon new">
							<div class="theribbon">NEW</div>
							<div class="ribbon-background"></div>
						</div>
						<!-- /.ribbon -->

					</div>
					<div class="col-sm-6">
						<div class="box">
							<h1 class="text-center"><%=p.getNameProduct() %></h1>
							<p class="goToDescription">
								<a href="#details" class="scroll-to">Scroll to product
									details, material & care and sizing</a>
							</p>
							<p class="price"><%=p.getPrice() %> VND</p>

							<p class="text-center buttons">
								<a href="CartServlet?command=insertItem&idProduct=<%=p.getIdProduct()%>&cartId=<%=System.currentTimeMillis() %>"  class="btn btn-primary"><i
									class="fa fa-shopping-cart"></i> Add to cart</a> <a
									href="basket.html" class="btn btn-default"><i
									class="fa fa-heart"></i> Add to wishlist</a>
							</p>


						</div>
						<%-- <div class="row" id="thumbs">
						<%
							String linkima = p.getProductInmage();
							String[] cutlink = linkima.split("_");
							for(int o = 1;o<=3;o++){
						%>
							<div class="col-xs-4">
								<a href="<%=p.getProductInmage()%>" class="thumb"> 
									<img src="<%=cutlink[0]%>_<%=o %>.jpg" alt="<%= cutlink[0] %>" class="img-responsive">
								</a>
							</div>
						<%
							}
						%>
						</div> --%>
					</div>

				</div>

				<div class="box" id="details">
					<p>
					<h4>Product details</h4>
					<p>White lace top, woven, has a round neck, short sleeves, has
						knitted lining attached</p>
					<h4>Material & care</h4>
					<ul>
						<li>Polyester</li>
						<li>Machine wash</li>
					</ul>
					<h4>Size & Fit</h4>
					<ul>
						<li>Regular fit</li>
						<li>The model (height 5'8" and chest 33") is wearing a size S</li>
					</ul>

					<blockquote>
						<p>
							<em>Define style this season with Armani's new range of
								trendy tops, crafted with intricate details. Create a chic
								statement look by teaming this lace number with skinny jeans and
								pumps.</em>
						</p>
					</blockquote>

					<hr>
					<div class="social">
						<h4>Show it to your friends</h4>
						<p>
							<a href="#" class="external facebook" data-animate-hover="pulse"><i
								class="fa fa-facebook"></i></a> <a href="#" class="external gplus"
								data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="external twitter" data-animate-hover="pulse"><i
								class="fa fa-twitter"></i></a> <a href="#" class="email"
								data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->

	<jsp:include page="_footer.jsp"></jsp:include>

	<jsp:include page="_js.jsp"></jsp:include>
</body>
</html>