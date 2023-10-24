package com.admin.servelets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/edit_book")
public class EditBook_Servelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookname = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			BookDtls b = new BookDtls();
			b.setBookName(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			b.setBookId(id);

			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBook(b);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succmsg", "Book updated successfully...");
				resp.sendRedirect("Admin/all_books.jsp");
			} else {
				session.setAttribute("failmsg", "Something went wrong!");
				resp.sendRedirect("Admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
