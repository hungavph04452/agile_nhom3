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
	<jsp:include page="headerProduct.jsp"></jsp:include>


	<form action="insertProduct" method="post">
		<div class="add-wrap">
			<div class="add-window">
				<input type="text" name="nameProduct"
					placeholder="Tên sản phẩm ............." /> <input type="number"
					name="price" placeholder="Giá ............." /> <input
					type="number" name="quantity" placeholder="Số lượng ............." />
				<input type="text" name="describe" placeholder="Mô tả ............." />
				<input type="file" name="productInmage" /> <br>Loại sản phẩm :
				<select type="text" style="padding-right: 230px;"
					name="idProductType">
					<%
						productTypeDao ptDao = new productTypeDao();
						List<productType> listpt = ptDao.getProductType();
						for (productType pt : listpt) {
					%>
					<option><%=pt.getIdProductType()%></option>
					<%
						}
					%>
				</select> </br>
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
	<h2 style="text-align: center;">Quản lý sản phẩm</h2>
	<div class="tableSearch">
		<table class="responstable">
			<tr>
				<th>STT</th>
				<th>Mã sản phẩm</th>
				<th>Tên sản phẩm</th>
				<th>Giá</th>
				<th>Số lượng</th>
				<th>Mô tả</th>
				<th>Hình ảnh</th>
				<th>Loại sản phẩm</th>
				<th>Chỉnh sửa</th>
				<th>Xóa</th>
			</tr>
			<%
				List<product> listP = (List<product>) request.getAttribute("listsearchP");
				if (!(listP == null)) {
					for (product p : listP) {
			%>
			<form action="deleteProduct" method="post">
				<tr>
					<td><%=p.getIdProduct()%></td>
					<td><%=p.getNameProduct()%></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getQuantity()%></td>
					<td><%=p.getDescribe()%></td>
					<td><img src="img/<%=p.getProductInmage()%>" width="50px"
						height="50px"></img></td>
					<td><%=p.getIdProductType()%></td>
					<td><a
						href='updateProduct.jsp?idProduct=<%=p.getIdProduct()%>'>Chỉnh
							sửa</a></td>

					<td><input type="hidden" name="idProduct"
						value="<%=p.getIdProduct()%>">
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