package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import entity.*;

/**
 * Servlet implementation class searchProduct
 */
@WebServlet("/searchProduct")
public class searchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
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
		/*response.setContentType("text/html; charset=UTF-8");*/
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		try {
				
				String nameProduct= request.getParameter("txtsearchP");
				if (nameProduct.isEmpty()) {
					out.println("<font color=red>Mời bạn nhập tên cần tìm</font>");
					request.getRequestDispatcher("product.jsp").include(request, response);
					return;
				}
				List<product> list = productDao.getListProduct(nameProduct);
				request.setAttribute("listsearchP", list);
				request.getRequestDispatcher("product2.jsp").forward(request, response);;
	
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		
	}
}
