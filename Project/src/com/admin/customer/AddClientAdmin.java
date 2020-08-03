package com.admin.customer;


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
import com.customer.register.Customer;
import com.customer.register.CustomerDAO;
import com.customer.register.CustomerDAOImp;

/**
 * Servlet implementation class Register
 */
@WebServlet("/AddClient")
public class AddClientAdmin extends HttpServlet {
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
			new CartDAOImp().CreatCart(getMail);
			insertCus.insertCustomer(customer);
			//request.setAttribute("Alert",alertSuccessRegister);
		//	RequestDispatcher rq = request.getRequestDispatcher("register.jsp");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Đăng ký thành công!!!');");
			out.println("window.location = 'addClient.jsp'; ");
			out.println("</script>");
		//	rq.forward(request, response);
			}
		}catch(Exception e){
			System.out.println(e);
			System.out.println("loi doPost");
		}
			
		
	}

}
