package com.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

import com.admin.product.Product;
import com.admin.product.ProductDAOImp;
import com.customer.register.MyConnectionProvider;

public class CartDAOImp implements CartDAO {
	Connection conn = MyConnectionProvider.getConnection();
	PreparedStatement ps;
	ResultSet rs;
	
	public String getPath(String temp) {
		String[] x = temp.split("\\?");
		return x[0];
	}
	
	@Override
	public Cart insertItemToCart(Cart cart,String idProduct, String emailCustomer) throws SQLException {
		// TODO Auto-generated method stub
		if(!cart.listItem.containsKey(idProduct)) {
			Item newItem = new Item();
			newItem.setEmail(emailCustomer);
			newItem.setIdProduct(idProduct);
			newItem.quantity++;
			newItem.setPrice(new ProductDAOImp().getProduct(idProduct).getPrice());
			newItem.setDiscount(new ProductDAOImp().getProduct(idProduct).getDiscount());
			newItem.total+=newItem.price - (new ProductDAOImp().getProduct(idProduct).getPrice() * new ProductDAOImp().getProduct(idProduct).getDiscount() / 100);
			newItem.setPathImage(getPath(new ProductDAOImp().getProduct(idProduct).getPathImage()));
			newItem.setName(new ProductDAOImp().getProduct(idProduct).getName());
			cart.listItem.put(newItem.getIdProduct(), newItem);
			cart.quantity++;
			cart.total+=newItem.getTotal();
			cart.setEmail(emailCustomer);	
		} else {
			//cart.listItem.get(idProduct).setEmail(cart.email);
			//cart.listItem.get(idProduct).setIdProduct(idProduct);
			//cart.listItem.get(idProduct).setPathImage(getPath(new ProductDAOImp().getProduct(idProduct).getPathImage()));
			
			cart.listItem.get(idProduct).quantity++;
			cart.listItem.get(idProduct).total += cart.listItem.get(idProduct).getPrice() - (cart.listItem.get(idProduct).getPrice()*cart.listItem.get(idProduct).getDiscount()/100);
			cart.quantity++;
			cart.total+= cart.listItem.get(idProduct).getPrice()-(cart.listItem.get(idProduct).getPrice()*cart.listItem.get(idProduct).getDiscount()/100);
		}
		// product already
		
		return cart;
	}

	@Override
	public Cart deleteItemFromCart(Cart cart,String idProduct) throws SQLException {
		// TODO Auto-generated method stub
		Product product = new ProductDAOImp().getProduct(idProduct);	
		cart.quantity -= cart.listItem.get(idProduct).quantity;
		cart.total-=cart.listItem.get(idProduct).total;
		cart.listItem.remove(idProduct);
		SaveCartToDB(cart);
		return cart;
	}
	
	public HashMap<String, Item> getListItem(String email) throws SQLException{
		HashMap<String, Item> list = new HashMap<String, Item>();
		Item item ;
		String sql="select Item.* from Cart,Item where Cart.emailCustomer = Item.email and Item.email='"+email+"'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			item = new Item();
			item.idProduct = rs.getString(1);
			item.email = rs.getString(2);
			item.price = rs.getInt(3);
			item.quantity = rs.getInt(4);
			item.total = rs.getInt(5);
			item.pathImage = rs.getString(6);
			item.setName(new ProductDAOImp().getProduct(item.idProduct).getName());
			list.put(item.idProduct, item);
		}
		sql = "delete from Item where email='" + email + "'";
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		return list;
	}
	
	@Override
	public Cart getCart(String email) throws SQLException {
		// TODO Auto-generated method stub
		Cart cart = null ;
	
		String sql="select * from Cart where emailCustomer='"+email+"'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(); 
		cart = new Cart();
		if(rs.next()) {
		cart.setEmail(rs.getString(1));
		cart.setQuantity(rs.getInt(2));
		cart.setTotal(rs.getInt(3));
		cart.setListItem(getListItem(email));
		} else {
			
		}
		
		sql = "update Cart set quantity=0,total=0 where emailCustomer='"+email+"'";
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		
		
		return cart;
	}

	@Override
	public void SaveCartToDB(Cart cart) throws SQLException {
		// TODO Auto-generated method stub
		if (cart==null) return;
		System.out.println(cart.getEmail());
		conn = new MyConnectionProvider().getConnection();
		String sql;
		sql="select * from Cart where emailCustomer='" + cart.getEmail() + "'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next())
		{
		sql = "update Cart set quantity=?,total=? where emailCustomer='" + cart.email + "'";
		ps = conn.prepareStatement(sql);
		//ps.setString(1, cart.email);
		ps.setInt(1,cart.quantity);
		ps.setInt(2, cart.total);
		ps.executeUpdate();
		}
		
		for(Item item:cart.listItem.values()) {	
			sql = "insert into [Item] values (?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, item.getIdProduct().trim());
			ps.setString(2, item.getEmail().trim());
			ps.setInt(3,item.price);
			ps.setInt(4, item.quantity);
			ps.setInt(5, item.total);
			ps.setString(6, item.getPathImage());
			ps.executeUpdate();
		}
	}

	@Override
	public void CreatCart(String email) throws SQLException {
		// TODO Auto-generated method stub
		String sql="insert into Cart values(?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setInt(2, 0);
		ps.setInt(3, 0);
		ps.executeUpdate();	
	}
	
	public void UpdateQuantity(Cart cart,String idProduct, int quantity) throws SQLException {
		
		cart.getListItem().get(idProduct).quantity--;
		cart.getListItem().get(idProduct).total-= cart.getListItem().get(idProduct).price - (cart.getListItem().get(idProduct).price * cart.getListItem().get(idProduct).discount /100);
		
		cart.quantity--;
		cart.total-=cart.getListItem().get(idProduct).price - (cart.getListItem().get(idProduct).price * cart.getListItem().get(idProduct).discount /100);
		
	}
}
