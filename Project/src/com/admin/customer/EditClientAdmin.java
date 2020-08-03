package com.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.register.Customer;
import com.customer.register.CustomerDAO;
import com.customer.register.CustomerDAOImp;
import com.customer.register.MyConnectionProvider;

/**
 * Servlet implementation class EditClientAdmin
 */
@WebServlet("/EditClientAdmin")
public class EditClientAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Customer customer = new Customer();
		PrintWriter out = response.getWriter();
		customer.setEmail(request.getParameter("email"));		
		customer.setFullName(request.getParameter("firstName") + " " + request.getParameter("lastName"));
		try {
			customer.setPassword(request.getParameter("password"));
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		customer.setPhoneNumber(request.getParameter("phoneNumber"));
		
		try {
			new CustomerDAOImp().UpdateCustomer(customer);
			out.print("<script type=\"text/javascript\">\r\n" + 
					"		alert('Cập nhật thành công!!!');\r\n"  		
					+ "window.location = 'client.jsp';"
			+ "</script>") ;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
