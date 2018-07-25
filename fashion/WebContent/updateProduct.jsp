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
<jsp:include page="headerProduct.jsp"></jsp:include>
<div id="content" style="text-align:center; padding-left: 330px; ">
            <div class="container" ">


                <div class="col-md-6">
                    <div class="box">
                        <h1>Chỉnh sửa sản phẩm</h1>

                        <hr>

                        <form action="updateProduct" method="post">
                        	<%
                        	int idProduct= Integer.parseInt(request.getParameter("idProduct"));
                        	List<product> listP = productDao.getListProduct(idProduct);
								for(product p:listP){
									 if (p.getIdProduct()>0){	 
				
							%>
							  <div class="form-group">
                                <label for="idProduct">Mã sản phẩm</label>
                                <input type="text" class="form-control" name="idProduct" value="<%=p.getIdProduct()%>" readonly="readonly">
                            	</div>
                     		 <div class="form-group">
                                <label for="nameProduct">Tên sản phẩm</label>
                                <input type="text" class="form-control" name="nameProduct" value="<%=p.getNameProduct()%>" >
                            	</div>
                            	<div class="form-group">
                                <label for="price">Giá</label>
                                <input type="number" class="form-control" name="price" value="<%=p.getPrice()%>">
                            </div>
                            <div class="form-group">
                                <label for="quantity">Số lượng</label>
                                <input type="number" class="form-control" name="quantity" value="<%=p.getQuantity()%>">
                            </div>
							  <div class="form-group">
                                <label for="describe">Mô tả</label>
                                <input type="text" class="form-control" name="describe" value="<%=p.getDescribe()%>">
                            </div>
                              <div class="form-group">
                                <label for="productInmage">Hình ảnh</label>
                                <input type="file" class="form-control" name="productInmage" value="<%=p.getProductInmage()%>">
                            </div>	
                            <div class="form-group">
                                 <label for="idProductType">Loại sản phẩm :</label>
                                <select name="idProductType">
						       <% 
						         productTypeDao ptDao = new productTypeDao();
									List<productType> listpt = ptDao.getProductType();
										for(productType pt : listpt){
									%> 
											<option  ><%=pt.getIdProductType() %></option>
											 <%
										}
											%>	 		
                                </select>  
                                  <%--  <label for="idProductType">Loại sản phẩm </label>
                                <input type="text" class="form-control" name="idProductType" value="<%=p.getIdProductType()%>"> 
                                 --%>
                            </div>					 
                            <div class="text-center">
                                <button type="submit" name="action" class="btn btn-primary"onclick="return confirm('bạn chắc chắn lưu chưa???')"><i class="fa fa-user-md" ></i> Lưu</button>
                                 <a style="font-size: xlarge;"  href="product.jsp"  class="btn btn-primary">Hủy</a>
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