package com.customer.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.CartDAOImp;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		CustomerDAO insertCus = new CustomerDAOImp();
		Customer customer = new Customer();		
		PrintWriter out = response.getWriter();
	
		String getName = request.getParameter("firstName") + " " + request.getParameter("lastName");
		String getMail = request.getParameter("email");
		String getPassword = request.getParameter("password");
		String getPhoneNumber = request.getParameter("phoneNumber");
		String alertSuccessRegister="<script type=\"text/javascript\">\r\n" + 
				"		alert('Đăng ký thành công!!!');\r\n" + 
				"window.location = ' login.jsp'"
		+ "</script>";	
		try {
			if (new CustomerDAOImp().CheckEmailAlready(getMail)!=null) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Email đã tồn tại!!!');");
				out.println("window.history.back();");
				out.println("</script>");
			} else {
			customer.setEmail(getMail);
			customer.setFullName(getName);
			customer.setPassword(getPassword);
			customer.setPhoneNumber(getPhoneNumber);
			customer.setStatus(1);
			insertCus.insertCustomer(customer);
			request.setAttribute("Alert",alertSuccessRegister);
			new CartDAOImp().CreatCart(getMail);
		//	RequestDispatcher rq = request.getRequestDispatcher("register.jsp");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Đăng ký thành công!!!');");
			out.println("location='login.jsp';");
			out.println("</script>");
		
			}
		}catch(Exception e){
			System.out.println(e);
			System.out.println("loi doPost");
		}
			
		
	}

}
