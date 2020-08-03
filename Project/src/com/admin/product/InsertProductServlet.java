package com.admin.product;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import com.customer.register.MyConnectionProvider;
import com.oreilly.servlet.MultipartRequest;
 
@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB

public class InsertProductServlet extends HttpServlet {
	private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 50 * 1024 *1024;
	   private int maxMemSize = 4 * 1024;
	   private File file ; 
	   Connection conn = MyConnectionProvider.getConnection();
	   public void init( ){
	      // Get the file location where it would be stored.
	      filePath = 
	             getServletContext().getInitParameter("file-upload"); 
	   }
   private static final long serialVersionUID = 1L;
 
  
 
   public InsertProductServlet() {
       super();
   }
 
  
   private static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}
   boolean CheckExistId(String idProduct) throws SQLException {
	   Connection conn = MyConnectionProvider.getConnection();
	   PreparedStatement ps = conn.prepareStatement("select * from Product where idProduct='" + idProduct + "'");
	   ResultSet rs = ps.executeQuery();
	   if (rs.next()) {
		   return false;
	   }
	   
	   return true;
   }
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   response.setContentType("text/html;charset=UTF-8");
	   request.setCharacterEncoding("UTF-8");
	   // save image and storage image to string
	   PrintWriter out =response.getWriter();
	 
	     String nameProduct= request.getParameter("name");
		  String amountProduct = request.getParameter("amount");
		  String discountProduct = request.getParameter("discount");
		  String kindProduct = request.getParameter("kind");
		  String descriptionProduct = request.getParameter("description");
		  String idProduct = request.getParameter("id").toUpperCase();
		  String priceProduct = request.getParameter("price");
		  String pathImgProduct = request.getParameter("pathFile");
		  ProductDAO insertToDB = new ProductDAOImp();
		  Product tempProduct = new Product();	 
		  // check exists
		  try {
			  
			if(!CheckExistId(idProduct)) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('ID đã tồn tại!');");
				out.println("window.history.back();");
				out.println("</script>");
				return;
			}
			  List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
			   File saveFile;
			   String pathFile="";
			    for (Part filePart : fileParts) {
			        // ... (do your job here)
			        pathFile+=getSubmittedFileName(filePart) + "?";    
			        saveFile = new File(filePath);   
			        File file = new File(saveFile, getSubmittedFileName(filePart));
			        if(file.exists()) {
			        	out.println("<script type=\"text/javascript\">");
						out.println("alert('Tên ảnh đã tồn tại! Vui lòng đổi tên ảnh.');");
						out.println("window.history.back();");
						out.println("</script>");
						return;
			        }
			        try (InputStream input = filePart.getInputStream()) {
			            Files.copy(input, file.toPath());
			        }
		   }
			   
			    
			tempProduct.setInit(idProduct, nameProduct, descriptionProduct, kindProduct
		    		  ,Integer.parseInt(priceProduct), Integer.parseInt(amountProduct), Integer.parseInt(discountProduct), pathFile);
		    insertToDB.InsertProduct(tempProduct);
		    // aleart success
		    out.println("<script type=\"text/javascript\">");
			out.println("alert('Thêm thành công!');");
			out.println("</script>");
			response.sendRedirect("addProduct.jsp");
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SAVE");
			e.printStackTrace();
		}
		  
	      
   }
  
 
}