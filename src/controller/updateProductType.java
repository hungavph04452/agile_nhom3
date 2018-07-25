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
 * Servlet implementation class updateProductType
 */
@WebServlet("/updateProductType")
public class updateProductType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProductType() {
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
			int idProductType= Integer.parseInt(request.getParameter("idProductType"));
			String nameProductType=request.getParameter("nameproductType");
			
			productType pt = new productType();
			pt.setIdProductType(idProductType);
			pt.setNameProductType(nameProductType);
			
			if(nameProductType.isEmpty())
			{
				out.println("<font color=red>Thông tin loại sản phẩm không đê trống </font>");
				request.getRequestDispatcher("updateProductType.jsp").include(request, response);
				return;
			}
			boolean p=productTypeDao.updateProductType(pt);
			if (p) {
				response.sendRedirect("productType.jsp");
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể lưu được !!!! </p>");
				request.getRequestDispatcher("productType.jsp").include(request, response);	
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}
