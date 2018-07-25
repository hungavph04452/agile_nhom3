package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import entity.*;
/**
 * Servlet implementation class updateProduct
 */
@WebServlet("/updateProduct")
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		reprocessRequest(request, response);
	}
	protected void reprocessRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String action = request.getParameter("action");
			int idProduct=Integer.parseInt(request.getParameter("idProduct"));
			String nameProduct=request.getParameter("nameProduct");
			int price= Integer.parseInt(request.getParameter("price"));
			int  quantity = Integer.parseInt(request.getParameter("quantity"));
			String describe = request.getParameter("describe");
			String productInmage = request.getParameter("productInmage");
			int idProductType= Integer.parseInt(request.getParameter("idProductType"));
			
			product p = new product();
			p.setIdProduct(idProduct);
			p.setNameProduct(nameProduct);
			p.setPrice(price);
			p.setQuantity(quantity);
			p.setDescribe(describe);
			p.setProductInmage(productInmage);
			p.setIdProductType(idProductType);
			if(nameProduct.isEmpty()||describe.isEmpty())
			{
				out.println("<font color=red>Các trường không được đê trống  </font>");
				request.getRequestDispatcher("updateProduct.jsp").include(request, response);
				return;
			}	
			if (price<0 ) {
				out.println("<font color=red>mời bạn nhập lại giá không được âm</font>");
				request.getRequestDispatcher("updateProduct.jsp").include(request, response);
				return;
			}
			if (quantity<0) {
				out.println("<font color=red>mời bạn nhập số lượng không được âm</font>");
				request.getRequestDispatcher("updateProduct.jsp").include(request, response);
				return;
			}
			boolean pr=productDao.updateProduct(p);
			if (pr) {
				response.sendRedirect("product.jsp");
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể lưu được !!!! </p>");
				request.getRequestDispatcher("product.jsp").include(request, response);	
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}
