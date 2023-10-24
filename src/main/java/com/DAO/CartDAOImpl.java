package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addToCart(Cart c) {
		boolean f = false;
		try {

			String SQL = "INSERT Into cart (bid,userid,bookName,author,price,totalPrice) values(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthorName());
			ps.setString(5, c.getPrice());
			ps.setString(6, c.getTotalPrice());

			int a = ps.executeUpdate();

			if (a == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		int totalPrice = 0;
		try {
			String SQL = "Select * from cart where userid=?";

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthorName(rs.getString(5));
				c.setPrice(rs.getString(6));

				totalPrice = totalPrice + Integer.parseInt(rs.getString(7));
				c.setTotalPrice(Integer.toString(totalPrice));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		boolean f = false;

		try {
			String sql = "delete from cart where bid=? and userid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteCartAfterOrder(int uid) {
		boolean f = false;

		try {
			String sql = "delete from cart where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, uid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(f);
		return f;
	}

}
