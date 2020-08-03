package com.transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.Cart;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOut() {
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
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		Transaction trans = new Transaction();
		String provine = request.getParameter("provine");
		String fullName = request.getParameter("firstName") + " "  + request.getParameter("lastName");
		String address = request.getParameter("address") +" " + provine;
		String phoneNumber = request.getParameter("phoneNumber");
		String note = request.getParameter("note");
		Date date = new Date(); 
		
		trans.setProvine(provine);
		trans.setFullName(fullName);
		trans.setAddress(address);
		trans.setPhoneNumber(phoneNumber);
		trans.setNote(note);
		trans.date = date;
		
		if(session.getAttribute("cart")!=null){
			Cart cart = (Cart) session.getAttribute("cart");
			trans.setTotal(cart.getTotal());
			trans.setList(cart.getListItem());
			trans.setQuantity(cart.getQuantity());
			try {
				trans.setDiscount(new TransactionDAOImp().getDiscount(trans.getList()));
				new TransactionDAOImp().insertTransaction(trans);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("cart", null);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Bạn đã mua thành công!!');");
			out.println("window.location.href = 'index-4.jsp';");
			out.println("</script>");
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
