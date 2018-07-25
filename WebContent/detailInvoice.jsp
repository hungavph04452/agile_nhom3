<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<jsp:include page="headerInvoice.jsp"></jsp:include>
<%
		
List<entity.detailInvoice> list_final=(List<entity.detailInvoice>) session.getAttribute("list_final");
	product pro=(product) session.getAttribute("ps");
		
		%>
		<br />
		
	<h2 style="text-align: center;"> Hóa đơn chi tiết</h2>
	
<div class="tableSearch">
		<table class="responstable">
	
			<tr>
				<th>STT</th>
				<th>Mã hóa đơn</th>
				<th>Mã sản phẩm</th>
				<th>Tên sản phẩm</th>
				<th>Hình ảnh</th>
				<th>Giá sản phẩm</th>
				<th>Số lượng</th>
			</tr>
			<%
							  int count = 0;	
							for (detailInvoice dl : list_final) {										
							%>
			<form action="#" method="post">
					<tr>
					<td><%=count ++%></td>
						<td><%=dl.getIdInvoice()%></td>
						<td><%=dl.getIdProduct()%></td>
						<td><%=pro.getNameProduct()%></td>
						<td><img alt="" src="img/<%=pro.getProductInmage()%>" width="50px" height="50px"> </td>
						<td><%=pro.getPrice()%></td>
						<td><%=dl.getQuantity() %></td>
					</tr>
					</form>
				<%
				}
			%> 
			
		</table>
		
	</div>
	<div  class="pages">
 			 <ul class="pagination">
                  <div class="pull-left">
                     <a href="invoice.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i> Quay lại đơn hàng</a>
                </div>
			</ul>
			</div>
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>