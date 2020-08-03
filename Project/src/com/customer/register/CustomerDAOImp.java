package com.customer.register;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class CustomerDAOImp implements CustomerDAO {

	static Connection conn;
	PreparedStatement ps;
	@Override
	public int insertCustomer(Customer c) {
		// TODO Auto-generated method stub
		int status = 0;
		try {
			conn = MyConnectionProvider.getConnection();
			ps = conn.prepareStatement("insert into Account values(?,?,?,?,?)");
			ps.setString(1, c.getEmail());
			ps.setString(2, c.getPassword());
			ps.setString(3, c.getFullName());
			ps.setString(4, c.getPhoneNumber());
			// auto set customer 1
			//ps.setInt(5, c.getPosition());
			// set enable 1  
			ps.setInt(5, 1);
			status = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
			System.out.println("insert");
		}
		return status;
	}
	public String Encryp(String password) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		String encryp="";
		for (int i=0; i<= password.length()-1; i++) {
			encryp+= Integer.toString( (int) password.charAt(i));
		}
		return encryp;
	}
	@Override
	public Customer getCustomer(String mail, String psw) {
		// TODO Auto-generated method stub
		Customer newCus= new Customer();
		try {
			conn = MyConnectionProvider.getConnection();
			ps = conn.prepareStatement("select * from Account where mail=? and password=?");		
			ps.setString(1, mail);
			ps.setString(2, Encryp(psw));
			ResultSet rs = ps.executeQuery();
			
			//if(rs.next()==false) return null;
			while(rs.next()) {	
				newCus.setEmail(rs.getString(1));
				newCus.setPassword(rs.getString(2));
				newCus.setFullName(rs.getString(3));
				newCus.setPhoneNumber(rs.getString(4));
				return newCus;
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	public  Customer CheckEmailAlready(String mail) {
		// TODO Auto-generated method stub
		Customer newCus= new Customer();
		try {
			conn = MyConnectionProvider.getConnection();
			ps = conn.prepareStatement("select * from Account where mail=?");		
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {	
				return newCus;
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	public void DeleteCustomer(String mail) throws SQLException {
		conn = MyConnectionProvider.getConnection();
		ps = conn.prepareStatement("delete from Item where email='" + mail + "'");
		ps.executeUpdate();
		ps = conn.prepareStatement("delete from Account where mail='" + mail + "'");
		ps.executeUpdate();
		ps = conn.prepareStatement("delete from Cart where emailCustomer='" + mail + "'");
		ps.executeUpdate();
		ps.close();
	}
	public void UpdateCustomer(Customer customer) throws SQLException {
		conn = MyConnectionProvider.getConnection();
		PreparedStatement ps = conn.prepareStatement("update Account set password=?,fullName=?,phoneNumber=? where mail=?");
		ps.setString(1, customer.password);
		ps.setString(2, customer.getFullName());
		ps.setString(3, customer.getPhoneNumber());
		ps.setString(4, customer.getEmail());
		ps.executeUpdate();
	}
	public void ChangePassword(String email,String psw) throws SQLException {
		conn = MyConnectionProvider.getConnection();
		PreparedStatement ps = conn.prepareStatement("update Account set password=? where mail='" + email + "'");
		ps.setString(1, psw);
		ps.executeUpdate();
	}

}
