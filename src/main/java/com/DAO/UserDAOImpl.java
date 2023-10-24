package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	// Register
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			// code to insert values in DB which we got from UI
			String sql = "insert into users (name,email,phoneno,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// Login
	@Override
	public User login(String email, String password) {
		User us = null;
		try {
			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
				// System.out.println(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
			String sql = "select * from users where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean updateProfile(User u) {
		boolean f = false;
		try {

			String sql = "update users set name=?,email=?,phoneno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhoneno());
			ps.setInt(4, u.getId());

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
	public boolean updateAddress(User u) {
		boolean f = false;
		try {

			String sql = "update users set address=?,landmark=?,city=?,state=?,pincode=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getAddress());
			ps.setString(2, u.getLandmark());
			ps.setString(3, u.getCity());
			ps.setString(4, u.getState());
			ps.setString(5, u.getPincode());
			ps.setInt(6, u.getId());

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
	public boolean checkUserExist(String email) {
		boolean f = true;
		try {

			String sql = "Select * from users where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	
}
