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
<jsp:include page="headerProductType.jsp"></jsp:include>

	
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
								List<productType > listpt= (List<productType>) request.getAttribute("searchPt");
								if (!(listpt == null)) {
							for (productType pt : listpt) {										
							%>
			<form action="deleteProductType" method="post">
					<tr>
						<td><%=count ++%></td>
						<td><%=pt.getIdProductType()%></td>
						<td><%=pt.getNameProductType()%></td>
					

						<td><a href='updateProductType.jsp?idProductType=<%=pt.getIdProductType()%>'>Chỉnh sửa</a></td>

						<td><input type="hidden" name="idProductType" value="<%=pt.getIdProductType()%>">
							<button type="submit" name="action" value="Delete"
								onclick="return confirm('bạn có muốn xóa ???')">
								<i class="fa fa-2x fa-trash-o"></i></td> 
					</tr>
					</form>
				<%
				}
								}
			%>		

		</table>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>