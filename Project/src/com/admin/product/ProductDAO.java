package com.admin.product;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductDAO {
	public void InsertProduct(Product product) throws SQLException;
	public void DeleteProduct(String idProduct) throws SQLException;
	public void UpdateProduct(Product product,String idProduct) throws SQLException;
	
	//admin
	public ArrayList<Product> getListProduct() throws SQLException;
	public Product getProduct(String id) throws SQLException;
	
}
