package com.transaction;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;

import com.cart.Item;

public class Transaction {
	String emailCustomer ="";
	String phoneNumber;
	String fullName;
	int discount=0;
	Date date = new Date();
	String address;
	String provine;
	String note;
	int quantity;
	int total;
	// 1:dang giao 2:thanh cong 0:Huy
	int status=1;
	HashMap<String, Item> list;
	public Date getDate() {
		
		return this.date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public HashMap<String, Item> getList() {
		return list;
	}
	public void setList(HashMap<String, Item> list) {
		this.list = list;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmailCustomer() {
		return emailCustomer.trim();
	}
	public void setEmailCustomer(String emailCustomer) {
		this.emailCustomer = emailCustomer;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getFullName() {
		return fullName.trim();
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address.trim();
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProvine() {
		return provine.trim();
	}
	public void setProvine(String provine) {
		this.provine = provine;
	}
	public String getNote() {
		return note.trim();
	}
	public void setNote(String note) {
		this.note = note;
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
