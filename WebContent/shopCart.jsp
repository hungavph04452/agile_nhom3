<%@page import="java.util.ArrayList"%>
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
<jsp:include page="headerCustomer.jsp"></jsp:include>
<% List<item> listpro=(ArrayList<item>) session.getAttribute("cart");
	double  summoney=0;
%>

<%if(session.getAttribute("login_finish")!=null){%>
	<script type="text/javascript">
		alert('Thanh toán thành công')
	</script>
<%} %>
<%if(session.getAttribute("login_finish")!=null){
	listpro.clear();
	session.invalidate();
}%>
<div id="content">
        <div class="container">

            <div class="col-md-12">

            </div>

            <div class="col-md-9" id="basket">

                <div class="box">

                    <form method="post" action="Checkout">

                        <h1>Giỏ hàng</h1>
                        <p class="text-muted"></p>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th colspan="2">Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th colspan="2">Giá</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for(item p:listpro){
                                	
                %>
                                <tr>
                                    <td>
                                        <a href="#">
                                            <img src="img/<%=p.getPro().getProductInmage() %>" alt="White Blouse Armani">
                                        </a>
                                    </td>
                                    <td><a href="#"><%=p.getPro().getNameProduct()%></a>
                                    </td>
                                    <td>
                                        <input type="number" value="<%=p.getQuantity() %>" class="form-control" readonly="readonly">
                                    </td>
                                    <td><%=p.getPro().getPrice()*p.getQuantity()%></td>
                                    <a type="hidden" style="display:none;"><%=summoney+=p.getPro().getPrice() %></a>
                                   
                                    <td><a href="deleteCart?idProduct=<%=p.getPro().getIdProduct()%>" onclick="return confirm('bạn có muốn xóa sản phẩm không???')"><i class="fa fa-trash-o"></i></a>
                                    
                                    </td>
                                </tr>
                               <% }%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="5">Tổng</th>
                                    <th colspan="2"> <%=summoney %></th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="box-footer">
                            <div class="pull-left">
                                <a href="index.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i> Quay lại cửa hàng</a>
                            </div>
                            <div class="pull-right">

                                <button type="submit" class="btn btn-primary">Tiến hành thanh toán
                                    <i
                                        class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>

                    </form>

                </div>
                <!-- /.box -->


            </div>
            <!-- /.col-md-9 -->

            <div class="col-md-3">


            </div>
            <!-- /.col-md-3 -->

        </div>
        <!-- /.container -->
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>