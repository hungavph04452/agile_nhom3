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

<div id="content" style="text-align:center; padding-left: 330px; ">
            <div class="container" >
  
                <div class="col-md-6">          
			
                    <div class="box">
                    
                        <h1>Cập nhật trạng thái</h1>

                        <hr>

                        <form action="updateInvoice" method="post">
                        	<%

            				int idInvoice= Integer.parseInt(request.getParameter("idInvoice"));
                        	List<invoice> listIn = invoiceDao.getListInvoice(idInvoice);
								for(invoice in:listIn){
									 if (in.getIdInvoice()>0){	 
				
							%>
							   <div class="form-group">
                                <label for="idInvoice">Mã hóa đơn</label>
                                <input type="text" class="form-control" name="idInvoice" value="<%=in.getIdInvoice()%>" readonly="readonly">
                            	</div>
                     		 <div class="form-group">
                                <label for="name">Tên khách hàng</label>
                                <input type="text" class="form-control" name="name" value="<%=in.getName()%>" readonly="readonly">
                            	</div>
                            	<div class="form-group">
                                <label for="phoneNumber">Số điện thoại</label>
                                <input type="text" class="form-control" name="phoneNumber" value="<%=in.getPhoneNumber()%>"readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="addressNumber">Địa chỉ</label>
                                <input type="text" class="form-control" name="addressNumber" value="<%=in.getAddressNumber()%>"readonly="readonly">
                            </div>
                              <div class="form-group">
                                <label for="date">Ngày</label>
                                <input type="text" class="form-control" name="date" value="<%=in.getDate()%>"readonly="readonly">
                            </div>	 
                            
                               <div class="form-group">
                               <br>  <label for="status">Trạng thái :</label></br>
                                <select name="status">	
											<option  style="color: blue;" value="0">Chờ xác nhận</option>
											<option style="color: red;" value="1">Chưa xác nhận</option>
											<option style="color: fuchsia;" value="2">Đã xác nhận</option>
											<option  style="color: orange;" value="3">Hủy</option>
											 		
                                </select>  
                            </div>	 
                             <div class="form-group">
                                <label for="total">Tổng tiền</label>
                                <input type="text" class="form-control" name="total" value="<%=in.getTotal()%>" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="idAccount">Mã tài khoản</label>
                                <input type="text" class="form-control" name="idAccount" value="<%=in.getIdAccount()%>" readonly="readonly">
                            </div>		
                         				 
                            <div class="text-center">
                                <button type="submit" name="action" class="btn btn-primary" onclick="return confirm('bạn chắc chắn lưu chưa???')"><i class="fa fa-user-md" ></i> Lưu</button>
                                 <a style="font-size: xlarge;"  href="invoice.jsp"  class="btn btn-primary">Hủy</a>
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