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

import dao.detailInvoiceDao;
import dao.productDao;
import entity.product;

/**
 * Servlet implementation class detailInvoice
 */
@WebServlet("/detailInvoice")
public class detailInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private detailInvoiceDao detailInvoiceDao=new detailInvoiceDao();
	private productDao productDAO=new productDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		List<entity.detailInvoice> list=detailInvoiceDao.getInvoice();
		List<product> list_pro=productDAO.getProduct();
		List<entity.detailInvoice> list_final=new ArrayList<>();
		product ps=new product();
		 int id=Integer.parseInt(request.getParameter("idInvoice"));
		for (entity.detailInvoice detailInvoice : list) {
			for (product pr : list_pro) {
				if(detailInvoice.getIdInvoice()==id &&pr.getIdProduct()==detailInvoice.getIdProduct()) {
					ps=pr;
					list_final.add(detailInvoice);
				}
			}
			
		}
		session.setAttribute("ps", ps);
		session.setAttribute("list_final", list_final);
		response.sendRedirect("detailInvoice.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
