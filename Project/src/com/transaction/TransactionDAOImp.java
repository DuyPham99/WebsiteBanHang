package com.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import com.admin.product.Product;
import com.admin.product.ProductDAOImp;
import com.cart.Item;
import com.customer.register.MyConnectionProvider;

public class TransactionDAOImp implements TransactionDAO {
	Connection conn = MyConnectionProvider.getConnection();
	PreparedStatement ps;
	ResultSet rs;
	
	
	@Override
	public void insertTransaction(Transaction trans) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="insert into [Transaction] values (?,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, trans.getPhoneNumber());
		ps.setString(2, trans.getFullName());
		long time = trans.getDate().getTime();
		ps.setTimestamp(3,new Timestamp(time));
		ps.setString(4, trans.getAddress());
		ps.setString(5, trans.getProvine());
		ps.setInt(6, trans.getTotal());
		ps.setInt(7, trans.getStatus());
		ps.setString(8, trans.getNote());
		ps.setString(9, trans.getEmailCustomer());
		ps.setInt(10, trans.getDiscount());
		ps.executeUpdate();
		
		sql="SELECT MAX(idTransaction) AS MAXID FROM [Transaction]";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		int id = 0;
		if(rs.next()) id = rs.getInt("MAXID");
		Product product = null;
		for(Item item: trans.getList().values()) {
			sql="insert into itemTransaction values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, item.getIdProduct());
			ps.setInt(3, item.getQuantity());
			ps.setInt(4, item.getTotal());
			ps.executeUpdate();
			new ProductDAOImp().UpdateQuantity(item.getIdProduct(), item.getQuantity());
		}
		
	}

	@Override
	public void deleteTransaction(int id) throws SQLException {
		// TODO Auto-generated method stub
		String sql="delete from itemTransaction where idTransaction=" + id +"";
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		sql="delete from [Transaction] where idTransaction=" + id;
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		
		

	}

	@Override
	public Transaction getTransaction(String id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from [Transaction] where idTransaction='" + id + "'" + "ORDER BY idTransaction DESC";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		Transaction temp = new Transaction();
		HashMap< String  , Transaction> listTemp = new HashMap< String  , Transaction>();
		if (rs.next()) {
			temp  = new Transaction();
		    id = Integer.toString(rs.getInt(1));
			temp.setPhoneNumber(rs.getString(2));
			temp.setFullName(rs.getString(3));
			temp.setDate(rs.getDate(4));
			temp.setAddress(rs.getString(5));
			temp.setProvine(rs.getString(6));
			temp.setTotal(rs.getInt(7));	
			temp.setStatus(rs.getInt(8));
			temp.setNote(rs.getString(9));
			temp.setEmailCustomer(rs.getString(10));
			temp.setList(getItem(id));
			
			int quantity=0;
			for(Item item: temp.getList().values()) {
				quantity+= item.getQuantity();
			}
			temp.setQuantity(quantity);
			listTemp.put(id, temp);
			return temp;
		}
		
		return null;
	}

	public HashMap<String, Item> getItem(String id) throws SQLException{
		String sql = "select * from itemTransaction where idTransaction=" + id;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		HashMap<String, Item> list = new HashMap<String, Item>(); ;
		Item item;
		
		while(rs.next()) {
			item  = new Item();
		//	id = Integer.toString(rs.getInt(1));
			item.setIdProduct(rs.getString(2));
			item.setQuantity(rs.getInt(3));
			item.setTotal(rs.getInt(4));
			item.setName(new ProductDAOImp().getProduct(item.getIdProduct()).getName());
			item.setDiscount(new ProductDAOImp().getProduct(item.getIdProduct()).getDiscount());
			item.setPrice(new ProductDAOImp().getProduct(item.getIdProduct()).getPrice());
			list.put(item.getIdProduct(), item);
		}
		
		return list;
	}
	@Override
	public HashMap<String, Transaction> getListTransaction() throws SQLException {
		
		HashMap<String,Transaction> list = new HashMap<String, Transaction>();
		Transaction temp = null;
		String id = null;
		String sql = "SELECT * FROM [Transaction] ORDER BY idTransaction DESC;"; 
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {	
			
			temp  = new Transaction();
			id = Integer.toString(rs.getInt(1));
			temp.setPhoneNumber(rs.getString(2));
			temp.setFullName(rs.getString(3));
			temp.setDate(rs.getDate(4));
			temp.setAddress(rs.getString(5));
			temp.setProvine(rs.getString(6));
			temp.setTotal(rs.getInt(7));	
			temp.setStatus(rs.getInt(8));
			temp.setNote(rs.getString(9));
			temp.setEmailCustomer(rs.getString(10));
			temp.setList(getItem(id));
			
			int quantity=0;
			for(Item item: temp.getList().values()) {
				quantity+= item.getQuantity();
			}
			temp.setQuantity(quantity);
			list.put(id, temp);	
		
		}
		return list;
	}
	int getDiscount(HashMap<String, Item> list) throws SQLException {
		int discount=0;
		int total=0;
		
		for(Item x: list.values()) {
			total += new ProductDAOImp().getProduct(x.getIdProduct()).getPrice() * x.getQuantity();
			discount+=x.getTotal();
		}
		
		return total-discount;
		
	}
	public ArrayList<Product> getBestSeller() throws SQLException{
		String sql="select distinct top(10) Product.idProduct, itemTransaction.quantity\r\n" + 
				"from Product left join itemTransaction on Product.idProduct = itemTransaction.idProduct\r\n" + 
				"order by  itemTransaction.quantity desc \r\n" + 
				"";
		ArrayList<Product> list = new ArrayList<Product>();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			list.add(new ProductDAOImp().getProduct(rs.getString(1)));
		}
		return list;
		
	}
	public void changeStatus(String id, int status) throws SQLException {
		String sql="update [Transaction] set status=? where idTransaction=" + id +"";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, status);
		ps.executeUpdate();	
	}
	
}
