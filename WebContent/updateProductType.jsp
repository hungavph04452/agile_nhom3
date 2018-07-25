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
	<jsp:include page="headerProductType.jsp"></jsp:include>
<div id="content" style="text-align:center; padding-left: 330px; ">
            <div class="container" ">


                <div class="col-md-6">
                    <div class="box">
                        <h1>Chỉnh sửa loại sản phẩm</h1>

                        <hr>

                        <form action="updateProductType" method="post">
                        	<%
                        	int idProductType= Integer.parseInt(request.getParameter("idProductType"));
                        	List<productType> listPt = productTypeDao.getListProductType(idProductType);
								for(productType pt:listPt){
									 if (pt.getIdProductType()>0){	 
							%>
							 <div class="form-group">
                                <label for="idProductType">Mã loại sản phẩm</label>
                                <input type="text" class="form-control" name="idProductType" value="<%=pt.getIdProductType()%>" readonly="readonly">
                            	</div>
                     		 <div class="form-group">
                                <label for="nameProductType">Tên loại sản phẩm</label>
                                <input type="text" class="form-control" name="nameproductType" value="<%=pt.getNameProductType()%>" >
                            	</div>			 
                            <div class="text-center">
                                <button type="submit" name="action" class="btn btn-primary" onclick="return confirm('bạn chắc chắn lưu chưa???')"><i class="fa fa-user-md" ></i> Lưu</button>
                                 <a style="font-size: xlarge;"  href="productType.jsp"  class="btn btn-primary">Hủy</a> 
                            </div>
                             				
						<%}%>
							<%} %>
                        </form>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>