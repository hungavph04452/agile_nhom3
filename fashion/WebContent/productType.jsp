<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<jsp:include page="headerProductType.jsp"></jsp:include>

<%
		
				productTypeDao ptDao= new productTypeDao();
		List<productType> list = ptDao.getProductType();
		String page1 = "", page2 = "";
		int start = 0;
		int end=5;
		if(list.size()<5){
			end= list.size();
		}
		if (request.getParameter("start") != null) {
			page1 = request.getParameter("start");
			start = Integer.parseInt(page1);
		}
		if (request.getParameter("end") != null) {
			page2 = request.getParameter("end");
			end = Integer.parseInt(page2);
		}
		List<productType> listPage = productTypeDao.getListProductTypePage(list, start, end);
		%>
	
	<form action="insertProductType" method="post">
		<div class="add-wrap">
			<div class="add-window">
				<input type="text" name="nameProductType" placeholder="Tên loại sản phẩm......." />
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
	<h2 style="text-align: center;"> Quản lý loại sản phẩm</h2>
	<div class="tableSearch">
		<table class="responstable">
			<tr>
				<th>STT</th>
				<th>Mã loại sản phẩm</th>
				<th>Tên loại sản phẩm</th>
				<th>Chỉnh sửa</th>
				<th>Xóa</th>
			</tr>
				 <%
							int count = 0;	
							for (productType ptype : listPage) {										
							%>
			<form action="deleteProductType" method="post">
					<tr>
						<td><%=count ++%></td>
						<td><%=ptype.getIdProductType()%></td>
						<td><%=ptype.getNameProductType()%></td>
					

						<td><a href='updateProductType.jsp?idProductType=<%=ptype.getIdProductType()%>'>Chỉnh sửa</a></td>

						<td><input type="hidden" name="idProductType" value="<%=ptype.getIdProductType()%>">
							<button type="submit" name="action" value="Delete"
								onclick="return confirm('bạn có muốn xóa ???')">
								<i class="fa fa-2x fa-trash-o"></i></td> 
					</tr>
					</form>
				<%
				}
			%>		

		</table>
		<div style="text-align: center;" class="pages">
                    <ul class="pagination">
                     <li><a href="#">&laquo;</a></li> 
		<%
				int a, b;
				int limit = list.size() / 5;
				if (limit * 5 < list.size()) {
					limit += 1;
				}
				for (int i = 1; i <= limit; i++) {
					a = (i - 1) * 5;
					b = i * 5;
					if (b > list.size()) {
						b = list.size();
					}
			%>		   
                         <li class="active"><a href="productType.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a>
                        </li>    
			<%
				}
			%> 
			<li><a href="#">&raquo;</a></li>
	 				</ul>
                </div>
	</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>