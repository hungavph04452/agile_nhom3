package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.accountDao;
import entity.account;



/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String fullname=request.getParameter("fullname");
			String phone = request.getParameter("phone");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
				
			account ac = new account();
			ac.setUsername(username);
			ac.setPassword(password);
			ac.setFullname(fullname);
			ac.setPhone(phone);
			ac.setEmail(email);
			ac.setAddress(address);
			
			if (accountDao.checkAccount(username) == true) {
				out.println("<font color=red>Tài khoản đã sử dụng</font>");
				request.getRequestDispatcher("login.jsp").include(request, response);
				return;
			}
			if(username.isEmpty()||password.isEmpty()||fullname.isEmpty()||phone.isEmpty()||address.isEmpty())
			{
				out.println("<font color=red>Thông tin tài khoản không để trống </font>");
				request.getRequestDispatcher("login.jsp").include(request, response);
				return;
			}
			if (username.length()<=4 || password.length()<=4) {
				out.println("<font color=red>Độ dài tài khoản và mật khẩu lớn hơn 4 kí tự</font>");
				request.getRequestDispatcher("login.jsp").include(request, response);
				return;
			}
			if (phone.length()<=10) {
				out.println("<font color=red>Số điện thoại chỉ có 11 số</font>");
				request.getRequestDispatcher("login.jsp").include(request, response);
				return;
			}
			boolean a=accountDao.insertAccount(ac);
			if (a) {
				out.print("<p>Tạo tài khoản thành công</p>");
				request.getRequestDispatcher("login.jsp").include(request, response);	
			}else {		
				out.print("<p> Lấy làm tiếc! Không thể lưu được !!!! </p>");
				request.getRequestDispatcher("login.jsp").include(request, response);	
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}

