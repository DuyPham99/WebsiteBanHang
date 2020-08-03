package com.customer.signin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.Cart;
import com.cart.CartDAOImp;
import com.cart.Item;
import com.customer.register.Customer;
import com.customer.register.CustomerDAO;
import com.customer.register.CustomerDAOImp;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		CustomerDAO checkCustomer = new CustomerDAOImp();
		Customer customer = new Customer();
		PrintWriter out = response.getWriter();
		String email = request.getParameter("mail");
		String psw =  request.getParameter("password");
		Cart cart = new Cart();
	
		try {
			if (checkCustomer.getCustomer(email, psw)==null) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sai mật khẩu!!');");
				out.println("window.history.back();");
				out.println("</script>");
			} else {
				if (email.equals("websitebarber@gmail.com")) {
					response.sendRedirect("/CNPM/Admin/production/indexAdmin.jsp");
				} else {
				customer = checkCustomer.getCustomer(email, psw);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Đăng nhập thành công.');");
				out.println("</script>");
				
				session.setAttribute("customer", customer);
				session.setAttribute("email", email);
				session.setAttribute("password", psw);				
				cart = new CartDAOImp().getCart(email);	
				// tim trong db có sản phẩm nào trong cart không
				if (session.getAttribute("cart")!=null) {
					for (Item i: ((Cart) session.getAttribute("cart")).getListItem().values()) {
						cart = new CartDAOImp().insertItemToCart(cart, i.getIdProduct(), cart.getEmail());
					}
				}
				session.setAttribute("cart", cart);
				response.sendRedirect("index-4.jsp");
				}
			}	
			
			
			
			
				
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
