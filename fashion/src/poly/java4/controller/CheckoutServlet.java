package poly.java4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import poly.java4.dao.DetailInvoiceDaoImpl;
import poly.java4.dao.InvoiceDaoImpl;
import poly.java4.entities.Cart;
import poly.java4.entities.detailInvoice;
import poly.java4.entities.invoice;
import poly.java4.entities.product;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InvoiceDaoImpl idl = new InvoiceDaoImpl();
	private DetailInvoiceDaoImpl didl = new DetailInvoiceDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutServlet() {
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
	@SuppressWarnings({ "unused", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String makh = (String) session.getAttribute("username");
		String url = "/Checkout.jsp";
		ArrayList<Long> listBuy = (ArrayList<Long>) session.getAttribute("cartId");
//		System.out.println(cart.getCartId());

		if (listBuy == null) {
			listBuy = new ArrayList<Long>();
			session.setAttribute("cartId", listBuy);
			url = "/Checkout.jsp";
		}

		try {
			invoice inv = null;
			detailInvoice dinv = null;
			idl.addInvoice(new invoice(0, phone, address, new Date(), makh));
			TreeMap<product, Integer> list = cart.getListProduct();
			for (Entry<product, Integer> entry : list.entrySet()) {
				didl.insertDetailInvoice(new detailInvoice(0, entry.getKey().getIdProduct(), entry.getValue()));
			}
			session.removeAttribute("cart");
			session.setAttribute("cart", new Cart());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.sendRedirect("/demo/index.jsp");
	}

}
