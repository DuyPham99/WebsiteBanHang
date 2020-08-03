package com.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.admin.product.Product;

public class Cart {
	String email;
	// check in cart already product then plus quantity
	HashMap<String, Item> listItem = new HashMap<String, Item>();
	int quantity=0;
	int total=0;
	public String getEmail() {
		return email.trim();
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public HashMap<String, Item> getListItem() {
		return listItem;
	}
	public void setListItem(HashMap<String, Item> listItem) {
		this.listItem = listItem;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

}
