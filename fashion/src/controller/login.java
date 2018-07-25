package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.accountDao;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int DANGNHAP_LOI = -1;
	static final int DANGNHAP_AD = 1;
	static final int DANGNHAP_KH = 0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.sendRedirect("login.jsp");
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
	//	response.setContentType("text/html;charsert=UTF-8");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		///// check khong de trong tai khoan vs mat khau
		if (username.isEmpty() || password.isEmpty()) {
			out.println("<font color=\"red\"> Tài khoản mật khẩu không được để trống</font>");
			request.getRequestDispatcher("login.jsp").include(request, response);
			return;
		}

		accountDao login = new accountDao();
		 int roles = login.checklog( username,  password);
		 	HttpSession session= request.getSession();
			session.setAttribute("username",username );
			
		switch (roles) {
		
		case DANGNHAP_LOI:
			out.println("<font color=\"red\"> Tài khoản hoặc mật khẩu sai rồi !!!</font>");
			request.getRequestDispatcher("login.jsp").include(request, response);
			break;
		case DANGNHAP_AD:
			RequestDispatcher rd2 = request.getRequestDispatcher("product.jsp");
			rd2.forward(request, response);
			break;
		case DANGNHAP_KH:
			RequestDispatcher rd3 = request.getRequestDispatcher("index.jsp");
			rd3.forward(request, response);
			break;
		}

	}
}
