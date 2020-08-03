package com.cart;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.product.Product;
import com.admin.product.ProductDAOImp;

/**
 * Servlet implementation class UpdateQuantity
 */
@WebServlet("/UpdateQuantity")
public class UpdateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuantity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String idProduct = request.getParameter("idProduct");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		HttpSession session = request.getSession(false);
		String email =  (String) session.getAttribute("email");
		Cart cart = (Cart) session.getAttribute("cart");
		
		if(quantity > cart.getListItem().get(idProduct).getQuantity()) {
			response.sendRedirect("CartServlet?idProduct=" + idProduct);
		} else
			try {
				new CartDAOImp().UpdateQuantity(cart, idProduct, quantity);
				session.setAttribute("cart", cart);
				response.sendRedirect("cart.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
