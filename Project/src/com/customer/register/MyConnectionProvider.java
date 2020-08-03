package com.customer.register;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnectionProvider implements MyProvider {
	static Connection conn=null;
	public static Connection getConnection() {
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url,usr,psw); 
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return conn;
	}
}
