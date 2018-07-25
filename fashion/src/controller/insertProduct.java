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
 * Servlet implementation class insertProduct
 */
@WebServlet("/insertProduct")
public class insertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
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
			String nameProduct=request.getParameter("nameProduct");
			int price= Integer.parseInt(request.getParameter("price"));
			int  quantity = Integer.parseInt(request.getParameter("quantity"));
			String describe = request.getParameter("describe");
			String productInmage = request.getParameter("productInmage");
			int idProductType= Integer.parseInt(request.getParameter("idProductType"));		
			System.out.println(idProductType);
			product p = new product();
			p.setNameProduct(nameProduct);
			p.setPrice(price);
			p.setQuantity(quantity);
			p.setDescribe(describe);
			p.setProductInmage(productInmage);
			p.setIdProductType(idProductType);
			
			if(nameProduct.isEmpty()||describe.isEmpty())
			{
				out.println("<font color=red>Các trường không được đê trống </font>");
				request.getRequestDispatcher("product.jsp").include(request, response);
				return;
			}	
			if (price<0 ) {
				out.println("<font color=red>mời bạn nhập lại giá không được âm</font>");
				request.getRequestDispatcher("product.jsp").include(request, response);
				return;
			}
			if (quantity<0) {
				out.println("<font color=red>mời bạn nhập số lượng không được âm</font>");
				request.getRequestDispatcher("product.jsp").include(request, response);
				return;
			}
			try {
				Integer.parseInt(String.valueOf(quantity));
			} catch (Exception e) {
				
						
			}
			boolean a=productDao.insertProduct(p);
			if (a) {
				response.sendRedirect("product.jsp");
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể thêm được !!!! </p>");
				request.getRequestDispatcher("product.jsp").forward(request, response);	
			}
			
		} catch (Exception e) {
			out.println("<font color=red>Các trường không được đê trống </font>");
//			request.setAttribute("loi","khong duoc de ");
//			response.sendRedirect("product.jsp");
			request.getRequestDispatcher("product.jsp").include(request, response);
			return;
		
		}
	}
}
