<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/tab.css">
</head>
<body>
<jsp:include page="headerManager.jsp"></jsp:include>
<%
		
				accountDao accDao= new accountDao();
		List<account> list = accDao.getAccount(); 
		String page1 = "", page2 = "";
		int start = 0;
		int end=5;
		if(list.size()<5){
			end=list.size();
		}
		if (request.getParameter("start") != null) {
			page1 = request.getParameter("start");
			start = Integer.parseInt(page1);
		}
		if (request.getParameter("end") != null) {
			page2 = request.getParameter("end");
			end = Integer.parseInt(page2);
		}
		List<account> listPage = accountDao.getListAccountPage(list, start, end);
		%>
		<form action="insertAccount" method="post">
		<div class="add-wrap">
			<div class="add-window">
				<input type="text" name="username" placeholder="Tài khoản ............."/>	
				<input type="password" name="password" placeholder="Mật khẩu ............."/>	
				<input type="text" name="fullname"  placeholder="Họ và tên ............."/>	
				<input type="number" name="phone" placeholder="Phone ............."/>
				<input type="text" name="email" placeholder="Email ............."/>	
				<input type="text" name="address"  placeholder="Address ............."/>
			<br>Chức năng: <select style="padding-right: 260px;"  name="roles">
					<option>0</option>
					<option>1</option>
				</select>	
			</br>	
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
	<h2 style="text-align: center;"> Quản lý tài khoản</h2>
<div class="tableSearch">
		<table class="responstable">
			<tr>
				<th>STT</th>
				<th>Mã tài khoản</th>
				<th>Tài khoản</th>
				<th>Tên</th>
				<th>SDT</th>
				<th>Email</th>
				<th>Địa chỉ</th>
				<th>Chức năng</th>
				<th>Xóa</th>
			</tr>
							  <%
							int count = 0;	
							for (account acc : listPage) {										
							%>
			<form action="deleteAcount" method="post">
					<tr>
						<td><%=count ++%></td>
						<td><%=acc.getIdAccount()%></td>
						<td><%=acc.getUsername()%></td>
						<td><%=acc.getFullname()%></td>
						<td><%=acc.getPhone()%></td>
						<td><%=acc.getEmail()%></td>
						<td><%=acc.getAddress()%></td>
						<td><%=acc.getRoles()%></td>


						<td><input type="hidden" name="idAccount" value="<%=acc.getIdAccount()%>">
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
                         <li class="active"><a href="manager.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a>
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