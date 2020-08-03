package com.customer.register;

import java.sql.SQLException;

public interface CustomerDAO {
	public int insertCustomer(Customer c);
	public Customer getCustomer(String email, String psw);
	public void DeleteCustomer(String idCustomer) throws SQLException;
	public void UpdateCustomer(Customer customer) throws SQLException;
	
}
