package com.admin.product;

public class Product {
	 //khong qua 10 ky tu
	public String getIdProduct() {
		return idProduct.trim();
	}
	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}
	public String getName() {
		return name.trim();
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description.trim();
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getKind() {
		return kind.trim();
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	String idProduct;
	String name;
	String description;
	String kind;
	int price;
	int amount;
	int discount;
	String pathImage;
	public String getPathImage() {
		return pathImage;
	}
	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}
	public void setInit(String id,String name, String des, String kind, int price, int amount, int discount, String path) {
		this.idProduct = id;
		this.name = name;
		this.description = des;
		this.kind = kind;
		this.price = price;
		this.amount = amount;
		this.discount = discount;
		this.pathImage = path;
	}
}
