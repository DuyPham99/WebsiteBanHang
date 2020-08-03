package com.cart;

import java.sql.SQLException;
import java.util.HashMap;

public interface CartDAO {
	public Cart insertItemToCart(Cart cart,String idPrudct, String emailCustomer) throws SQLException;
	public Cart deleteItemFromCart(Cart cart, String idProduct) throws SQLException;
	public Cart getCart(String email) throws SQLException;
	public void SaveCartToDB(Cart cart) throws SQLException;
	public void CreatCart(String email) throws SQLException;
}
