package com.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import java.io.*;
import java.util.*;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.admin.product.Product;
import com.admin.product.ProductDAOImp;
import com.customer.register.Customer;
import com.customer.register.CustomerDAOImp;
import com.customer.register.MyConnectionProvider;


/**
 * Servlet implementation class ResetPass
 */
@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public static void sendMail(String recepient, String text) throws MessagingException {
	    	Properties properties = new Properties();
	    	
	    	properties.put("mail.smtp.auth", "true");
	    	properties.put("mail.smtp.starttls.enable", "true");
	    	properties.put("mail.smtp.host", "smtp.gmail.com");
	    	properties.put("mail.smtp.port", "587");
	    	
	    	String myAccountEmail = "nhockteen2001@gmail.com";
	    	String password = "phamducduy123IT";
	    	
	    	Session session = Session.getInstance(properties, new Authenticator() {
	    		protected PasswordAuthentication getPasswordAuthentication() {
	    			return new PasswordAuthentication(myAccountEmail, password);
	    		}
			});
	    	
	    	Message message = prepareMessage(session, myAccountEmail, recepient, text);
	    	Transport.send(message);
	    	
	    }
	 private static Message prepareMessage(Session session, String myAccountEmail,String recepient, String text ) {
	    	Message message = new MimeMessage(session);
	    	try {
				message.setFrom(new InternetAddress(myAccountEmail));
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
				message.setSubject("[ShopBarber] Lấy lại mật khẩu");
				message.setText(text);
				return message;
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	    }
	 public Customer getCustomer(String mail) {
			// TODO Auto-generated method stub
		 	Connection conn =null;
		 	PreparedStatement ps = null;
			Customer newCus = null;
			try {
				conn = MyConnectionProvider.getConnection();
				ps = conn.prepareStatement("select * from Account where mail='" + mail + "'");		
				ResultSet rs = ps.executeQuery();	
				while(rs.next()) {
					newCus = new Customer();
					newCus.setEmail(rs.getString(1));
					newCus.setPassword(rs.getString(2));
					newCus.setFullName(rs.getString(3));
					newCus.setPhoneNumber(rs.getString(4));
					newCus.setStatus(rs.getInt(5));
				}
				
			}catch (Exception e) {
				System.out.println(e);
			}
			
			return newCus;
		}
	
	 public static String Decryp(String password) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {	
			String psw = password.toString();
			String decryp="";
			String temp="";
			for (int i=0; i<= psw.length()-1;i++) {
				temp+=  psw.charAt(i);
				
				if( ( (Integer.parseInt(temp) > 64 && Integer.parseInt(temp) <123) || (Integer.parseInt(temp) > 47 && Integer.parseInt(temp) < 58) )) {	
					decryp+= (char) Integer.parseInt(temp);
					
					temp="";
				}
			}
			
			return decryp;
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub*
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Customer customer = getCustomer(request.getParameter("email"));	
		try {
			if (customer==null) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Email không tồn tại!');");
				out.println("window.location = 'forgot-password.jsp';");
				out.println("</script>");
				return;
			}
		

			
			String text = "Email của bạn là: "+ customer.getEmail() + "\n" + "Mật khẩu: " + Decryp(Decryp(customer.getPassword())) +
					"\n" + "====================================================";
			
			sendMail(customer.getEmail(),text);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email đã gửi! Kiếm tra trong hòm thư để lấy lại mật khẩu!');");
			out.println("window.location = 'forgot-password.jsp';");
			out.println("</script>");
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
