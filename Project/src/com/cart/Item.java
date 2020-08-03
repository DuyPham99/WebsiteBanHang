package com.cart;

import com.admin.product.Product;

public class Item {
	String email;
	String idProduct;
	String name;
	int price;
	int quantity=0;
	int total=0;
	int discount=0;
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	String pathImage;
	public String getEmail() {
		return email.trim();
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdProduct() {
		return idProduct.trim();
	}
	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getPathImage() {
		return pathImage.trim();
	}
	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}
	
}
