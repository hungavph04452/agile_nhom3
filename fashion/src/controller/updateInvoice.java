package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import entity.*;

/**
 * Servlet implementation class updateInvoice
 */
@WebServlet("/updateInvoice")
public class updateInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateInvoice() {
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
		reprocessRequest(request, response);
	}
	
	protected void reprocessRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			
			String action = request.getParameter("action");
			int idInvoice= Integer.parseInt(request.getParameter("idInvoice"));
			String name = request.getParameter("name");
			String phoneNumber=request.getParameter("phoneNumber");
			String addressNumber=request.getParameter("addressNumber");
			Date time = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("date"));				
			int status = Integer.parseInt(request.getParameter("status"));
			int total = Integer.parseInt(request.getParameter("total"));
			int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		
			
			invoice in = new invoice();
			in.setIdInvoice(idInvoice);
			in.setName(name);
			in.setPhoneNumber(phoneNumber);
			in.setAddressNumber(addressNumber);
			in.setDate(time);
			in.setStatus(status);
			in.setTotal(total);
			in.setIdAccount(idAccount);
			
		
			boolean i=invoiceDao.updateInvoice(in);
			if (i) {
				response.sendRedirect("invoice.jsp");
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể lưu được !!!! </p>");
				request.getRequestDispatcher("invoice.jsp").include(request, response);	
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}
