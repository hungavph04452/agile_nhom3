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
 * Servlet implementation class insertProductType
 */
@WebServlet("/insertProductType")
public class insertProductType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertProductType() {
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
			String nameProductType=request.getParameter("nameProductType");
		
			productType pt = new productType();
			pt.setNameProductType(nameProductType);
			
			if(nameProductType.isEmpty())
			{
				out.println("<font color=red>Thông tin loại sản phẩm không đê trống </font>");
				request.getRequestDispatcher("productType.jsp").include(request, response);
				return;
			}
			boolean a=productTypeDao.insertProductType(pt);
			if (a) {
				/*request.getRequestDispatcher("productType.jsp").forward(request, response);*/	
				response.sendRedirect("productType.jsp");
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể thêm được !!!! </p>");
				request.getRequestDispatcher("productType.jsp").forward(request, response);	
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}
