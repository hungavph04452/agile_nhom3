package poly.java4.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.java4.dao.InvoiceDaoImpl;
import poly.java4.entities.invoice;

/**
 * Servlet implementation class InvoiceServlet
 */
@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		String url = "";
		
		try {
			if (action.equalsIgnoreCase("Update")) {
				int idInvoice = Integer.parseInt(request.getParameter("idInvoice"));
				int idAccount = Integer.parseInt(request.getParameter("idAccount"));
				String name = request.getParameter("Name");
				String phone = request.getParameter("Phone");
				String address = request.getParameter("Address");
				Date date = new SimpleDateFormat().parse("Date");
				int total = Integer.parseInt(request.getParameter("Total"));
				int status = Integer.parseInt(request.getParameter("Status"));

				if (name.isEmpty() && phone.isEmpty() && address.isEmpty()) {
					out.println("<font color=red>Thông tin khách hàng không để trống </font>");
					url = "InvoiceUpdate.jsp";
				} else {
					invoice i = new invoice(idInvoice, name, phone, address, date, status, total, idAccount);
					new InvoiceDaoImpl().addInvoice(i);
					url = "Invoice.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
