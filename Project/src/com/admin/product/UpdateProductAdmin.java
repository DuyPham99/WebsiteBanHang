package com.admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProductAdmin
 */
@WebServlet("/UpdateProductAdmin")
public class UpdateProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 request.setCharacterEncoding("UTF-8");
		 Product product = new Product();
		 product.setIdProduct(request.getParameter("id"));
		 product.setName(request.getParameter("name"));
		 product.setDescription(request.getParameter("description"));
		 product.setKind(request.getParameter("kind"));
		 product.setPrice(Integer.parseInt(request.getParameter("price")));
		 product.setAmount(Integer.parseInt(request.getParameter("amount")));
		 product.setDiscount(Integer.parseInt(request.getParameter("discount")));
		 product.setPathImage(request.getParameter("path"));
		 ProductDAO temp = new ProductDAOImp();
		 try {
			 PrintWriter out = response.getWriter();
			temp.UpdateProduct(product, product.getIdProduct());
			out.print("<script type=\"text/javascript\">\r\n" + 
				"		alert('Thành công!!!');\r\n" + 
				"window.location = ' productAdmin.jsp'"
		+ "</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
