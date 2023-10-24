package com.DAO;

import java.awt.print.Printable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDaoimpl implements BookOrderDao {

	private Connection conn;

	public BookOrderDaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean SaveOrder(List<BookOrder> bo) {
		boolean f = false;
		try {

			String sql = "Insert into orders (orderId,userName,email,address,phoneno,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (BookOrder b : bo) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getPhoneNumber());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrder> getOrders(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;

		try {

			String sql = "Select * from orders where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUserName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhoneNumber(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookOrder> getOrdersAdmin() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;

		try {

			String sql = "Select * from orders";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUserName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhoneNumber(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	
}
