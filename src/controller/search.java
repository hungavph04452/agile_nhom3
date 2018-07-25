package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.accountDao;
import entity.account;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");*/
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		String action =request.getParameter("action");
		try {
			String 	username= request.getParameter("txtsearch");
			String 	fullname= request.getParameter("txtsearch");
			if (username.isEmpty()||fullname.isEmpty()) {
				out.println("<font color=red>Mời bạn nhập tên cần tìm</font>");
				request.getRequestDispatcher("manager.jsp").include(request, response);
				return;
			}
			List<account> list= accountDao.getListAccount2(username, fullname);
			request.setAttribute("listsearch", list);
			request.getRequestDispatcher("manager2.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
