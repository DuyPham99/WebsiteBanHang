package com.cart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.register.Customer;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet") 
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String idProduct = request.getParameter("idProduct");
		HttpSession session = request.getSession(false);
		String email =  (String) session.getAttribute("email");
		if (email == null) email=""; // after else get cart from DB
		
		if (session.getAttribute("cart")==null) {
			Cart cart = new Cart();
			try {	
				session.setAttribute("cart", new CartDAOImp().insertItemToCart(cart, idProduct, email));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			Cart cart = (Cart) session.getAttribute("cart");
			try {
				session.setAttribute("cart", new CartDAOImp().insertItemToCart(cart, idProduct, email));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Cart cart = (Cart) session.getAttribute("cart")	;	
		response.sendRedirect("cart.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
