package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BooksDAOImpl implements BooksDAO {

	private Connection conn;

	public BooksDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "Insert into book_dtls (Book_Name,Author,Price,Book_Category,Status,Photo,User_Email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());

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
	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BookDtls getBookByID(int id) {

		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where Book_ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public Boolean updateEditBook(BookDtls b) {
		boolean f = false;

		try {
			String sql = "update book_dtls set Book_Name=?,Author=?,Price=?,Status=? where Book_ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

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
	public Boolean DeleteBook(int id) {
		boolean f = false;
		try {

			String sql = "Delete from book_dtls where Book_ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDtls> GetNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Book_Category=? and Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDtls> GetRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDtls> GetOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Book_Category=? and Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public List<BookDtls> GetAllNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Book_Category=? and Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDtls> GetAllRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDtls> GetAllOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Book_Category=? and Status=? Order by Book_ID desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDtls> GetBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "SELECT * FROM book_dtls where Book_Name like ? or Author like ? or Book_Category like ? and Status ='Active'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2).trim());
				b.setAuthor(rs.getString(3).trim());
				b.setPrice(rs.getString(4).trim());
				b.setBookCategory(rs.getString(5).trim());
				b.setStatus(rs.getString(6).trim());
				b.setPhoto(rs.getString(7).trim());
				b.setEmail(rs.getString(8).trim());

				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

	
	
}
