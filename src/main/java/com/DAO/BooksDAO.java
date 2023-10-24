package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BooksDAO {
	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBooks();

	public BookDtls getBookByID(int id);

	public Boolean updateEditBook(BookDtls b);

	public Boolean DeleteBook(int id);

	public List<BookDtls> GetNewBooks();

	public List<BookDtls> GetRecentBooks();

	public List<BookDtls> GetOldBooks();

	public List<BookDtls> GetAllNewBooks();

	public List<BookDtls> GetAllRecentBooks();

	public List<BookDtls> GetAllOldBooks();
	
	public List<BookDtls> GetBookBySearch(String ch);

}
