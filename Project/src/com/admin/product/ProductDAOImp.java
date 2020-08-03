package com.admin.product;

import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import com.customer.register.MyConnectionProvider;

public  class ProductDAOImp implements ProductDAO {
	Connection conn = MyConnectionProvider.getConnection();
	PreparedStatement ps = null;
	ResultSet rs;
	@Override
	public void InsertProduct(Product product) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into Product values(?,?,?,?,?,?,?,?)";
		PreparedStatement prep = conn.prepareStatement("insert into Product values(?,?,?,?,?,?,?,?)");
		prep.setString(1, product.getIdProduct());
		prep.setString(2, product.getName());
		prep.setString(3, product.getDescription());	
		prep.setString(4, product.getKind());
		prep.setInt(5, product.getPrice());
		prep.setInt(6, product.getAmount());
		prep.setInt(7, product.getDiscount());
		prep.setString(8, product.getPathImage());
		//prep.close();
		prep.executeUpdate();
	}

	@Override
	public void DeleteProduct(String idProduct) throws SQLException {
		// TODO Auto-generated method stub
		//delete from Item
		String sql = "delete from Item where idProduct=?";
		PreparedStatement prep = conn.prepareStatement(sql);
		prep.setString(1, idProduct);
		prep.executeUpdate();
		
		//delete from Product
		sql = "delete from Product where idProduct=?";
		prep = conn.prepareStatement(sql);
		prep.setString(1, idProduct);
		prep.executeUpdate();
		prep.close();
	}

	@Override
	public void UpdateProduct(Product product,String idProduct) throws SQLException {
		// TODO Auto-generated method stub
		String sql = " update Product set idProduct=?,name=?,description=?,kind=?,price=?,amount=?,discount=?,pathImage=?where idProduct=?";
		PreparedStatement prep = conn.prepareStatement( "update Product set idProduct=?,name=?,description=?,kind=?,price=?,amount=?,discount=?,pathImage=? where idProduct=?");
		
		prep.setString(1, product.getIdProduct());
		prep.setString(2, product.getName());
		prep.setString(3, product.getDescription());
		prep.setString(4, product.getKind());
		prep.setInt(5, product.getPrice());
		prep.setInt(6, product.getAmount());
		prep.setInt(7, product.getDiscount());
		prep.setString(8, product.getPathImage());
		prep.setString(9, product.getIdProduct());
		prep.executeUpdate();
	}

	@Override
	public ArrayList<Product> getListProduct() throws SQLException {
		// TODO Auto-generated method stub
		String sql="select * from Product";
		Product product;
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			product = new Product();
			product.setIdProduct(rs.getString(1));
			product.setName(rs.getString(2));
			product.setDescription(rs.getString(3));
			product.setKind(rs.getString(4));
			product.setPrice(rs.getInt(5));
			product.setAmount(rs.getInt(6));
			product.setDiscount(rs.getInt(7));
			product.setPathImage(rs.getString(8));
			list.add(product);
		}
		
		
		return list;
	}

	@Override
	public Product getProduct(String id) throws SQLException {
		String sql="select * from Product where idProduct='" + id + "'";
		Product product= new Product();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {	
			product.setIdProduct(rs.getString(1));
			product.setName(rs.getString(2));
			product.setDescription(rs.getString(3));
			product.setKind(rs.getString(4));
			product.setPrice(rs.getInt(5));
			product.setAmount(rs.getInt(6));
			product.setDiscount(rs.getInt(7));
			product.setPathImage(rs.getString(8));
		}
		return product;
	}
	public String[] getPathImage(String path) {
		String[] pathImage = path.split("\\?");
		return pathImage;
	}
	
	public String[] getDiscription(String temp){
			String[] discription = temp.split("\\n");
			return discription;
		}
	public String getFormatMoney(int money) {
		Locale 	locale = new Locale("vi","VN");
		NumberFormat format = NumberFormat.getCurrencyInstance(locale);
		format.setRoundingMode(RoundingMode.HALF_UP);
		return format.format(money);
	}
	public ArrayList<Product> getNewProduct() throws SQLException{
		ArrayList<Product> list = new ArrayList<Product>();
		String sql="select top(10) idProduct\r\n" + 
				"from Product\r\n" + 
				"order by stt desc";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			list.add(getProduct(rs.getString(1)));
		}

		return list;
		
	}
	public ArrayList<Product> getBigDiscount() throws SQLException{
		String sql="select top(3) idProduct\r\n" + 
				"from Product\r\n" + 
				"order by discount desc";
		ArrayList<Product> list = new ArrayList<Product>();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			list.add(getProduct(rs.getString(1)));
		}	
		return list;
	}
	public ArrayList<Product> getProductRandom() throws SQLException{
		String sql="select top(4) idProduct\r\n" + 
				"from Product\r\n" + 
				"order by NEWID()";
		ArrayList<Product> list = new ArrayList<Product>();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			list.add(getProduct(rs.getString(1)));
		}	
		return list;
	}
	
	public ArrayList<Product> getKindProduct(String kind,String idProduct) throws SQLException{
		String sql="select idProduct from Product where kind='" + kind + "' and idProduct!='" + idProduct + "'";
		ArrayList<Product> list = new ArrayList<Product>();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			list.add(getProduct(rs.getString(1)));
		}	
		return list;
	}
	// truyen vo idProduct va so luong ban ra
	public void UpdateQuantity(String idProduct,int quantity) throws SQLException {
		String sql = "update Product set amount=? where idProduct='" + idProduct + "'";
		int newQuantity = getProduct(idProduct).getAmount() - quantity;
		ps = conn.prepareStatement(sql);
		ps.setInt(1, newQuantity);
		ps.executeUpdate();
	}
}
