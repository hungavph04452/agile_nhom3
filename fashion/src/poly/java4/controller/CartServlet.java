package poly.java4.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import poly.java4.dao.ProductDaoImpl;
import poly.java4.entities.Cart;
import poly.java4.entities.product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDaoImpl pdl = new ProductDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String idProduct = request.getParameter("idProduct");
		String command = request.getParameter("command");
		
		ArrayList<Long> listBuy = null;
		String url = "/Cart.jsp";

		try {
			listBuy = (ArrayList<Long>) request.getAttribute("cartId");
			long idBuy = 0;
			if (request.getParameter("cartId") != null) {
				idBuy = Long.parseLong(request.getParameter("cartId"));
			}
			product p = pdl.getProduct(Integer.parseInt(idProduct));
			switch (command) {
			case "insertItem":
				if (listBuy == null) {
					listBuy = new ArrayList<Long>();
					session.setAttribute("cartId", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart(p, 1);
					listBuy.add(idBuy);
				}
				url = "/Cart.jsp";
				break;
			case "removeItem":
				cart.removeCart(p);
				url = "/Cart.jsp";
				break;
			case "checkOut":
				url = "/Checkout.jsp";
				break;
			default:
				url = "/Cart.jsp";
				break;
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
