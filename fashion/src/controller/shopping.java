package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.productDao;
import entity.item;
import entity.product;

/**
 * Servlet implementation class shopping
 */
@WebServlet("/shopping")
public class shopping extends HttpServlet {
	private static final long serialVersionUID = 1L;
	productDao productDao = new productDao();
	List<product> listfinal = new ArrayList<>();
	List<item> list_it = new ArrayList<>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public shopping() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<product> list_product = productDao.getListProduct(Integer.parseInt(request.getParameter("productid")));
		int quantity = 1;
		for (product p : list_product) {
			list_it.add(new item(p, quantity));	
//			if (list_it.size()==0) {
//				list_it.add(new item(p, quantity));		
//			}			
//			else {
//				for (item item : list_it) {
//					if(item.getPro().getIdProduct()==Integer.parseInt(request.getParameter("productid"))){						
//						item.setQuantity(quantity++);
//					}else {
//						list_it.add(new item(p, quantity));	
//					}
//					
//				}
//				
//			}
		}
		

		HttpSession session = request.getSession();
		session.setAttribute("cart", list_it);
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
